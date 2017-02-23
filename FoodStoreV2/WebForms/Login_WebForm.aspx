<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Login_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
     <asp:Label ID="cartLoginRequireLabel" runat="server" Text="You have to login in before proceeding to cart" style="position:absolute; top: 104px; left: 153px;  color: red; height: 46px; width: 312px;" Visible="False"></asp:Label>
     <div style="height: 552px">
         <asp:TextBox class="form-control" TabIndex="0" ID="emailTextBox" runat="server" style="position:absolute; top: 180px; left: 206px; height: 40px; width: 200px;"></asp:TextBox>
            <asp:TextBox  class="form-control" ID="passwordTextBox" TextMode="Password" runat="server" style="position:absolute; top: 223px; left: 205px; height:40px; width: 200px;"></asp:TextBox>
           <asp:Button ID="loginButton" class="btn btn-primary btn-lg" runat="server" ValidationGroup='login' Text="Login" style="position:absolute;  top: 198px; left: 404px; height: 40px; width: 78px;" OnClick="registerButton_Click"/> 
             <asp:Button ID="forgotPasswordButton" class="btn btn-primary btn-lg" runat="server" Text="Forgot password" style="position:absolute;   top: 144px; left: 822px; height: 44px; width: 178px;" OnClick="forgotPasswordButton_Click"/>
            <asp:Button  ID="registerButton" class="btn btn-primary btn-lg" runat="server" Text="Register" style="position:absolute;  top: 224px; left: 833px; height: 42px; width: 126px;" OnClick="registerButton_Click1"/>
         
         
            </div>
        <asp:Label ID="passwordLabel" runat="server" Text="password" style="position:absolute; top: 228px; left: -17px; height: 27px; width: 66px; margin-left: 141px;"></asp:Label>
     
         <asp:Label ID="accountActivatedLabel" runat="server" Text="Your account is not activated" style="position:absolute; top: 177px; left: 500px; color: red;" Visible="False"></asp:Label>
         <asp:Label ID="wrongEmailOrPasswordLabel" runat="server" Text="Wrong username or password" style="position:absolute; top: 206px; left: 499px; color: red;" Visible="False"></asp:Label>

        <asp:Label ID="emailLabel" runat="server" Text="Email" style="position:absolute; top: 184px; left: 150px; width: 42px;"></asp:Label>
         
         
        
      
        
       
    
        <div class="g-recaptcha" ID="captcha" runat="server" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI" style= " position:absolute; height: 77px; width: 270px; margin-top: 188px; margin-right: 0px; top: 129px; left: 135px;"></div>
        <asp:Label ID="robotLabel" runat="server" Text="Are you a robot? If not, check the box!" style="position:absolute; top: 344px; left: 430px; color: red;" Visible="False"></asp:Label>

        <Button ID="ButtonInfo" class="btn btn-primary btn-lg" runat="server" Text="Information" style="position:absolute;  top: 450px; left: 150px; height: 42px; width: 126px;" OnClick="loadDoc()"/>
        <asp:Label ID="LabelInfo" runat="server" Text="" style="position:absolute; top: 462px; left: 300px; color: red;" Visible="False"></asp:Label>

        <script>
        function loadDoc() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("LabelInfo").innerHTML =
                this.responseText;
            }
        };
        xhttp.open("GET", "Information.txt", true);
        xhttp.send();
}
</script>

</asp:Content>

