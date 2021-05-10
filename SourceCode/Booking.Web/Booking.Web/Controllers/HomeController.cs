using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Booking.Web.Controllers
{
    public class HomeController : Controller
    {
        readonly IFrontEndService _frontEndService;
        readonly IDestinationPlaceService _destinationPlaceService;
        public HomeController(IFrontEndService frontEndService,IDestinationPlaceService destinationPlaceService)
        {
            _frontEndService = frontEndService;
            _destinationPlaceService = destinationPlaceService;
        }
        public ActionResult Index()
        {
            ViewBag.categoryhouse = _frontEndService.GetListCategoryHouse().Take(5).ToList();
            ViewBag.destination = _frontEndService.GetListDestinationPlaceModelView().Take(20).ToList();
            ViewBag.selectDestination = _frontEndService.GetListDestinationPlace().ToList();
            ViewBag.category = _frontEndService.GetCategoryModelView().Take(4).ToList();
            return View();
        }

        public async Task<ActionResult> GetRoom(int? CategoryId, int? DesId, DateTime? Start, DateTime? End, int? Stock)
        {
            var data = _frontEndService.GetRoom(CategoryId, DesId, Start, End, Stock);
            ViewBag.selectDestination = _frontEndService.GetListDestinationPlace().ToList();
            ViewBag.categoryhouse = _frontEndService.GetListCategoryHouse().ToList();

            if (DesId != null && DesId != 0)
                ViewBag.destinationName = ( await _destinationPlaceService.GetObjectById((int)DesId)).Name;
            return View(data);
        }

        public ActionResult Detail(int Id)
        {
            ViewBag.selectDestination = _frontEndService.GetListDestinationPlace().ToList();
            ViewBag.categoryhouse = _frontEndService.GetListCategoryHouse().ToList();
            var obj = _frontEndService.GetBuildingForRentById(Id);
            ViewBag.images = _frontEndService.GetBuildingForRentImages(Id);
            ViewBag.categoryName = _frontEndService.GetCategoryHouseById((int)obj.CategoryHouseId).Name;

            // get utilities
            ViewBag.utilites = _frontEndService.GetUtilities(Id);
            ViewBag.rooms = _frontEndService.GetRoomInBuildings(Id);
            return View(obj);
        }

        [HttpPost]
        public PartialViewResult GetInfor(int Id)
        {
            var data = _frontEndService.GetInforRoom(Id);
            return PartialView(data);
        }
    }
}