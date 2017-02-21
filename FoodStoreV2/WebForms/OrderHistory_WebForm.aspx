<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderHistory_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.OrderHistory_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 552px">
    </div>
      <p style="height: 470px; margin-left: 0px; width: 1299px; margin-right: 0px;" align="right">
                
               <asp:Label ID="orderHistoryLabel" runat="server" Text="Your Order History" style="position:absolute; top: 116px; left: 192px;"></asp:Label>        
               <asp:GridView ID="orderHistoryGridView" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 163px; left: 176px; height: 193px; width: 256px;">
               </asp:GridView>
               

        </p>     
</asp:Content>
