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
    public class UtilitiController : Controller
    {
        // GET: Admin/Utiliti
        private readonly IUtilitiService _utilitiService;
        public UtilitiController(IUtilitiService utilitiService)
        {
            _utilitiService = utilitiService;
        }
        [CustomAuthorize]
        public ActionResult Index(int Id)
        {
            Session["UtilitiId"] = Id;
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetFormAddOrEdit(int Id)
        {
            ViewBag.parentId = (int)Session["UtilitiId"];
            if (Id == 0)
                return PartialView(null);
            else
                return PartialView(await _utilitiService.GetObjectById(Id));
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var tst = Session["UtilitiId"].ToString();
            var filter = new Booking.Model.ModelView.Filter()
            {
                key = "ParentId",
                value = Session["UtilitiId"].ToString()
            };
            requestData.listFilter = new List<Model.ModelView.Filter>();
            requestData.listFilter.Add(filter);
            var response = await _utilitiService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _utilitiService.GetObjectById(Id);
            return Json(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(Utiliti obj)
        {
            var response = await _utilitiService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _utilitiService.DeleteById(Id);
            return Json(response);
        }
    }
}