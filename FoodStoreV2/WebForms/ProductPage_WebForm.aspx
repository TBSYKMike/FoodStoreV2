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
            string selectedProductCategory = "0";
            string selectedProductAmount = "none";
            string selectedProductOnSale = "none";
            string selectedProductInfo = "none";
            string selectedProductImageURL = "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg";

            
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
                        selectedProductInfo = test_method()[productListPosition].getInfo().ToString();
                        selectedProductImageURL = test_method()[productListPosition].getImageURL().ToString();

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
     
        <br />       
    </div>

    <div class="col-sm-12 row text-center " style="background-color: navajowhite;">
        <h1>Product Desciption</h1>
    </div>
    <div class="col-sm-12 row text-center " style="background-color: blue;">
        <div class="col-sm-2" style="background-color: burlywood;">
            
            <br />
             <%= category_menu() %>
            <br />
            <br />
        </div>
        <div class="col-sm-6" style="background-color: blueviolet;">
            <br />
            <div class="col-sm-12" style="background-color: palevioletred;">
                <br />
                <img class="img-rounded" src="<%: selectedProductImageURL %>" alt="HTML5 Icon" style="width: 100%; height: 100%;">
                <br />
                <br />
            </div>
            <br />
            <div class="col-sm-12 text-left" style="background-color: violet;">
                <br />
                Product INFO: 
                <br />
                <%: selectedProductInfo %>
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <br />
        </div>
        <div class="col-sm-4" style="background-color: cornflowerblue;">

            <div class="col-sm-12" style="background-color: paleturquoise;">
                <br />
                Product Nbr: <%: selectedProductID %>
                <br />
            </div>
            <div class="col-sm-12" style="background-color: cadetblue;">
                <br />
                Product Name: <%: selectedProductName %>
                <br />
            </div>
            <div class="col-sm-12" style="background-color: orchid;">
                <br />
                Category: <%: getCategoryName( Int32.Parse( selectedProductCategory) ) %>
                <br />
            </div>
            <div class="col-sm-12" style="background-color: mediumpurple;">
                <br />
                Stock: <%: selectedProductAmount %> left
                <br />
            </div>
            <div class="col-sm-12" style="background-color: cyan;">
                <br />
                Price: <%: selectedProductPrice %> kr
                <br />
            </div>
            
            
            <div class="col-sm-12" style="background-color: lightsteelblue;" >
                <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button1" runat="server" Text="BUY" OnClick="Button1_Click1" />
            </div>
        </div>


    </div>



</asp:Content>
