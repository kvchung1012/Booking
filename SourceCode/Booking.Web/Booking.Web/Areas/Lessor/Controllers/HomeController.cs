using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Booking.Web.Areas.Lessor.Controllers
{
    public class HomeController : Controller
    {
        // GET: Lessor/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}