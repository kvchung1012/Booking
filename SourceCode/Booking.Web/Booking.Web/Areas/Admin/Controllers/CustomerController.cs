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
    public class CustomerController : Controller
    {
        // GET: Admin/Customer
        private readonly ICustomerService _customerService;
        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }
        [CustomAuthorize]
        public ActionResult Index()
        {
            return View();
        }

        [CustomAuthorize]
        [HttpPost]
        public async Task<PartialViewResult> GetFormAddOrEdit(int Id)
        {
            if (Id == 0)
                return PartialView(null);
            else
                return PartialView(await _customerService.GetObjectById(Id));
        }

        [CustomAuthorize]
        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var response = await _customerService.GetListData(requestData);
            return PartialView(response);
        }

        [CustomAuthorize]
        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _customerService.GetObjectById(Id);
            return Json(response);
        }

        [CustomAuthorize]
        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(Booking.Model.Model.Customer obj)
        {
            var response = await _customerService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [CustomAuthorize]
        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _customerService.DeleteById(Id);
            return Json(response);
        }
    }
}