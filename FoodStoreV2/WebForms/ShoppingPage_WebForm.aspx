<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingPage_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container-fluid">
        <h1>Welcome to the Shop</h1>
        <p>Resize the browser window to see the effect.</p>
        <div class="row">
            <div class="col-sm-2" style="background-color: darksalmon;"> 
                <div class="col-sm-12" style="background-color: burlywood;">Menu </div>
                <div class="col-sm-12" style="background-color: darkturquoise;">Search </div>
            </div>
            <div class="col-sm-10 row" style="background-color: lavender;">


                
                <% for (int i = 0; i < test_method().Count(); i++)
                    {%>

                <div class="col-sm-4 parent row text-center" style=" margin: auto auto ">
                    <div class="col-sm-12 child"> <p></p> </div>
                    <div class="col-sm-12 child " style="background-color: skyblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID() %>';">
                        <p>.item <%: i+1 %> name</p>
                        <p><%: test_method()[i].getName() %></p>
                        <img class="img-rounded" src="https://www.w3schools.com/html/pic_mountain.jpg" alt="HTML5 Icon" style="width:100%;height:100%;"> 
                        <br />
                        <p>.item <%: i+1 %> info</p>
                        <p><%: test_method()[i].getOnSale() %></p>
                        <br />
                    </div>
                    <div class="col-sm-12 child" style="background-color: deepskyblue;" onclick="alert('You are clicking on buy item <%: i+1 %>');">.buy</div>
                    <div class="col-sm-12 child" style="background-color: cadetblue;" onclick="location.href='ProductPage_WebForm?param1=<%: test_method()[i].getProductID() %>';">.buyNEW</div>
                    <div class="col-sm-12 child"> <p></p> </div>
                </div>

                <% }; %>
            </div>
        </div>
    </div>




</asp:Content>
