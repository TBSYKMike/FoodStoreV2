using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class Register_WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void test_CLICK(object sender, EventArgs e)
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            Customer customer = databaseConnector.getCustomerObject("sven@live.se");
            System.Diagnostics.Debug.WriteLine(customer.getName());
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            /*   this.Validate();
               if (this.IsValid)//Needs to fulfill all validating
               {
                   System.Diagnostics.Debug.WriteLine("Tried to search for a book");
                   //Search algoritm database
                   DatabaseConnector databaseConnector = new DatabaseConnector();
                  // List<Product> productList = databaseConnector.
                   //Session.Add("productList", productList);
                   Response.Redirect("BooksPage.aspx");
               }
               else
               {

               }
               */
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            VerifyReCaptcha captcha = new VerifyReCaptcha();
            bool isCaptchaValid = captcha.verifyCapcha(encodedResponse);

            if (isCaptchaValid)
            {
                System.Diagnostics.Debug.WriteLine("You are a real person!");
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("You are not human!");
            }
        }
    }

    
}