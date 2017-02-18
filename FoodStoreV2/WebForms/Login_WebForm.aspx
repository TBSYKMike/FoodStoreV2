<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Login_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <div style="height: 552px">
    </div>
        <asp:Label ID="passwordLabel" runat="server" Text="password" style="position:absolute; top: 228px; left: -17px; height: 27px; width: 66px; margin-left: 141px;"></asp:Label>
        <asp:TextBox ID="passwordTextBox" TextMode="Password" runat="server" style="position:absolute; top: 223px; left: 205px; height: 22px; width: 139px;"></asp:TextBox> 

         <asp:Label ID="wrongEmailOrPasswordLabel" runat="server" Text="Wrong username or password" style="position:absolute; top: 200px; left: 482px; color: red;" Visible="False"></asp:Label>

        <asp:Label ID="emailLabel" runat="server" Text="Email" style="position:absolute; top: 184px; left: 150px; width: 42px;"></asp:Label>
        <asp:TextBox ID="emailTextBox" runat="server" style="position:absolute; top: 180px; left: 206px; height: 22px; width: 139px;"></asp:TextBox> 
         
        
        <asp:Button ID="loginButton" runat="server" ValidationGroup='login' Text="Login" style="position:absolute;  top: 198px; left: 404px; height: 20px; width: 55px;" OnClick="registerButton_Click"/>
        
        <asp:Button ID="registerButton" runat="server" Text="Register" style="position:absolute;  top: 224px; left: 833px; height: 22px;" OnClick="registerButton_Click1"/>
        <asp:Button ID="forgotPasswordButton" runat="server" Text="Forgot password" style="position:absolute;  top: 168px; left: 831px; height: 22px;" OnClick="forgotPasswordButton_Click"/>
        
        <div class="g-recaptcha" ID="captcha" runat="server" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI" style= " position:absolute; height: 77px; width: 270px; margin-top: 188px; margin-right: 0px; top: 129px; left: 135px;"></div>
        <asp:Label ID="robotLabel" runat="server" Text="Are you a robot? If not, check the box!" style="position:absolute; top: 344px; left: 430px; color: red;" Visible="False"></asp:Label>
      
</asp:Content>

