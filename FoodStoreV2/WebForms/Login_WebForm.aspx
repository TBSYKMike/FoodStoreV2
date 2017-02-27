<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Login_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 default-style">
        <div class="col-sm-12 col-md-12 ">
            <div class="jumbotron">
                <h1>Login</h1>
            </div>
        </div>
        <div class="col-sm-12 col-md-1" style="background-color: cornflowerblue">
        </div>
        <div class="col-sm-12 col-md-8 border default-style-content" style="">
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <div class="col-sm-12" style="background-color: burlywood">

                <asp:Label ID="cartLoginRequireLabel" runat="server" Visible="False">You have to login in before proceeding to cart<br /></asp:Label>

                <asp:Label ID="wrongEmailOrPasswordLabel" runat="server" Visible="False">Wrong username or password<br /></asp:Label>

                <asp:Label ID="accountActivatedLabel" runat="server" Visible="False">Your account is not activated<br /></asp:Label>

            </div>
            <br />
            <div class="col-sm-12 rounded" style="background-color: none">

                <asp:Label ID="emailLabel" runat="server" Text="Email" Visible="True"></asp:Label>
                <br />
                <asp:TextBox class="form-control" ID="emailTextBox" runat="server" placeholder="enter email"></asp:TextBox>
                <br />

                <asp:Label ID="passwordLabel" runat="server" Text="password" Visible="True"></asp:Label>
                <br />
                <asp:TextBox class="form-control" ID="passwordTextBox" TextMode="Password" runat="server" placeholder="enter password"></asp:TextBox>
                <br />

                <div class="col-sm-12" style="background-color: bisque">
                    <div class="g-recaptcha" id="captcha" runat="server" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
                    <asp:Label ID="robotLabel" runat="server" Text="Are you a robot? If not, check the box!" Visible="False"></asp:Label>
                </div>
                <br />
                <asp:Button ID="loginButton" class="btn btn-primary btn-md" runat="server" ValidationGroup='login' Text="Login" OnClick="registerButton_Click" />

                <br />
                <br />

                <div class="col-sm-12" style="background-color: black"></div>
                <br />
                <asp:Button ID="forgotPasswordButton" class="btn btn-primary btn-md" runat="server" Text="Forgot Password" OnClick="forgotPasswordButton_Click" />
                <asp:Button ID="registerButton" class="btn btn-primary btn-md" runat="server" Text="Create Account" OnClick="registerButton_Click1" />

                <br />
                <br />
                <br />
                <br />

            </div>
            <br />
        </div>
        <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
        </div>
    </div>
</asp:Content>

