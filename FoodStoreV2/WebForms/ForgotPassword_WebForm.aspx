<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ForgotPassword_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 552px">
        
        <asp:Label ID="TitleLabel" runat="server" Text="Forgot your Password?" style="" Font-Size="XX-Large"></asp:Label>
        <br />
        <asp:Label ID="ExpLabel" runat="server" Text="Enter your email and click submit to recieve a new password!" style="" Font-Size="Small"></asp:Label>
        <br />
        <br />
        <asp:Label ID="emailLabel" runat="server" Text="Email:" style="" Font-Size="Large"></asp:Label>
         
        <asp:TextBox class="form-control" TabIndex="0" ID="emailTextBox" runat="server" style=""></asp:TextBox>
        
        <asp:Button ID="resetPasswordButton" class="btn btn-primary btn-lg" runat="server" Text="Submit" style="" OnClick="forgotPasswordButton_Click"/>
        
        <asp:Label ID="errorMsg" runat="server" Text="Email does not exist!" style="" Font-Size="Small" ForeColor="#CC0000" Visible="False"> </asp:Label>

    </div>
        
</asp:Content>