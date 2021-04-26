using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using Booking.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Booking.Web.Areas.Admin.Controllers
{
    public class DestinationPlaceController : Controller
    {
        // GET: Admin/DestinationPlace
        private readonly IDestinationPlaceService _destinationPlaceService;
        private readonly ICommonService _commonService;
        public DestinationPlaceController(ICommonService commonService,IDestinationPlaceService destinationPlaceService)
        {
            _destinationPlaceService = destinationPlaceService;
            _commonService = commonService;
        }
        [CustomAuthorize]
        public async Task<ActionResult> Index()
        {
            ViewBag.province = await _commonService.GetListProvince();
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetFormAddOrEdit(int Id)
        {
            ViewBag.province = await _commonService.GetListProvince();
            if (Id == 0)
                return PartialView(null);
            else
            {
                var data = await _destinationPlaceService.GetObjectById(Id);
                ViewBag.district = await _commonService.GetListDistrictByProvinceId((int)data.ProvinceId);
                return PartialView(data);
            }
        }

        [HttpPost]
        public async Task<JsonResult> GetDistrictById(int Id)
        {
            return Json(await _commonService.GetListDistrictByProvinceId(Id));
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var response = await _destinationPlaceService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _destinationPlaceService.GetObjectById(Id);
            return Json(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(DestinationPlace obj)
        {
            var response = await _destinationPlaceService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _destinationPlaceService.DeleteById(Id);
            return Json(response);
        }
    }
}