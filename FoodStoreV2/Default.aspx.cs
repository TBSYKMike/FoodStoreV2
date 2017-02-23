using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodStoreV2.CSharpClasses;

namespace FoodStoreV2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected Product getRandomProduct()
        {
            DatabaseConnector dbc = new DatabaseConnector();
            Product randomProductList = dbc.getRandomProduct(false);// get onsale parameter = true; else false will generate random

            return randomProductList;
        }

    }
}