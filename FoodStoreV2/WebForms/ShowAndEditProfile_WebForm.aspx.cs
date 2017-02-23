using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class ShowAndEditProfile_WebForm : System.Web.UI.Page
    {
        private Customer oldCustomerObject;
        private DatabaseConnector databaseConnecctor;
        private SessionValues sessionValues;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessionValues = new SessionValues();
            if (sessionValues.getCustomerSessionObject() == null)
            {
                Response.Redirect("ShoppingPage_WebForm");
            }
            // oldCustomerObject = (Customer)Session["currentLogedInUserObject"];
            oldCustomerObject = sessionValues.getCustomerSessionObject();
            databaseConnecctor = new DatabaseConnector();
            if (!Page.IsPostBack)
            {
                fillTextBoxesWithOldInformation();
            }

        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            this.Validate();
            updateConfirmLabel.Visible = Page.IsValid;

            if (this.IsValid)
            {
                Customer newCustomerObject = new Customer(oldCustomerObject.getCustomerID(), nameTextBox.Text, streetAdressTextBox.Text, cityTextbox.Text, postCodetextBox.Text, emailTextBox.Text, passwordTextBox.Text, userNameTextBox.Text,1);
                updateConfirmLabel.Visible = true;
                if (newCustomerObject.getCity().Equals(oldCustomerObject.getCity()) &&  newCustomerObject.getUserName().Equals(oldCustomerObject.getUserName()) &&
                    newCustomerObject.getEmailAdress().Equals(oldCustomerObject.getEmailAdress()) && newCustomerObject.getPostCode().Equals(oldCustomerObject.getPostCode()) &&
                    newCustomerObject.getStreetAdress().Equals(oldCustomerObject.getStreetAdress()) && newCustomerObject.getName().Equals(oldCustomerObject.getName())
                    && (newCustomerObject.getUserPassword().Equals(oldCustomerObject.getUserPassword()) || newCustomerObject.getUserPassword().Equals("")))
                {
                    updateConfirmLabel.Text = "You did not alter your information";
                    System.Diagnostics.Debug.WriteLine("No changes made !!!!!!!!!!!!!!!!!!!!!!!!!!");
                }

            else
            {
                    if (passwordTextBox.Text == string.Empty)
                    {
                        System.Diagnostics.Debug.WriteLine("satte till " + oldCustomerObject.getUserPassword());
                        newCustomerObject.setUserPassword(oldCustomerObject.getUserPassword());
                        System.Diagnostics.Debug.WriteLine("nytt  " + newCustomerObject.getUserPassword());
                    }
                    databaseConnecctor.updateCustomerDetails(newCustomerObject, oldCustomerObject.getEmailAdress());
                 //   Session.Add("currentLogedInUserObject", newCustomerObject);
                    sessionValues.setLoginSession(newCustomerObject);
                    updateConfirmLabel.Text = "You profile has been updated";
                }
        }
    
}
        private void fillTextBoxesWithOldInformation()
        {
            nameTextBox.Text = oldCustomerObject.getName();
            streetAdressTextBox.Text = oldCustomerObject.getStreetAdress();
            cityTextbox.Text = oldCustomerObject.getCity();
            postCodetextBox.Text = oldCustomerObject.getPostCode();
            emailTextBox.Text = oldCustomerObject.getEmailAdress();
            oldPasswordTextBox.Text = oldCustomerObject.getUserPassword();
            userNameTextBox.Text = oldCustomerObject.getUserName();
        }

        protected void userNameExistValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value != oldCustomerObject.getUserName())
            {
                args.IsValid = databaseConnecctor.checkIfCollumnValueExist("Customers","userName",args.Value);
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void emailExistValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != oldCustomerObject.getEmailAdress())
            {
                args.IsValid = databaseConnecctor.checkIfCollumnValueExist("Customers", "email", args.Value);
            }
            else
            {
                args.IsValid = true;
            }
        }











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

        protected void oldPasswordMatchValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            System.Diagnostics.Debug.WriteLine("Look at this method!!");
            Boolean passwordMatch = false;
            if (args.Value.Equals(oldCustomerObject.getUserPassword()))
            {
                passwordMatch = true;
            }
            System.Diagnostics.Debug.WriteLine("Old password compare method + value:   " + passwordMatch);
            args.IsValid = passwordMatch;
        }
    }
}