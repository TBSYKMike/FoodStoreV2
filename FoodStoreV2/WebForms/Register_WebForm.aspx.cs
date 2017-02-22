using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class Register_WebForm : System.Web.UI.Page
    {
        private DatabaseConnector databaseConnector;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void emailExistValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            databaseConnector = new DatabaseConnector();
            args.IsValid = databaseConnector.checkIfCollumnValueExist("Customers", "email", args.Value);
        }
        protected void userNameExistValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            databaseConnector = new DatabaseConnector();
            args.IsValid = databaseConnector.checkIfCollumnValueExist("Customers", "userName", args.Value);
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            this.Validate();

            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            VerifyReCaptcha captcha = new VerifyReCaptcha();
            bool isCaptchaValid = captcha.verifyCapcha(encodedResponse);

            if (isCaptchaValid)
            {
                System.Diagnostics.Debug.WriteLine("You are a real person!");
                if (this.IsValid)//Needs to fulfill all validating
                {
                    String activationCode = Membership.GeneratePassword(10, 3);
                    SendMail sendMail = new SendMail();

                    string msg = "Hello " + userNameTextBox.Text + "!";
                    msg += "<br/>In order to use your account you need to activate it first.";
                    msg += "<br/><br/>Please click the link to activate your account: ";
                    msg += "<br/><a href = '" + Request.Url.AbsoluteUri.Replace("Register_WebForm", "Activation_WebForm.aspx?confirmationCode=" + activationCode) + "'>Activate here!</a>";
                    
                    databaseConnector = new DatabaseConnector();
                    databaseConnector.insertCustomer(nameTextBox.Text, streetAdressTextBox.Text, cityTextbox.Text, postCodetextBox.Text, emailTextBox.Text, passwordTextBox.Text, userNameTextBox.Text, 0, activationCode);
                    System.Diagnostics.Debug.WriteLine("inserted User in database");

                    sendMail.mailer(emailTextBox.Text, "Account Activation", msg);

                }

            }
            else
            {
                System.Diagnostics.Debug.WriteLine("You are not human!");
                robotLabel.Visible = true;
            }
          

        }


        /* protected void searchButton_Click(object sender, EventArgs e)
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

        //}


        protected void streetValidate(object source, ServerValidateEventArgs args)
        {
            Boolean value = true;
            Boolean space = false;
            Boolean hasNumber = false;
            if (Char.IsLetter(args.Value[0]))
            {
                System.Diagnostics.Debug.WriteLine("First is letter");
                for (int i = 0; i < args.Value.Length; i++)
                {
                    System.Diagnostics.Debug.WriteLine("For letter:   " + args.Value[i]);
                    if (Char.IsLetter(args.Value[i]))
                    {
                        if (space)
                        {
                            System.Diagnostics.Debug.WriteLine("Fail:  letter after space");
                            value = false;
                            break;
                        }
                    }
                    else if (char.IsWhiteSpace(args.Value[i]))
                    {
                        if (space)
                        {
                            System.Diagnostics.Debug.WriteLine("Fail:  space again");
                            value = false;
                            break;
                        }
                        space = true;
                    }
                    else if (Char.IsNumber(args.Value[i]))
                    {
                        if (space == false)
                        {
                            System.Diagnostics.Debug.WriteLine("Fail:  number before space");
                            value = false;
                            break;
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine("Have a number");
                            hasNumber = true;
                        }
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Not a valid character");
                        value = false;
                        break;
                    }
                }
                if (space = false || hasNumber == false)
                {
                    System.Diagnostics.Debug.WriteLine("no space and no number");
                    value = false;
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("first character is not a letter");
                value = false;
            }
            args.IsValid = value;
        }

  
    }

    
}