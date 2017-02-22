<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ForgotPassword_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 552px">
        <asp:TextBox class="form-control" TabIndex="0" ID="emailTextBox" runat="server" style="position:absolute; top: 180px; left: 206px; height: 40px; width: 200px;"></asp:TextBox>
        
        <asp:Button ID="resetPasswordButton" class="btn btn-primary btn-lg" runat="server" Text="Submit" style="position:absolute;   top: 180px; left: 448px; height: 54px; width: 196px;" OnClick="forgotPasswordButton_Click"/>

        <asp:Label ID="TitleLabel" runat="server" Text="Forgot your Password?" style="position:absolute; top: 33px; left: 125px; width: 335px; height: 43px;" Font-Size="XX-Large"></asp:Label>
         
        <asp:Label ID="ExpLabel" runat="server" Text="Enter your email and click submit to recieve a new password!" style="position:absolute; top: 87px; left: 125px; width: 286px; height: 53px;" Font-Size="Small"></asp:Label>
      
        <asp:Label ID="emailLabel" runat="server" Text="Email:" style="position:absolute; top: 193px; left: 126px; width: 43px; height: 26px;" Font-Size="Large"></asp:Label>
         
        <asp:Label ID="errorMsg" runat="server" Text="Email does not exist!" style="position:absolute; top: 255px; left: 209px; width: 286px; height: 53px;" Font-Size="Small" ForeColor="#CC0000" Visible="False"> </asp:Label>
      
    </div>
        
</asp:Content>