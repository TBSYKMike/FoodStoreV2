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
    public partial class Activation_WebForm : System.Web.UI.Page
    {
        DatabaseConnector con = new DatabaseConnector();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string code = Request.QueryString["confirmationCode"];
                
                //if the activationcode is valid activate the user
                if (!con.checkIfCollumnValueExist("customers", "confirmationCode", code) && con.checkIfCustomerActive(code))
                {
                    con.activateCustomer(1, code);
                    activeLabel.Text = "Activation Successful!";
                }
                else 
                {
                    activeLabel.Text = "Invalid activation link!";
                }
            }
        }
    }
}