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
        readonly ILessorService commonService;
        public HomeController(ILessorService commonService)
        {
            this.commonService = commonService;
        }
        public ActionResult Index()
        {
            return View();
        }

        //[HttpPost]
        //public async Task<JsonResult> GetObj(int Id)
        //{
        //    return Json(await commonService.GetObjectById<TheLessor>(Id));
        //}

        //[HttpPost]
        //public async Task<JsonResult> Add(Unit unit)
        //{
        //    return Json(await commonService.AddOrUpdate<Unit>(unit));
        //}

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}