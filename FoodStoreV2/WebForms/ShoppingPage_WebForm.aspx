<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingPage_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" language="javascript">

        $(document).ready(function () {
            $('head').append('<style>.outlineElement {  border-color:blue; background-color:green;} </style>');

            $('.container .box')
        .mouseover(function (event) {
            $(event.target).addClass('outlineElement');
        })
        .mouseout(function (event) {
            $(event.target).removeClass('outlineElement');
        });
        });



    </script>

    <style>
        /*Style the DIV*/
        .container1 .box1 {
            float: left;
            margin: 2px;
            padding: 5px;
            border: 1px solid #ccc;
            text-align: center;
        }

        /*Fade all the DIV when user hovers on any div*/
        .container1:hover .box1 {
            zoom: 1;
            /*  filter: alpha(opacity=45);
            opacity: 0.45;
            -webkit-transition: opacity .5s ease-in-out;
            -moz-transition: opacity .5s ease-in-out;
            -ms-transition: opacity .5s ease-in-out;
            -o-transition: opacity .5s ease-in-out;
            transition: opacity .5s ease-in-out; */
        }

        /*Fade out the particular DIV when user hover on that DIV*/
        .container1 .box1:hover {
            box-shadow: 3px 3px 15px #666;
            border-color: cadetblue;
            background: #C76C0C;
            color: #000;
            text-shadow: 2px 2px 5px #444;
            cursor: pointer;
            /*Opacity*/
            zoom: 1;
            filter: alpha(opacity=100);
            opacity: 1;
        }
    </style>


    <div class="container-fluid">


        <div class="col-xs-12 row">
            <div class="col-xs-12 jumbotron">
                <!-- <div class="page-header"> -->
                <h1>Welcome to the Shop</h1>
                <p>Look around in our wonderful shop.</p>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2 container rounded" style="background-color: beige; border: 1px solid #ccc; margin-right: 5px;">

                <br />
                <%= category_menu() %>

                <br />

            </div>
            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 row container1" style="background-color: none;">

                <%  int categoryID = 0;
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
                    }%>

                <%  if (Request.QueryString["category"] == null || Request.QueryString["category"] == "show_all")
                    {


                %>
                <div class="col-xs-12 col-sm-12 col-md-12 row panel text-center " style="margin: 1px 0px; background-color: beige;">
                    <h3>All Products</h3>
                </div>
                <%      for (int i = 0; i < getProductList(categoryID).Count(); i++)
                    {%>

                <div class="col-xs-12 col sm-6 col-md-6 col-lg-4 row panel text-center box1" style="margin: 1px 0px; background-color: beige; min-height: inherit;">
                    <%= generateProductPartBegin(i, categoryID) %>
                    <div class="col-xs-12">
                        <asp:PlaceHolder runat="server" ID="PlaceHolder01"></asp:PlaceHolder>
                    </div>
                    <%= generateProductPartEnd(i, categoryID) %>
                </div>
                <!--  METHOD FOR PRODUCT ITEM End  -->

                <%      } %>

                <%  }
                    else
                    {
                %>


                <div class="col-xs-12 col-sm-12 col-md-12 row panel text-center " style="margin: 1px 0px; background-color: beige;">
                    <h3>Category: <%= ""+getCategoryName( Request.QueryString["category"] ) %></h3>
                </div>
                <!-- Codes for categories -->


                <%      for (int i = 0; i < getProductList(categoryID).Count(); i++)
                    {%>
                <%       //   if (Request.QueryString["category"] == getProductList(categoryID)[i].getCategory().ToString())   {%>

                <!--  METHOD FOR PRODUCT ITEM Start  -->

                <div class="col-xs-6 col sm-6 col-md-4 row panel text-center box1" style="margin: 1px 0px; background-color: beige;">
                    <%= generateProductPartBegin(i, categoryID) %>
                    <!--<asp:Button ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" OnClick="testCartList" Text="New ASP ADDCART" /> -->
                    <asp:PlaceHolder runat="server" ID="PlaceHolder02"></asp:PlaceHolder>
                    <%= generateProductPartEnd(i, categoryID) %>
                </div>
                <!--  METHOD FOR PRODUCT ITEM End  -->


                <%     //     } %>
                <%      } %>

                <%  } %>
            </div>
        </div>
    </div>




</asp:Content>
