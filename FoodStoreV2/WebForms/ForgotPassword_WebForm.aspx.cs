using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class ForgotPassword_WebForm : System.Web.UI.Page
    {
        DatabaseConnector con = new DatabaseConnector();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgotPasswordButton_Click(object sender, EventArgs e)
        {
            String email = emailTextBox.Text;
            String pass;
            if (!con.checkIfCollumnValueExist("customers","email", email))
            {
                errorMsg.Visible = false;
                pass = createPass();
                con.updateCustomerPassword(email, pass);
                sendMail(email, pass);

            }
            else
            {
                errorMsg.Visible = true;
            }
        }

        protected void sendMail(String mail, String pass)
        {
            try
            {
                MailMessage msg = new MailMessage();

                msg.To.Add(mail);
                msg.From = new MailAddress("thatchat12345@gmail.com");
                msg.Subject = "Password recovery";
                msg.Body = "Your new password: " + pass;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("thatchat12345@gmail.com", "TraktorBengt123");
                smtpClient.Send(msg);

                Response.Write("Sent");
            }
            catch (Exception ex)
            {
                Response.Write( "Not sent " + ex.Message);
            }
        }

        protected String createPass()
        {
            String pass = Membership.GeneratePassword(10, 3);

            return pass;
        }
    }
}