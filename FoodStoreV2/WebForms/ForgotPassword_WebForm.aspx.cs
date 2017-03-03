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
        private DatabaseConnector con = new DatabaseConnector();
        private Boolean pageRefresh;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                ViewState["postids"] = System.Guid.NewGuid().ToString();
                Session["postid"] = ViewState["postids"].ToString();
            }
            else
            {
                if (ViewState["postids"].ToString() != Session["postid"].ToString())
                {
                    pageRefresh = true;
                }
                Session["postid"] = System.Guid.NewGuid().ToString();
                ViewState["postids"] = Session["postid"].ToString();
            }
        }

        protected void forgotPasswordButton_Click(object sender, EventArgs e)
        {
            if (!pageRefresh)
            {
                //gets the email from te textbox and then checks if a user with that mail exists
                String email = emailTextBox.Text;
                String pass;

                //sends the new password via mail
                SendMail sendMail = new SendMail();
                if (!con.checkIfCollumnValueExist("customers", "email", email))
                {
                    errorMsg.Visible = false;
                    pass = createPass();
                    con.updateCustomerPassword(email, pass);
                    sendMail.mailer(email, "New Password", "Your new Password: " + pass);

                }
                else
                {
                    errorMsg.Visible = true;
                }
            }
        }

        protected String createPass()
        {
            //Creates a randomly generated password that is 10 characters long with 3 numerals
            String pass = Membership.GeneratePassword(10, 3);

            return pass;
        }
    }
}