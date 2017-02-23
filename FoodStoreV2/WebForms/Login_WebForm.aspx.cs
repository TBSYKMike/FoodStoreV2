using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class Login_WebForm : System.Web.UI.Page
    {
        private Boolean redirectToCart = false;
        private DatabaseConnector databaseConnector;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            bool qKeys = Request.QueryString.HasKeys();
            if (qKeys)
            {
                if (Request.QueryString["param1"] == "cartLogin")
                {
                    redirectToCart = true;
                    cartLoginRequireLabel.Visible = true;
                }
            }

            emailTextBox.Focus();
            databaseConnector = new DatabaseConnector();
            captcha.Visible = false;
            if(Session["failedLoginAttempts"] != null)
            {
                if (((int)Session["failedLoginAttempts"]) >= 3)
                {
                    captcha.Visible = true;
                }
            }
            else
            {
                Session.Add("failedLoginAttempts", 0);
            }
        }


        protected void registerButton_Click(object sender, EventArgs e)
        {        
                if (databaseConnector.checkUserCredentials(emailTextBox.Text, passwordTextBox.Text))
                {
                     if (captcha.Visible) {
                        var encodedResponse = Request.Form["g-Recaptcha-Response"];
                        VerifyReCaptcha captcha = new VerifyReCaptcha();
                        bool isCaptchaValid = captcha.verifyCapcha(encodedResponse);
                             if (isCaptchaValid)
                             {
                                succesfulLogIn();
                                System.Diagnostics.Debug.WriteLine("You are a real person");
                             }
                             else
                             {
                                 System.Diagnostics.Debug.WriteLine("You are not human!");
                                 robotLabel.Visible = true;
                                 wrongEmailOrPasswordLabel.Visible = false;
                             }
                     }
                     else
                     {
                           succesfulLogIn();
                     }

                }
                else
                {   
                         System.Diagnostics.Debug.WriteLine("NOT logged in");
                         int newValue = (int)Session["failedLoginAttempts"] + 1;
                         Session.Add("failedLoginAttempts", newValue);
                         wrongEmailOrPasswordLabel.Visible = true;
                }
            }
            
            private void succesfulLogIn()
            {
                
                Customer customer = databaseConnector.getCustomerObject(emailTextBox.Text);
            if (customer.getIsActive() == 1)
            {
                accountActivatedLabel.Visible = false;
                System.Diagnostics.Debug.WriteLine("logged in");
                SessionValues sessionValues = new SessionValues();
                sessionValues.setLoginSession(customer);
                // Session.Add("currentLogedInUserObject", customer);
                //Session.Add("logedInStatus", true);
                // Response.Redirect("ShoppingPage_WebForm.aspx");
                if (redirectToCart)
                {
                    Response.Redirect("ShoppingCart_WebForm.aspx");
                }
                else
                {
                    Response.Redirect("ShowAndEditProfile_WebForm.aspx");
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Customer is not activated");
                accountActivatedLabel.Visible = true;
            }
            
        }

        protected void forgotPasswordButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword_WebForm.aspx");
        }

        protected void registerButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Register_WebForm.aspx");
        }
    }
    
}