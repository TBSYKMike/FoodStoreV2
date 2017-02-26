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

            int categoryID = 0;
            
                if (Request.QueryString["category"] != null)
                {
                    try
                    {
                        categoryID = Int32.Parse(Request.QueryString["category"]);
                        Console.WriteLine("{0} --> {1}", 0, categoryID);
                    }
                    catch (FormatException)
                    {
                        Console.WriteLine("{0}: Bad Format", categoryID);
                    }
                    catch (OverflowException)
                    {
                        Console.WriteLine("{0}: Overflow", categoryID);
                    }
                }
            
            for (int i = 0; i < getProductList(categoryID).Count(); i++)
            {
                generateASPButton(i, categoryID);
            }
        }

        private void generateASPButton(int i, int categoryID)
        {
            var button1 = new Button
            {
                ID = "ButtonBuy" + getProductList(categoryID)[i].getProductID(),
                CommandArgument = getProductList(categoryID)[i].getProductID().ToString(),
                //Text = "SubmitBuy" + getProductList(categoryID)[i].getProductID(),
                Text = "BUY",
                CssClass = "btn btn-primary btn-lg btn-block"

            };
            button1.Command += Button1_Command;
            if (Request.QueryString["category"] == null || Request.QueryString["category"] == "show_all")
            {
                PlaceHolder01.Controls.Add(button1);
            }
            else
            {
                PlaceHolder02.Controls.Add(button1);
            }
        }

        protected List<Product> getProductList(int categoryID)
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            // parameter 0 means get all
            List<Product> productList = databaseConnector.getProductsOnCategory(categoryID);

            /*  productList.Add(new Product(1, "productname", "123kr", 1, "100", "onsale", "info", "img"));
              productList.Add(new Product(2, "productname2", "234kr", 1, "100", "onsale", "info", "img"));
              productList.Add(new Product(3, "productname3", "345kr", 2, "100", "normal", "info", "img"));
              productList.Add(new Product(4, "productname4", "456kr", 2, "100", "normal", "info", "img"));
              productList.Add(new Product(5, "productname5", "567kr", 3, "100", "normal", "info", "img"));
              productList.Add(new Product(6, "productname6", "678kr", 4, "100", "normal", "info", "img"));
              productList.Add(new Product(7, "productname7", "789kr", 4, "100", "normal", "info", "img"));
              */

            return productList;
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
            string temp = "";
            //temp += " <div id=\"collapse1\" class=\"container\">";
            temp += "<div class=\"list-group-item active\"><strong><u>Category Menu</u></strong></div>";
            temp += "<a href=\"" + url + "?category=" + "show_all" + "\"   class=\"list-group-item \"         >" + "Show All" + "</a> ";
            for (int i = 0; i < categoryList.Count(); i++)
            {
                string categoryID = categoryList[i].getCategoryID().ToString();
                string categoryName = categoryList[i].getCategoryName().ToString();

                temp += "   <a href=\"" + url + "?category=" + categoryID + "\"  class=\"list-group-item \"   >" + categoryName + "</a> "   ;
            }
            //temp += "  </div> ";

            




            return temp;
        }


        protected string getCategoryName(String categoryID)
        {
            DatabaseConnector databaseConnector = new DatabaseConnector();
            List<Category> categoryList = databaseConnector.getCategories();

            /*    categoryList.Add(new Category(1, "NoCategory"));
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

            string productName = "none";

            for (int i = 0; i < categoryList.Count(); i++)
            {
                if (categoryList[i].getCategoryID().ToString() == categoryID)
                {
                    productName = categoryList[i].getCategoryName().ToString();
                    break;
                }
            }

            return productName;
        }


        protected string generateProduct(int i, int categoryID)
        {
            string tempHtml = "";
            tempHtml += "<div class=\"col-xs-6 col sm-4 col-md-4 row panel text-center box1\" style=\"margin: 1px 0px; background-color: beige; \"><br />";
            tempHtml += "<div class=\"col-sm-12  \" style=\"background-color: skyblue;\" onclick =\"location.href='ProductPage_WebForm?param1=" + getProductList(categoryID)[i].getProductID() + "';\" > ";
            tempHtml += "<p></p>";
            tempHtml += "<p>.itemNAME " + getProductList(categoryID)[i].getName() + "</p>";
            tempHtml += "<img class=\"img -rounded\" src=\" " + getProductList(categoryID)[i].getImageURL() + " \" alt =\"HTML5 Icon\" style = \"width: 100%; height: 15vw;\">";
            tempHtml += "<br />";
            tempHtml += "<p>.itemINFO  " + getProductList(categoryID)[i].getInfo() + " info</p>";
            tempHtml += "<p>.itemPRICE  " + getProductList(categoryID)[i].getPrice() + " kr</p>";
            tempHtml += "</div>";
            tempHtml += "<div class=\"col -sm-12 \" > ";
            tempHtml += "<button type = \"button\" class=\"btn btn-primary btn-lg btn-block\" onclick =\"alert('You are clicking on buy item " + (i + 1) + "'); \" >.BuyNEW2 Button</button>";
            // tempHtml += "<button type = \"button\" class=\"btn btn-primary btn-lg btn-block\" onclick =\"alert('You are clicking on buy item "+ (i + 1) +"'); \" >.BuyNEW2 Button</button>";
            //   tempHtml += "<asp:LinkButton id=\"myid\" runat=\"server\" OnClick=\"testCartList\" Text=\"LButton\" />";
            //   tempHtml += "<asp:Button ID=\"Button1\" runat=\"server\" OnClick=\"testCartList\" Text=\"Button\" />";


            tempHtml += "</div>";
            tempHtml += "<div class=\"col-sm-12 \" > ";
            tempHtml += "<p></p>";
            tempHtml += "</div>";
            tempHtml += "</div>";

            return tempHtml;
        }

        protected void testCartList(object sender, EventArgs e)
        {

            //   ((List<FoodStoreV2.CSharpClasses.Cart>)Session["cartList"]).Add(new FoodStoreV2.CSharpClasses.Cart(88, 1000));
        }


        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            int value = Int32.Parse(e.CommandArgument.ToString());

            //((List<FoodStoreV2.CSharpClasses.Cart>)Session["cartList"]).Add(new FoodStoreV2.CSharpClasses.Cart(value, 1000));
            int id = Convert.ToInt32(e.CommandArgument);
            // Do something with id
            //Response.Redirect("ProductPage_WebForm?param1=" + id.ToString() + "");

            SessionValues sv = new SessionValues();
            sv.addToCart(id);
        }


        protected void MyButtonHandler(object sender, EventArgs e)
        {
            int i = 0;
            int.TryParse(Request.Form["myButtonValue"].ToString(), out i);
            //do somethign with i
          //  ((List<FoodStoreV2.CSharpClasses.Cart>)Session["cartList"]).Add(new FoodStoreV2.CSharpClasses.Cart(i, 1000));
        }


        protected string generateProductPartBegin(int i, int categoryID)
        {
            string tempHtml = "";
            tempHtml += "";
            tempHtml += "<br />";
            tempHtml += "<div class=\"col-sm-12  \" style=\"background-color: none;\" onclick =\"location.href='ProductPage_WebForm?param1=" + getProductList(categoryID)[i].getProductID() + "';\" > ";
            tempHtml += "<p></p>";
            
            tempHtml += "<img class=\"img-rounded\" src=\" " + getProductList(categoryID)[i].getImageURL() + " \" alt =\"HTML5 Icon\" style = \"background-color:white; border: 1px solid #ccc; width: 100%; height: 15vw;\">";
            tempHtml += "<br />";
            tempHtml += "<strong><p> " + getProductList(categoryID)[i].getName() + "</p>";
            //tempHtml += "<p>.itemINFO  " + getProductList(categoryID)[i].getInfo() + " info</p>";
            tempHtml += "<p>  " + getProductList(categoryID)[i].getPrice() + " kr</p> </strong>";
            tempHtml += "</div>";
            tempHtml += "<div class=\"col -sm-12 \" > ";


            PlaceHolder01.Controls.Clear();
            PlaceHolder02.Controls.Clear();
            generateASPButton(i, categoryID);


            return tempHtml;
        }
        protected string generateProductPartEnd(int i, int categoryID)
        {





            string tempHtml = "";

            tempHtml += "</div>";
            tempHtml += "<div class=\"col-sm-12 \" > ";
            tempHtml += "<p></p>";
            tempHtml += "</div>";
            tempHtml += "";

            return tempHtml;
        }



        protected void Submit(object sender, EventArgs e)
        {
            string name = Request.Form["Name"];
            //string email = txtEmail.Value;
            int i = Int32.Parse(name);
          //  ((List<FoodStoreV2.CSharpClasses.Cart>)Session["cartList"]).Add(new FoodStoreV2.CSharpClasses.Cart(i, 1000));
        }

        protected void Load_Items(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            // Do something with id
            Response.Redirect("ProductPage_WebForm?param1=" + id.ToString() + "");
        }

    }
}