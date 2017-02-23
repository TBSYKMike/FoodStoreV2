<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderHistory_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.OrderHistory_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 552px">
    </div>
      <p style="height: 470px; margin-left: 0px; width: 1299px; margin-right: 0px;" align="right">
               <asp:Label ID="orderDetailLabel" runat="server" Text="Products on selected order" Visible="false" style="position:absolute; top: 124px; left: 617px;"></asp:Label>
               <asp:Label ID="orderHistoryLabel" runat="server" Text="Your Order History" style="position:absolute; top: 116px; left: 192px;"></asp:Label>        
               <asp:GridView ID="orderHistoryGridView" AutoGenerateColumns="false" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 163px; left: 176px; height: 193px; width: 256px;">
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









             <asp:GridView ID="orderDetailsGridView" AutoGenerateColumns="false" runat="server" style="position:absolute; top: 164px; left: 569px; height: 193px; width: 256px;">                  
     
                 
                 
                 <Columns>
                 
        <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
                <asp:Label ID="txtProductName" runat="server" Text='<%# Eval("ProductName") %>'>

                </asp:Label>
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
               
               

        </p>     
</asp:Content>
