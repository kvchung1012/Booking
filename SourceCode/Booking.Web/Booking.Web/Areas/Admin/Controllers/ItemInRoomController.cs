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
    public class ItemInRoomController : Controller
    {
        // GET: Admin/ItemInRoom
        private readonly IItemInRoomService _itemInRoomService;
        private readonly IUnitService _unitService;
        public ItemInRoomController(IItemInRoomService itemInRoomService,IUnitService unitService)
        {
            _itemInRoomService = itemInRoomService;
            _unitService = unitService;
        }
        [CustomAuthorize]
        public async Task<ActionResult> Index()
        {
            ViewBag.unit = (await _unitService.GetListData(new RequestData() { listFilter = null, isAsc = true, orderBy = "", pageNumber = 0, pageSize = 1 })).data;
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetFormAddOrEdit(int Id)
        {
            ViewBag.unit = (await _unitService.GetListData(new RequestData() { listFilter = null, isAsc = true, orderBy = "", pageNumber = 0, pageSize = 1 })).data;
            if (Id == 0)
                return PartialView(null);
            else
                return PartialView(await _itemInRoomService.GetObjectById(Id));
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var response = await _itemInRoomService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _itemInRoomService.GetObjectById(Id);
            return Json(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(Booking.Model.Model.ItemInRoom obj)
        {
            var response = await _itemInRoomService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _itemInRoomService.DeleteById(Id);
            return Json(response);
        }
    }
}