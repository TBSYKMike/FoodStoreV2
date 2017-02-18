<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ProductPage_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-sm-12 row text-center" style="background-color: lawngreen;">
        <script type="text/javascript">
            test();

        </script>

        <% 


            List<FoodStoreV2.CSharpClasses.Product> productList = test_method();

            string selectedProductID = "none";
            string selectedProductName = "none";
            string selectedProductPrice = "none";
            string selectedProductCategory = "none";
            string selectedProductAmount = "none";
            string selectedProductOnSale = "none";

            int productListPosition = 0;
            string test = test_method()[0].getName();
            if (Request.QueryString["param1"] != null)
            {
                int id = Int32.Parse(Request.QueryString["param1"]);
                //Response.Write("From Page1 param1 value=" + Request.QueryString["param1"]);

                for (int i = 0; i < test_method().Count(); i++)
                {
                    if (test_method()[i].getProductID() == id)
                    {
                        productListPosition = i;

                        selectedProductID = test_method()[productListPosition].getProductID().ToString();
                        selectedProductName = test_method()[productListPosition].getName().ToString();
                        selectedProductPrice = test_method()[productListPosition].getPrice().ToString();
                        selectedProductCategory = test_method()[productListPosition].getCategory().ToString();
                        selectedProductAmount = test_method()[productListPosition].getAmount().ToString();
                        selectedProductOnSale = test_method()[productListPosition].getOnSale().ToString();

                        test = "\n id: " + test_method()[productListPosition].getProductID().ToString();
                        test += "\n prodName: " + test_method()[productListPosition].getName().ToString();
                        test += "\n Price: " + test_method()[productListPosition].getPrice().ToString();
                        test += "\n Categ: " + test_method()[productListPosition].getCategory().ToString();
                        test += "\n Ammount: " + test_method()[productListPosition].getAmount().ToString();
                        test += "\n OnSale: " + test_method()[productListPosition].getOnSale().ToString();
                        break;
                    }
                    else
                    {
                        test = "product does not exist";
                    }
                }



            }
            else
            {
                test = "product does not exist";
            }

        %>
        <%: test %>
        <br />
        <%: test_method()[0].getName() %>
        <br />
        <%: test_method()[1].getName() %>
        <br />
        <%: test_method()[2].getName() %>
        <br />
        <%: test_method()[3].getName() %>
        <br />
        <%: test_method()[4].getName() %>
        <br />
        <%: test_method()[5].getName() %>
        <br />
        <%: test_method()[6].getName() %>
    </div>

    <div class="col-sm-12 row text-center " style="background-color: navajowhite;">
        <h1>Product Desciption</h1>
    </div>
    <div class="col-sm-12 row text-center " style="background-color: blue;">
        <div class="col-sm-2" style="background-color: burlywood;">
            Menu
            <br />
            <br />
            <br />
        </div>
        <div class="col-sm-6" style="background-color: blueviolet;">
            <br />
            <div class="col-sm-12" style="background-color: palevioletred;">
                <br />
                <img class="img-rounded" src="https://www.w3schools.com/html/pic_mountain.jpg" alt="HTML5 Icon" style="width: 100%; height: 100%;">
                <br />
                <br />
            </div>
            <br />
            <div class="col-sm-12 text-left" style="background-color: violet;">
                <br />
                product information:
                <br />
                <br />
                Wrote water woman of heart it total other. By in entirely securing suitable graceful at families improved. Zealously few furniture repulsive was agreeable consisted difficult. Collected breakfast estimable questions in to favourite it. Known he place worth words it as to. Spoke now noise off smart her ready. 
                <br />
                <br />
                Respect forming clothes do in he. Course so piqued no an by appear. Themselves reasonable pianoforte so motionless he as difficulty be. Abode way begin ham there power whole. Do unpleasing indulgence impossible to conviction. Suppose neither evident welcome it at do civilly uncivil. Sing tall much you get nor. 
                <br />
                <br />
                With my them if up many. Lain week nay she them her she. Extremity so attending objection as engrossed gentleman something. Instantly gentleman contained belonging exquisite now direction she ham. West room at sent if year. Numerous indulged distance old law you. Total state as merit court green decay he. Steepest sex bachelor the may delicate its yourself. As he instantly on discovery concluded to. Open draw far pure miss felt say yet few sigh. 
                <br />
                <br />
                <br />
            </div>
            <br />
        </div>
        <div class="col-sm-4" style="background-color: cornflowerblue;">

            <div class="col-sm-12" style="background-color: paleturquoise;">
                <br />
                <br />
                <br />
                product id: <%: selectedProductID %>
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: cadetblue;">
                <br />
                <br />
                <br />
                product name: <%: selectedProductName %>
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: cyan;">
                <br />
                <br />
                <br />
                product price: <%: selectedProductPrice %>
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: mediumpurple;">
                <br />
                <br />
                <br />
                product amount left: <%: selectedProductAmount %>
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: mediumslateblue;">
                <br />
                <br />
                <br />
                product info 
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: deepskyblue;">
                <br />
                <br />
                <br />
                .onsale: <%: selectedProductOnSale %>
                <br />
                <br />
                <br />
            </div>
            <div class="col-sm-12" style="background-color: lightsteelblue;" onclick="alert('You are clicking on buy item');">
                <br />
                <br />
                <br />
                .buy Click
                <br />
                <br />
                <br />
            </div>
        </div>


    </div>



</asp:Content>
