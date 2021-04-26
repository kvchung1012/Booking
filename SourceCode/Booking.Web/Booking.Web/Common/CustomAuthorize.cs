using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

namespace Booking.Web.Common
{
    [AttributeUsage(AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class CustomAuthorize : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var noneChk = filterContext.ActionDescriptor.GetCustomAttributes(typeof(NoneCheck), true).Count() > 0;
            if (noneChk)
            {
                return;
            }
            var cookieName = FormsAuthentication.FormsCookieName;
            if (!filterContext.HttpContext.User.Identity.IsAuthenticated ||
                filterContext.HttpContext.Request.Cookies == null ||
                filterContext.HttpContext.Request.Cookies[cookieName] == null)
            {
                HandleUnauthorizedRequest(filterContext);
                return;
            }
            return;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
               new RouteValueDictionary
               {
                    { "controller", "Admin" },
                    { "action", "Login" }
               });
        }
    }
}