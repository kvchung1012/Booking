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

namespace Booking.Web.Areas.Lessor.Controllers
{
    public class AuthenticateController : Controller
    {
        private readonly ILessorService _lessorService; 
        private readonly ICommonService _commonService;
        public AuthenticateController(ILessorService lessorService,ICommonService commonService)
        {
            _lessorService = lessorService;
            _commonService = commonService;
        }
        // GET: Lessor/Authenticate
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }


        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> Login(string email, string password)
        {
            var check = await _lessorService.Login(email, EncryptAndDecrypt.Encrypt(password));
            if (check == null)
                return Json(false);
            Session["Lessor"] = check;
            return Json(true);
        }

        [HttpPost]
        public async Task<JsonResult> Register(TheLessor obj, string confirmPass)
        {
            List<ListError> listErrors = new List<ListError>();
            if(obj.Password.Length < 8)
            {
                ListError error = new ListError()
                {
                    key = "Password",
                    value = "Mật khẩu có độ dài lớn hơn hoặc bằng 8"
                };
                listErrors.Add(error);
                if (obj.Password != confirmPass)
                {
                    ListError error1 = new ListError()
                    {
                        key = "ConfirmPassword",
                        value = "Mật khẩu xác nhận không đúng"
                    };
                    listErrors.Add(error1);
                }
            }
            if (await _commonService.CheckDuplicate<TheLessor>("Email", obj.Email))
            {
                ListError error = new ListError()
                {
                    key = "Email",
                    value = "Email đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (await _commonService.CheckDuplicate<TheLessor>("Phone", obj.Phone))
            {
                ListError error = new ListError()
                {
                    key = "Phone",
                    value = "Số điện thoại đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (await _commonService.CheckDuplicate<TheLessor>("UserName", obj.UserName))
            {
                ListError error = new ListError()
                {
                    key = "UserName",
                    value = "Tên đăng nhập đã được đăng ký"
                };
                listErrors.Add(error);
            }
            if (listErrors.Count() > 0)
                return Json(new ResultData() { success = false, error = listErrors });

            obj.Status = true;
            obj.IsDeleted = false;
            obj.Password = EncryptAndDecrypt.Encrypt(obj.Password);
            var check = await _lessorService.AddOrUpdate(obj);

            return Json(new ResultData() { success = check, error = null });
        }

    }
}