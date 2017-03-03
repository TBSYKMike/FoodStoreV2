<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderHistory_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.OrderHistory_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="col-xs-12 default-style">
        <div class="col-sm-12 col-md-12 ">
            <div class="jumbotron">
                <h1>Order History</h1>
            </div>
        </div>
        <div class="col-sm-12 col-md-1" style="background-color: cornflowerblue">
        </div>
        <div class="col-sm-12 col-md-8 border default-style-content" style="">
      
            <div class="col-sm-12" style="background-color: burlywood">


            </div>
            <br />
            <div class="col-sm-12 rounded" style="background-color: none">


          
               <asp:Label ID="orderHistoryLabel" runat="server" Text="Your Order History"></asp:Label>      
           <div class="round_corners">  
               <asp:GridView ID="orderHistoryGridView" HeaderStyle-BackColor="#99ccff"
        HeaderStyle-ForeColor="White" RowStyle-BackColor="#e1e1d0" AlternatingRowStyle-BackColor="#f5f5ef"
        RowStyle-ForeColor="#3A3A3A" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" class="productgridview">
                 <Columns>
                      <asp:TemplateField HeaderText="Order ID">
            <ItemTemplate>
                 <asp:LinkButton runat="server" CssClass="noeffect" ID="openOrderButton" Text='<%# Eval("OrderID") %>' style="font-size:12px;" OnClick="order_onClick" CausesValidation="False"></asp:LinkButton>

            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order Date">
            <ItemTemplate>
                <asp:Label ID="txtDate" runat="server" Text='<%# Eval("Date") %>'>

                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                             
                      </Columns>
                   
                   
                    </asp:GridView>

                  </div>
               <br />

                     <asp:Label ID="orderDetailLabel" runat="server" Text="Products on selected order" Visible="false"></asp:Label>
                <div class="round_corners">  
             <asp:GridView ID="orderDetailsGridView" HeaderStyle-BackColor="#99ccff"
        HeaderStyle-ForeColor="White" RowStyle-BackColor="#e1e1d0" AlternatingRowStyle-BackColor="#f5f5ef"
        RowStyle-ForeColor="#3A3A3A" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" runat="server" class="productgridview">                  
     
                 
                 
                 <Columns>
                 
        <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
                      <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("ProductName") %>' Style="font-size: 12px;" OnClick="product_onClick" CausesValidation="False"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Amount">
            <ItemTemplate>
                <asp:Label ID="txtAmount" runat="server" Text='<%# Eval("Amount") %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

                     <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="txtProductPrice" runat="server" Text='<%# Eval("productPrice") %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                   
            
                      </Columns>
                                </asp:GridView>
               
                </div>
                      </div>
             
            <br />
        </div>
        <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
        </div>
    </div>



    <style type="text/css">
    
</style>
</asp:Content>
