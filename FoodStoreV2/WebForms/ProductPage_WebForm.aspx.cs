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

            List<Product> productList = databaseConnector.getProductsOnCategory(0);
            /*
                        productList.Add(new Product(1, "productname", "123kr", 1, "100", "onsale", "info", "img"));
                        productList.Add(new Product(2, "productname2", "234kr", 1, "100", "onsale", "info", "img"));
                        productList.Add(new Product(3, "productname3", "345kr", 2, "100", "normal", "info", "img"));
                        productList.Add(new Product(4, "productname4", "456kr", 2, "100", "normal", "info", "img"));
                        productList.Add(new Product(5, "productname5", "567kr", 3, "100", "normal", "info", "img"));
                        productList.Add(new Product(6, "productname6", "678kr", 4, "100", "normal", "info", "img"));
                        productList.Add(new Product(7, "productname7", "789kr", 4, "100", "normal", "info", "img"));
            */

            return productList;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Request.QueryString["param1"] != null)
            {

                for (int i = 0; i < test_method().Count(); i++)
                {
                    if (test_method()[i].getProductID() == Convert.ToInt32(Request.QueryString["param1"]))
                    {
                        int id = Convert.ToInt32(Request.QueryString["param1"]);


                        SessionValues sv = new SessionValues();
                        sv.addToCart(id);

                        break;
                    }
                    else
                    {

                    }
                }




            }
        }



        protected string getCategoryName(int cateID)
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            List<Category> categoryList = databaseConnector.getCategories();
            string categoryName = "";

            for(int i=0; i<categoryList.Count; i++)
            {
                if (categoryList[i].getCategoryID() == cateID)
                {
                    categoryName = categoryList[i].getCategoryName();
                }
            }


            return categoryName;
        }



        protected string category_menu()
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            List<Category> categoryList = databaseConnector.getCategories();

            /*      categoryList.Add(new Category(1, "NoCategory"));
                  categoryList.Add(new Category(2, "Meat"));
                  categoryList.Add(new Category(3, "Fish"));
                  categoryList.Add(new Category(4, "Vegetable"));
                  categoryList.Add(new Category(5, "Fruit"));
                  categoryList.Add(new Category(6, "Eggs"));
                  categoryList.Add(new Category(7, "Beans"));
                  categoryList.Add(new Category(8, "Drink"));
                  categoryList.Add(new Category(9, "Milk"));
                  categoryList.Add(new Category(10, "Bread"));
                  */

            string url = "ShoppingPage_WebForm";
            string temp = " <div id=\"collapse1\" class=\"panel\">  <ul class=\"list-group\"> <div class=\"panel-footer\"><strong><u>Category Menu</u></strong></div>";
            temp += "  <li class=\"list-group-item\">" +
                    " <a href=\"" + url + "?category=" + "show_all" + "\">" + "Show All" + "</a> "
                + "</li>  ";
            for (int i = 0; i < categoryList.Count(); i++)
            {
                string categoryID = categoryList[i].getCategoryID().ToString();
                string categoryName = categoryList[i].getCategoryName().ToString();

                temp += "  <li class=\"list-group-item\">" +
                    " <a href=\"" + url + "?category=" + categoryID + "\">" + categoryName + "</a> "
                + "</li>  ";
            }
            temp += " </ul>  </div> ";



            return temp;
        }


    }
}