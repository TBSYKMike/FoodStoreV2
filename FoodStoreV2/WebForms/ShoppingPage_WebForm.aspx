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
            color: #fff;
            cursor: pointer;
            /*Opacity*/
            zoom: 1;
            filter: alpha(opacity=100);
            opacity: 1;
        }
    </style>


    <div class="container-fluid">
        <h1>Welcome to the Shop</h1>
        <p>Resize the browser window to see the effect.</p>
        <div class="row">
            <div class="col-sm-2" style="background-color: darksalmon;">
                <div class="col-sm-12" style="background-color: burlywood;">
                    Menu
                    <br />
                    <%= category_menu() %>
                </div>
                <div class="col-sm-12" style="background-color: darkturquoise;">Search </div>
            </div>
            <div class="col-sm-10 row container1" style="background-color: lavender;">

                <%  int categoryID = 0;
                    if (Request.QueryString["category"] != null )
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
                <!--  METHOD FOR PRODUCT ITEM Start  -->

                <!--
                <div class="col-xs-6 col-sm-4 col-md-4 row panel text-center box1" style="margin: 1px 0px; background-color: beige;">
                    <br />
                    <div class="col-sm-12  " style="background-color: skyblue;" onclick="location.href='ProductPage_WebForm?param1=<%: getProductList(categoryID)[i].getProductID() %>';">
                        <p></p>
                        <p>.itemNAME <%: getProductList(categoryID)[i].getName() %></p>
                        <img class="img-rounded" src="<%: getProductList(categoryID)[i].getImageURL() %>" alt="HTML5 Icon" style="width: 100%; height: 15vw;">
                        <br />
                        <p>.itemINFO <%: getProductList(categoryID)[i].getInfo() %> info</p>
                        <p>.itemPRICE <%: getProductList(categoryID)[i].getPrice() %> kr</p>

                             <button type="button" class="btn btn-primary btn-std btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button> 
                       

                    </div>
                     
                    <div class="col-sm-12  " style="background-color: deepskyblue;" onclick="alert('You are clicking on buy item <%: i + 1 %>');">
                        <br />
                        .buy<br />
                        <br />
                    </div>
                    <div class="col-sm-12  " style="background-color: cadetblue;" onclick="location.href='ProductPage_WebForm?param1=<%: getProductList(categoryID)[i].getProductID() %>';">
                        .buyNEW<br />
                    </div> 
                    

                    <div class="col-sm-12 ">
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW3 Button</button>
                    </div>
                    
                    <% int tmp = i; %>
                    <div class="col-sm-12 ">
                       <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block" runat="server" OnClick="testCartList" Text="New ASP ADDCART" />
                        <asp:Button ID="Button3" class="btn btn-primary btn-lg btn-block" runat="server" CommandArgument="1" OnCommand="Button1_Command" Text="New ASP ADDCART v2" />
                        <asp:Button ID="Button4" Text="Click Here1" runat="server" CommandArgument="1" />


                        <asp:Button runat="server" Text="Click Here2" OnClick="MyButtonHandler" OnClientClick="setValue(<%= i %>)" />



                        <input type="text" id="txtName" name="Name" value="" />
                        <input type="text" id="txtEmail" runat="server" value="" />
                        <br />
                        <script>document.getElementById("txtName").value = "<%: i + 1 %>";</script>

                        <br />
                        <asp:Button Text="Submit" runat="server" OnClick="Submit" />

                      
                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>


                    </div>


                    <div class="col-sm-12 ">
                        <p></p>
                    </div>

                </div>
                    -->

                <%= generateProductPartBegin(i, categoryID) %>
                <asp:PlaceHolder runat="server" ID="PlaceHolder01">  </asp:PlaceHolder>
                <%= generateProductPartEnd(i, categoryID) %>

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
                <!---     <div class="col-xs-6 col-sm-4 col-md-4 row panel text-center box1" style="margin: 1px 0px; background-color: beige;">
                    <br />
                    <div class="col-sm-12  " style="background-color: skyblue;" onclick="location.href='ProductPage_WebForm?param1=<%: getProductList(categoryID)[i].getProductID() %>';">
                        <p></p>
                        <p>.itemNAME <%: getProductList(categoryID)[i].getName() %></p>
                        <img class="img-rounded" src="<%: getProductList(categoryID)[i].getImageURL() %>" alt="HTML5 Icon" style="width: 100%; height: 15vw;">
                        <br />
                        <p>.itemINFO <%: getProductList(categoryID)[i].getInfo() %> info</p>
                        <p>.itemPRICE <%: getProductList(categoryID)[i].getPrice() %> kr</p>

                             <button type="button" class="btn btn-primary btn-std btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>
                       

                    </div>
                    
                    <div class="col-sm-12  " style="background-color: deepskyblue;" onclick="alert('You are clicking on buy item <%: i + 1 %>');">
                        <br />
                        .buy<br />
                        <br />
                    </div>
                    <div class="col-sm-12  " style="background-color: cadetblue;" onclick="location.href='ProductPage_WebForm?param1=<%: getProductList(categoryID)[i].getProductID() %>';">
                        .buyNEW<br />
                    </div> 
                    

                    <div class="col-sm-12 ">
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>
                    </div>
                    <div class="col-sm-12 ">
                        <p></p>
                    </div>

                </div>
                -->
                <%= generateProductPartBegin(i, categoryID) %>
                <!--<asp:Button ID="Button2" class="btn btn-primary btn-lg btn-block" runat="server" OnClick="testCartList" Text="New ASP ADDCART" /> -->
                <asp:PlaceHolder runat="server" ID="PlaceHolder02">  </asp:PlaceHolder>
                <%= generateProductPartEnd(i, categoryID) %>
                <!--  METHOD FOR PRODUCT ITEM End  -->


                <%     //     } %>
                <%      } %>

                <%  } %>
            </div>
        </div>
    </div>




</asp:Content>
