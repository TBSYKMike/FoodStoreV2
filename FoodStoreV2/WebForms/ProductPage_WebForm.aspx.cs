using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodStoreV2.CSharpClasses;

namespace FoodStoreV2.WebForms
{
    public partial class ProductPage_WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected List<Product> test_method()
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();

            List <Product> productList = new List<Product>();

            productList.Add(new Product(1, "productname", "123kr", 1, "100", "onsale"));
            productList.Add(new Product(2, "productname2", "234kr", 1, "100", "onsale"));
            productList.Add(new Product(3, "productname3", "345kr", 2, "100", "normal"));
            productList.Add(new Product(4, "productname4", "456kr", 2, "100", "normal"));
            productList.Add(new Product(5, "productname5", "567kr", 3, "100", "normal"));
            productList.Add(new Product(6, "productname6", "678kr", 4, "100", "normal"));
            productList.Add(new Product(7, "productname7", "789kr", 4, "100", "normal"));


            return productList;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}