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
                //Creates a new MailMessage object
                MailMessage msg = new MailMessage();

                //adds the subject, reciever, sender and body to the mail
                msg.To.Add(reciever);
                msg.From = new MailAddress("thatchat12345@gmail.com");
                msg.Subject = subject;
                msg.Body = message;
                msg.IsBodyHtml = true;

                //Sends the mail via the gmail smtp server
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                //Sets the credentials for our mail
                smtpClient.Credentials = new System.Net.NetworkCredential("thatchat12345@gmail.com", "TraktorBengt123");
                smtpClient.Send(msg);
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Write(ex);
            }
        }
    }
}