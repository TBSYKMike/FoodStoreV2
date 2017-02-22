using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.CSharpClasses
{
    public class SendMail
    {
        public void mailer(String reciever, String subject, String message)
        {
            try
            {
                MailMessage msg = new MailMessage();

                msg.To.Add(reciever);
                msg.From = new MailAddress("thatchat12345@gmail.com");
                msg.Subject = subject;
                msg.Body = message;
                msg.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("thatchat12345@gmail.com", "TraktorBengt123");
                smtpClient.Send(msg);
                
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}