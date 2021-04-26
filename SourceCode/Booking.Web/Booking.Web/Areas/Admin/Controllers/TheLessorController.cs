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
    public class TheLessorController : Controller
    {
        // GET: Admin/TheLessor
        private readonly ILessorService _lessorService;
        public TheLessorController(ILessorService lessorService)
        {
            _lessorService = lessorService;
        }
        [CustomAuthorize]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetFormAddOrEdit(int Id)
        {
            if (Id == 0)
                return PartialView(null);
            else
                return PartialView(await _lessorService.GetObjectById(Id));
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var response = await _lessorService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _lessorService.GetObjectById(Id);
            return Json(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(TheLessor obj)
        {
            var response = await _lessorService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _lessorService.DeleteById(Id);
            return Json(response);
        }
    }
}