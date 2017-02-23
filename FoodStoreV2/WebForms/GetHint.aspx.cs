using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodStoreV2.CSharpClasses;


namespace FoodStoreV2.WebForms
{
    public partial class getHint : System.Web.UI.Page
    {
        List<String> nameList = new List<String>();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected List<String> fillList()
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            List<Product> list = databaseConnector.getProductsOnCategory(0);

            for (int i = 0; i < list.Count; i++)
            {
                nameList.Add(list[i].getName());
            }

            return nameList;
        }

    }
}