<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingPage_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


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
            <div class="col-sm-10 row" style="background-color: lavender;">

                <%  if (Request.QueryString["category"] == null || Request.QueryString["category"] == "show_all")
                    { %>
                <div class="col-xs-12 col-sm-12 col-md-12 row panel text-center " style="margin: 1px 0px; background-color: beige;"> <h3>All Products</h3></div>
                <%      for (int i = 0; i < test_method().Count(); i++)
                        {%>

                <div class="col-xs-6 col-sm-4 col-md-4 row panel text-center " style="margin: 1px 0px; background-color: beige;">
                    <div class="col-sm-12 ">
                        <p></p>
                    </div>
                    <div class="col-sm-12  " style="background-color: skyblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID() %>';">
                        <p>.item <%: i + 1 %> name</p>
                        <p><%: test_method()[i].getName() %></p>
                        <img class="img-rounded" src="https://www.w3schools.com/html/pic_mountain.jpg" alt="HTML5 Icon" style="width: 100%; height: 100%;">
                        <br />
                        <p>.item <%: i + 1 %> info</p>
                        <p><%: test_method()[i].getOnSale() %></p>

                        <button type="button" class="btn btn-primary btn-std btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>

                    </div>
                    <div class="col-sm-12  " style="background-color: deepskyblue;" onclick="alert('You are clicking on buy item <%: i + 1 %>');">
                        <br />
                        .buy<br />
                        <br />
                    </div>
                    <div class="col-sm-12  " style="background-color: cadetblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID() %>';">
                        .buyNEW<br />
                    </div>

                    <button type="button" class="btn btn-primary btn-lg btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>

                    <div class="col-sm-12 ">
                        <p></p>
                    </div>

                </div>

                <%      } %>

                <%  }else
                    { %>

                
                <div class="col-xs-12 col-sm-12 col-md-12 row panel text-center " style="margin: 1px 0px; background-color: beige;"> <h3>Category: <%= "CatID: "+Request.QueryString["category"]+" CatName: "+getCategoryName( Request.QueryString["category"] ) %></h3></div>
                <!-- Codes for categories -->


                <%      for (int i = 0; i < test_method().Count(); i++)
                        {%>
                <%          if (Request.QueryString["category"] == test_method()[i].getCategory().ToString())
                            {%>
                <div class="col-xs-6 col-sm-4 col-md-4 row panel text-center " style="margin: 1px 0px; background-color: beige;">
                    <div class="col-sm-12 ">
                        <p></p>
                    </div>
                    <div class="col-sm-12  " style="background-color: skyblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID().ToString() %>';">
                        <p>.item <%: i + 1 %> name</p>
                        <p><%: test_method()[i].getName() %></p>
                        <img class="img-rounded" src="https://www.w3schools.com/html/pic_mountain.jpg" alt="HTML5 Icon" style="width: 100%; height: 100%;">
                        <br />
                        <p>.item <%: i + 1 %> info</p>
                        <p><%: test_method()[i].getOnSale() %></p>

                        <button type="button" class="btn btn-primary btn-std btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>

                    </div>
                    <div class="col-sm-12  " style="background-color: deepskyblue;" onclick="alert('You are clicking on buy item <%: i + 1 %>');">
                        <br />
                        .buy<br />
                        <br />
                    </div>
                    <div class="col-sm-12  " style="background-color: cadetblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID() %>';">
                        .buyNEW<br />
                    </div>

                    <button type="button" class="btn btn-primary btn-lg btn-block" onclick="alert('You are clicking on buy item <%: i + 1 %>');">.BuyNEW2 Button</button>

                    <div class="col-sm-12 ">
                        <p></p>
                    </div>

                </div>
                <%          } %>
                <%      } %>

                <%  } %>
            </div>
        </div>
    </div>




</asp:Content>
