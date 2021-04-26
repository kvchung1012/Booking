﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Booking.Web.Common
{
    public static class MailService
    {
        public static void SendEmail(string email, string pass)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = true,
                Credentials = new NetworkCredential("khuatchung1012@gmail.com", "Chung1012@tx"),
            };
            var mes = new MailMessage("khuatchung1012@gmail.com", email)
            {
                Subject = "Send to you password of app Booking",
                Body = "Mật khẩu mới của bạn là : " + pass,
            };
            smtp.Send(mes);
        }
    }
}