using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodStoreV2.CSharpClasses;

namespace FoodStoreV2.WebForms
{
    public partial class Payment_WebForm : System.Web.UI.Page
    {
        private SessionValues sessionValues = new SessionValues();

        protected void Page_Load(object sender, EventArgs e)
        {
            setUserDetails();

        }
        private void setUserDetails()
        {
            Customer customer = sessionValues.getCustomerSessionObject();
            StringBuilder userInformation = new StringBuilder();
            userInformation.Append("Order will be sent to:   <br />");
            userInformation.Append("Name:   " + customer.getName() + "<br />");
            userInformation.Append("Adress:   " + customer.getStreetAdress() + ", " + customer.getPostCode() + ", " + customer.getCity() + "<br />");
            userInformation.Append("Email:   " + customer.getEmailAdress());
            userDetailsLabel.Text = userInformation.ToString();
        }
        protected void redirectToEditProfile(object sender, EventArgs e)
        {
            Response.Redirect("ShowAndEditProfile_WebForm");
        }
    }
}