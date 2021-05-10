using Booking.Model.ModelView;
using Booking.Service.IService;
using Booking.Web.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace Booking.Web.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        private readonly IAdminService _adminService;
        private readonly ICommonService _commonService;

        #region Contructor
        public AdminController(IAdminService adminService, ICommonService commonService)
        {
            _adminService = adminService;
            _commonService = commonService;
        }
        #endregion
        #region Authenticate

        public ActionResult Login()
        {
            if (Request.IsAuthenticated)
            {
                return RedirectToAction("Index", "Admin");
            }
            return View();
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            var oldCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (oldCookie != null)
            {
                oldCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(oldCookie);
            }
            return RedirectToAction("LogIn", "Admin");
        }

        [HttpPost]
        public async Task<JsonResult> Login(string email, string password)
        {
            var check = await _adminService.Login(email, EncryptAndDecrypt.Encrypt(password));
            if (check == null)
                return Json(false);
            Session["Admin"] = check;
            var oldCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (oldCookie != null)
            {
                oldCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(oldCookie);
                return Json(true);
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string userData = serializer.Serialize(check);
            var ticket = new FormsAuthenticationTicket(1,
                check.Email.Trim(),
                DateTime.Now,
                //DateTime.Now.AddMinutes(FormsAuthentication.Timeout.TotalMinutes),
                DateTime.Now.AddDays(1),
                true,
                userData,
                FormsAuthentication.FormsCookiePath);

            // Encrypt the ticket.
            string encTicket = FormsAuthentication.Encrypt(ticket);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
            // Create the cookie.
            Response.Cookies.Add(cookie);
            return Json(true);
        }

        public async Task<ActionResult> ProfileUser()
        {
            var profile = Session["Admin"] as Booking.Model.Model.Admin;
            if (profile == null)
            {
                var cookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                var userData = FormsAuthentication.Decrypt(cookie.Value).UserData;
                profile = JsonConvert.DeserializeObject<Booking.Model.Model.Admin>(userData);
            }
            var user = await _adminService.GetObjectById(profile.Id);
            return View(user);
        }


        public ActionResult ForgotPasswod()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> ForGot(string email)
        {
            var random = EncryptAndDecrypt.GenarateRandomString();
            var pass = Common.EncryptAndDecrypt.Encrypt(random);
            var obj = await _adminService.ForgotPassword(email, pass);
            if (obj == true)
            {
                Common.MailService.SendEmail(email, random);
                return Json(true);
            }
            return Json(false);
        }
        #endregion

        #region Function
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
                return PartialView(await _adminService.GetObjectById(Id));
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            var response = await _adminService.GetListData(requestData);
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> GetObjectById(int Id)
        {
            var response = await _adminService.GetObjectById(Id);
            return Json(response);
        }

        public async Task<PartialViewResult> GetViewDetail(int Id)
        {
            var obj = await _adminService.GetObjectById(Id);
            var createBy = (await _adminService.GetObjectById((int)obj.CreatedBy)).Name;
            var updateBy = (await _adminService.GetObjectById((int)obj.UpdatedBy)).Name;
            var response = new ViewDetailObject<Booking.Model.Model.Admin>()
            {
                obj = obj,
                CreatedBy = createBy,
                UpdatedBy = updateBy
            };
            return PartialView(response);
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(Booking.Model.Model.Admin obj)
        {
            // check duplicate
            List<ListError> listErrors = new List<ListError>();
            if (await _commonService.CheckDuplicate<Booking.Model.Model.Admin>("Email", obj.Email))
            {
                ListError error = new ListError()
                {
                    key = "Email",
                    value = "Email đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (await _commonService.CheckDuplicate<Booking.Model.Model.Admin>("Phone", obj.Phone))
            {
                ListError error = new ListError()
                {
                    key = "Phone",
                    value = "Số điện thoại đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (await _commonService.CheckDuplicate<Booking.Model.Model.Admin>("UserName", obj.UserName))
            {
                ListError error = new ListError()
                {
                    key = "UserName",
                    value = "Tên người dùng đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (listErrors.Count() > 0)
            {
                return Json(new ResultData() { success = false, error = listErrors });
            }
            if (obj.Id == 0)
            {
                string pass = EncryptAndDecrypt.GenarateRandomString();
                obj.Password = EncryptAndDecrypt.Encrypt(pass);
                MailService.SendEmail(obj.Email, pass);
            }
            var response = await _adminService.AddOrUpdate(obj);
            return Json(new ResultData() { success = response, error = null });
        }

        [HttpPost]
        public async Task<JsonResult> DeleteById(int Id)
        {
            var response = await _adminService.DeleteById(Id);
            return Json(response);
        }
        #endregion

    }
}