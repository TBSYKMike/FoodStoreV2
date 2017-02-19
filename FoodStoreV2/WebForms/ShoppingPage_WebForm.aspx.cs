using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class ShoppingPage_WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected List<Product> test_method()
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();

            List<Product> productList = new List<Product>();

            productList.Add(new Product(1, "productname", "123kr", 1, "100", "onsale"));
            productList.Add(new Product(2, "productname2", "234kr", 1, "100", "onsale"));
            productList.Add(new Product(3, "productname3", "345kr", 2, "100", "normal"));
            productList.Add(new Product(4, "productname4", "456kr", 2, "100", "normal"));
            productList.Add(new Product(5, "productname5", "567kr", 3, "100", "normal"));
            productList.Add(new Product(6, "productname6", "678kr", 4, "100", "normal"));
            productList.Add(new Product(7, "productname7", "789kr", 4, "100", "normal"));


            return productList;
        }

        protected string category_menu()
        {
            List<Category> productList = new List<Category>();

            productList.Add(new Category(1, "NoCategory"));
            productList.Add(new Category(2, "Meat"));
            productList.Add(new Category(3, "Fish"));
            productList.Add(new Category(4, "Vegetable"));
            productList.Add(new Category(5, "Fruit"));
            productList.Add(new Category(6, "Eggs"));
            productList.Add(new Category(7, "Beans"));
            productList.Add(new Category(8, "Drink"));
            productList.Add(new Category(9, "Milk"));
            productList.Add(new Category(10, "Bread"));

            string url = "ShoppingPage_WebForm";
            string temp = " <div id=\"collapse1\" class=\"panel\">  <ul class=\"list-group\"> <div class=\"panel-footer\"><strong><u>Category Menu</u></strong></div>";
            temp += "  <li class=\"list-group-item\">" +
                    " <a href=\"" + url + "?category=" + "show_all" + "\">" + "Show All" + "</a> "
                + "</li>  ";
            for (int i = 0; i < productList.Count(); i++)
            {
                string categoryID = productList[i].getCategoryID().ToString();
                string categoryName = productList[i].getCategoryName().ToString();

                temp += "  <li class=\"list-group-item\">" +
                    " <a href=\"" + url + "?category=" + categoryID + "\">" + categoryName + "</a> "
                + "</li>  ";
            }
            temp += " </ul>  </div> ";



            return temp;
        }


        protected string getCategoryName(String categoryID)
        {
            List<Category> productList = new List<Category>();

            productList.Add(new Category(1, "NoCategory"));
            productList.Add(new Category(2, "Meat"));
            productList.Add(new Category(3, "Fish"));
            productList.Add(new Category(4, "Vegetable"));
            productList.Add(new Category(5, "Fruit"));
            productList.Add(new Category(6, "Eggs"));
            productList.Add(new Category(7, "Beans"));
            productList.Add(new Category(8, "Drink"));
            productList.Add(new Category(9, "Milk"));
            productList.Add(new Category(10, "Bread"));

            string productName = "none";

            for (int i=0; i<productList.Count(); i++)
            {
                if(productList[i].getCategoryID().ToString()== categoryID)
                {
                    productName = productList[i].getCategoryName().ToString();
                }
            }

            return productName;
        }


    }
}