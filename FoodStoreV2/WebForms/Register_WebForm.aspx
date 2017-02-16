<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Register_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <div>
    <asp:Button ID="testbutton" runat="server" Height="38px" Text="testbutton" Width="60px" OnClick="test_CLICK" />
    </div>
        <asp:TextBox ID="searchTextBox" runat="server" style="position:absolute; top: 127px; left: 733px; height: 22px; width: 139px;"></asp:TextBox> 
          <asp:Button ID="searchButton" runat="server" Text="Search" ValidationGroup='search' style="position:absolute; top: 125px; left: 892px;" OnClick="searchButton_Click"/>
        <div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
</asp:Content>
