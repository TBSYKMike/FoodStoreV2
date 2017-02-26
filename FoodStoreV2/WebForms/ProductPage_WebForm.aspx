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
                int id = 0;

                try
                {
                    id = Int32.Parse(Request.QueryString["param1"]);
                }
                catch (Exception)
                {

                }


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
    <div class="col-xs-12 row">

        <div class="col-xs-12 row text-left " style="background-color: none;">
            <div class="col-xs-12 jumbotron ">
                <!-- <div class="page-header"> -->
                <h1>Product Desciption</h1>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2 container rounded" style="background-color: beige; border: 1px solid #ccc; margin-right: 5px;">

                <br />
                <%= category_menu() %>

                <br />

            </div>
            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 row container" style="background-color: none;">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8" style="background-color: beige; border: 1px solid #ccc;">
                    <br />
                    <br />
                    <img class="img-rounded" src="<%: selectedProductImageURL %>" alt="HTML5 Icon" style="background-color:white; width: 100%; height: 100%;">
                    <br />
                    <br />
                    <br />
                    Product INFO:
                    <div class="col-xs-12 text-left" style="background-color: #efefcb; border: 1px solid #ccc;">
                        <br />
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
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4" style="background-color: beige; border: 1px solid #ccc;">

                    <br />

                    <div class="col-xs-12 text-left" style="background-color: #efefcb; border: 1px solid #ccc;">
                        <div class="col-sm-12" style="background-color: inherit;">
                            <br />
                            Product Nbr: <%: selectedProductID %>
                            <br />
                        </div>
                        <div class="col-sm-12" style="background-color: inherit;">
                            <br />
                            Product Name: <%: selectedProductName %>
                            <br />
                        </div>
                        <div class="col-sm-12" style="background-color: inherit;">
                            <br />
                            Category: <%: getCategoryName( Int32.Parse( selectedProductCategory) ) %>
                            <br />
                        </div>
                        <div class="col-sm-12" style="background-color: inherit;">
                            <br />
                            Stock: <%: selectedProductAmount %> left
                            <br />
                        </div>
                        <div class="col-sm-12" style="background-color: inherit;">
                            <br />
                            Price: <%: selectedProductPrice %> kr
                            <br />
                        </div>
                        <br />
                    </div>
                    <br />
                    <div class="col-sm-12" style="background-color: inherit;">
                        <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button1" runat="server" Text="BUY" OnClick="Button1_Click1" />
                    </div>
                    <br />

                </div>
            </div>

        </div>
    </div>


</asp:Content>
