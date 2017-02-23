<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Register_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>


     <script type="text/javascript">
             function hideResultLabel() {
                document.getElementById('<%= accountCreatedLabel.ClientID %>').style.display = 'none';
         }
         </script>
    <div style="height: 638px">
    </div>
        <asp:Label ID="userNameLabel" runat="server" Text="User name" style="position:absolute; top: 144px; left: -24px; height: 17px; width: 75px; margin-left: 141px;"></asp:Label>
        <asp:TextBox ID="userNameTextBox" class="form-control" runat="server" style="position:absolute; top: 140px; left: 207px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:CustomValidator ID="userNameExistValidator" ValidationGroup='register' runat="server" style="position:absolute; top: 150px; left: 377px; width: 14px; height: 12px;" ControlToValidate="userNameTextBox" Text="*" ErrorMessage="Username allready exist" OnServerValidate="userNameExistValidator_ServerValidate"></asp:CustomValidator>
    
        <asp:Label ID="passwordOneLabel" runat="server" Text="password" style="position:absolute; top: 228px; left: -17px; height: 27px; width: 66px; margin-left: 141px;"></asp:Label>
        <asp:TextBox ID="passwordTextBox" class="form-control" TextMode="Password" runat="server" style="position:absolute; top: 223px; left: 205px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ValidationGroup='register' style="position:absolute; top: 236px; left: 386px; width: 25px; height: 15px;" ControlToValidate="passwordTextbox" Text="*" ErrorMessage="Password must be with numbers and letters and at least 10 char long" ValidationExpression ="^(?=.*\d)(?=.*[a-zA-Z]).{10,}$"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup='register' style="position:absolute; top: 111px; left: 376px; height: 11px; width: 11px;" ErrorMessage="
             not match" ControlToValidate="passwordTextBox" ControlToCompare="repasswordTextBox" Text="*" ></asp:CompareValidator>
       
        <asp:Label ID="passwordTwoLabel" runat="server" Text="re-enter password" style="position:absolute; top: 107px; left: 84px;"></asp:Label>
        <asp:TextBox ID="repasswordTextBox" class="form-control" TextMode="Password" runat="server" style="position:absolute; top: 98px; left: 207px; height: 22px; width: 139px;"></asp:TextBox> 

       
        <asp:Label ID="emailLabel" runat="server" Text="Email" style="position:absolute; top: 184px; left: 150px; width: 42px;"></asp:Label>
        <asp:TextBox ID="emailTextBox" class="form-control" runat="server" style="position:absolute; top: 180px; left: 206px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:CustomValidator ID="emailExistValidator" ValidationGroup='register' runat="server" style="position:absolute; top: 188px; left: 377px; width: 14px; height: 12px;" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Email allready exist" OnServerValidate="emailExistValidator_ServerValidate"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="emailCorrectValidator" ValidationGroup='register' runat="server" style="position:absolute; top: 190px; left: 399px; width: 11px; height: 17px;" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Not a valid email" ValidationExpression ="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
        <asp:Label ID="nameLabel" runat="server" Text="Name" style="position:absolute; top: 312px; left: 147px;"></asp:Label>
        <asp:TextBox ID="nameTextBox" class="form-control" runat="server" style="position:absolute; top: 308px; left: 201px; height: 22px; width: 139px;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="nameValidator" ValidationGroup='register' runat="server" style="position:absolute; top: 321px; left: 369px; height: 14px; width: 16px;" ControlToValidate="nameTextBox" Text="*" ErrorMessage="Name must be with letters" ValidationExpression ="[a-zA-Z]{1,20}"></asp:RegularExpressionValidator>
     
        <asp:Label ID="streetAdressLabel" runat="server" Text="adress" style="position:absolute; top: 273px; left: 137px; height: 22px;"></asp:Label>
        <asp:TextBox ID="streetAdressTextBox" class="form-control" runat="server" style="position:absolute; top: 264px; left: 201px; height: 22px; width: 139px;"></asp:TextBox>
        <asp:CustomValidator ID="adressValidator" runat="server"  ValidationGroup='register' style="position:absolute; top: 274px; left: 370px; height: 13px; width: 21px;" ControlToValidate="streetAdressTextbox" Text="*" ErrorMessage="Not a valid adress" OnServerValidate="streetValidate"></asp:CustomValidator>
  
        <asp:Label ID="cityLabel" runat="server" Text="City" style="position:absolute; top: 356px; left: 159px; height: 22px;"></asp:Label>
        <asp:TextBox ID="cityTextbox" class="form-control" runat="server" style="position:absolute; top: 350px; left: 202px; height: 22px; width: 139px;"></asp:TextBox> 

        <asp:Label ID="Postcodelabel" runat="server" Text="Post Code" style="position:absolute; top: 396px; left: 126px; height: 22px;"></asp:Label>
        <asp:TextBox ID="postCodetextBox" class="form-control" runat="server" style="position:absolute; top: 399px; left: 201px; height: 22px; width: 139px;"></asp:TextBox> 

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup='register' HeaderText="All the errors:    "   style="position:absolute; top: 135px; left: 754px; height: 152px; width: 337px;"/>
        
        <asp:Button ID="registerButton" class="btn btn-primary btn-lg" runat="server" OnClientClick="hideResultLabel();" Text="Register" ValidationGroup='register' style="position:absolute; top: 586px; left: 146px; height: 42px; width: 130px;" OnClick="registerButton_Click"/>
        <asp:Label ID="accountCreatedLabel" runat="server" Text="Account created. Before login account activation is required. Check your mail!" style="position:absolute; top: 591px; left: 360px;" Visible="False"></asp:Label>
        
        <div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI" style= " position:absolute; height: 77px; width: 270px; margin-top: 188px; margin-right: 0px; top: 274px; left: 94px;"></div>
        <asp:Label ID="robotLabel" runat="server" Text="Are you a robot? If not, check the box!" style="position:absolute; top: 488px; left: 389px; color: red;" Visible="False"></asp:Label>
</asp:Content>
