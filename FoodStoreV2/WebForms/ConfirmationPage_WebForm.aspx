<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmationPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ConfirmationPage_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 552px">
    </div>

        <asp:Label ID="userInformationLabel" runat="server" Text="User name" style="position:absolute; top: 144px; left: -24px; height: 17px; width: 75px; margin-left: 141px;"></asp:Label>
                
        <asp:Button ID="confirmAndPayButton" runat="server" Text="Update profile" OnClientClick="hideResultLabel();" ValidationGroup='update' style="position:absolute; top: 357px; left: 480px;" OnClick="updateButton_Click"/>
        <asp:Label ID="updateConfirmLabel" runat="server" Text="Account updated!" style="position:absolute; top: 356px; left: 632px; height: 38px; width: 127px;" Visible="False"></asp:Label>
     
</asp:Content>
