using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Booking.Web.Areas.Lessor.Controllers
{
    public class BuildingForRentController : Controller
    {
        // GET: Lessor/BuildingForRent
        private readonly IBuildingForRentService _buildingForRentService;
        private readonly IDestinationPlaceService _destination;
        private readonly ICategoryHouseService _category;
        private readonly IUtilitiService _utilitiService;
        private readonly ICommonService _commonService;
        public BuildingForRentController(IBuildingForRentService buildingForRentService,IDestinationPlaceService destination,ICategoryHouseService category,ICommonService commonService,IUtilitiService utilitiService)
        {
            _buildingForRentService = buildingForRentService;
            _destination = destination;
            _category = category;
            _utilitiService = utilitiService;
            _commonService = commonService;
        }
        public ActionResult Index()
        {
            return View();
        }

        public async Task<ActionResult> Create()
        {
            var fake = new RequestData()
            {
                isAsc = true,
                listFilter = null,
                orderBy = null,
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.categoryHouse = (await _category.GetListData(fake)).data;
            ViewBag.destination = (await _destination.GetListData(fake)).data;
            ViewBag.utiliti = (await _utilitiService.GetUtilities());
            return View();
        }

        public async Task<ActionResult> Edit(int Id)
        {
            var fake = new RequestData()
            {
                isAsc = true,
                listFilter = null,
                orderBy = null,
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.categoryHouse = (await _category.GetListData(fake)).data;
            ViewBag.destination = (await _destination.GetListData(fake)).data;
            ViewBag.utiliti = (await _utilitiService.GetUtilities());
            var data = await _buildingForRentService.GetObjectById(Id);
            fake.listFilter = new List<Model.ModelView.Filter>()
            {
                new Model.ModelView.Filter()
                {
                    key = "BuildingForRentId",
                    value = Id.ToString()
                }
            };
            ViewBag.images = (await _commonService.GetListData<BuildingForRentImage>(fake)).data;
            ViewBag.utilities = (await _commonService.GetListData<BuildingForRentUtilitis>(fake)).data;
            return View(data);
        }



        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            if (requestData.listFilter == null)
                requestData.listFilter = new List<Model.ModelView.Filter>();
            requestData.listFilter.Add(new Model.ModelView.Filter() { key = "TheLessorId", value = (Session["Lessor"] as TheLessor).Id.ToString() });
            var response = await _buildingForRentService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _buildingForRentService.GetObjectById(Id);
            return Json(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(BuildingForRent obj,List<BuildingForRentImage> images , List<BuildingForRentUtilitis> utilities)
        {
            obj.TheLessorId = (Session["Lessor"] as TheLessor).Id;
            var fake = new RequestData()
            {
                isAsc = true,
                listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key = "BuildingForRentId", value = obj.Id.ToString() } },
                orderBy = "",
                pageNumber = 0,
                pageSize = 1
            };
            // remove old images
            var oldImage = await _commonService.GetListData<BuildingForRentImage>(fake);
            var _ = await _commonService.RemoveRange<BuildingForRentImage>(oldImage.data);

            // remove old utilities
            var oldUtilities = await _commonService.GetListData<BuildingForRentUtilitis>(fake);
            _ = await _commonService.RemoveRange<BuildingForRentUtilitis>(oldUtilities.data);

            var response = await _buildingForRentService.AddOrUpdate(obj,images,utilities);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _buildingForRentService.DeleteById(Id);
            return Json(response);
        }
    }
}