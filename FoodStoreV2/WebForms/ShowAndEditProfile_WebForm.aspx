<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowAndEditProfile_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShowAndEditProfile_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div style="height: 552px">
    </div>
         <script type="text/javascript">
             function hideResultLabel() {
                document.getElementById('<%= updateConfirmLabel.ClientID %>').style.display = 'none';
         }
         </script>

        <asp:Label ID="userNameLabel" runat="server" Text="User name" style="position:absolute; top: 144px; left: -24px; height: 17px; width: 75px; margin-left: 141px;"></asp:Label>
        <asp:TextBox ID="userNameTextBox" runat="server" style="position:absolute; top: 140px; left: 207px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:CustomValidator ID="userNameExistValidator" ValidationGroup='update' runat="server" style="position:absolute; top: 150px; left: 377px; width: 16px; height: 12px;" ControlToValidate="userNameTextBox" Text="*" ErrorMessage="Username allready exist" OnServerValidate="userNameExistValidator_ServerValidate"></asp:CustomValidator>
    
        <asp:Label ID="passwordOneLabel" runat="server" Text="password" style="position:absolute; top: 228px; left: -17px; height: 27px; width: 66px; margin-left: 141px;"></asp:Label>
        <asp:TextBox ID="passwordTextBox" TextMode="Password" runat="server" style="position:absolute; top: 223px; left: 205px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ValidationGroup='update' style="position:absolute; top: 236px; left: 364px; width: 15px; height: 15px;" ControlToValidate="passwordTextbox" Text="*" ErrorMessage="Password must be with numbers and letters and at least 10 char long" ValidationExpression ="^(?=.*\d)(?=.*[a-zA-Z]).{10,}$"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup='update' style="position:absolute; top: 111px; left: 376px; height: 11px; width: 11px;" ErrorMessage="Passwords do not match" ControlToValidate="passwordTextBox" ControlToCompare="repasswordTextBox" Text="*" ></asp:CompareValidator>
       
        
        <asp:Label ID="passwordTwoLabel" runat="server" Text="re-enter password" style="position:absolute; top: 107px; left: 84px;"></asp:Label>
        <asp:TextBox ID="repasswordTextBox" TextMode="Password" runat="server" style="position:absolute; top: 98px; left: 207px; height: 22px; width: 139px;"></asp:TextBox> 

        <asp:Label ID="oldPasswordLabel" runat="server" Text="Old password" style="position:absolute; top: 451px; left: 101px;"></asp:Label>
        <asp:TextBox ID="oldPasswordTextBox" TextMode="Password" runat="server" style="position:absolute; top: 450px; left: 203px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:CustomValidator ID="oldPasswordMatchValidator" ValidationGroup='update' runat="server" style="position:absolute; top: 461px; left: 406px; width: 13px; height: 9px;" ControlToValidate="oldPasswordTextBox" Text="*" ErrorMessage="Old password is incorrect" OnServerValidate="oldPasswordMatchValidator_ServerValidate"></asp:CustomValidator>
        <asp:RequiredFieldValidator ID="oldPasswordRequirement" runat="server" style="position:absolute; top: 461px; left: 379px; width: 12px; height: 9px;" ValidationGroup='update' ErrorMessage="Please enter your old password" ControlToValidate="oldPasswordTextBox">*</asp:RequiredFieldValidator>   

        <asp:Label ID="emailLabel" runat="server" Text="Email" style="position:absolute; top: 184px; left: 150px; width: 42px;"></asp:Label>
        <asp:TextBox ID="emailTextBox" runat="server" style="position:absolute; top: 180px; left: 206px; height: 22px; width: 139px;"></asp:TextBox> 
        <asp:CustomValidator ID="emailExistValidator" ValidationGroup='update' runat="server" style="position:absolute; top: 188px; left: 377px; width: 14px; height: 12px;" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Email allready exist" OnServerValidate="emailExistValidator_ServerValidate"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="emailCorrectValidator" ValidationGroup='update' runat="server" style="position:absolute; top: 190px; left: 399px; width: 11px; height: 17px;" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Not a valid email" ValidationExpression ="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
        <asp:Label ID="nameLabel" runat="server" Text="Name" style="position:absolute; top: 312px; left: 147px;"></asp:Label>
        <asp:TextBox ID="nameTextBox" runat="server" style="position:absolute; top: 308px; left: 201px; height: 22px; width: 139px;"></asp:TextBox>
        <asp:RegularExpressionValidator ID="nameValidator" ValidationGroup='update' runat="server" style="position:absolute; top: 321px; left: 369px; height: 14px; width: 16px;" ControlToValidate="nameTextBox" Text="*" ErrorMessage="Name must be with letters" ValidationExpression ="[a-zA-Z]{1,20}"></asp:RegularExpressionValidator>
     
        <asp:Label ID="streetAdressLabel" runat="server" Text="adress" style="position:absolute; top: 273px; left: 137px; height: 22px;"></asp:Label>
        <asp:TextBox ID="streetAdressTextBox" runat="server" style="position:absolute; top: 264px; left: 201px; height: 22px; width: 139px;"></asp:TextBox>
        <asp:CustomValidator ID="adressValidator" runat="server"  ValidationGroup='update' style="position:absolute; top: 274px; left: 370px; height: 13px; width: 21px;" ControlToValidate="streetAdressTextbox" Text="*" ErrorMessage="Not a valid adress" OnServerValidate="streetValidate"></asp:CustomValidator>
  
        <asp:Label ID="cityLabel" runat="server" Text="City" style="position:absolute; top: 356px; left: 159px; height: 22px;"></asp:Label>
        <asp:TextBox ID="cityTextbox" runat="server" style="position:absolute; top: 350px; left: 202px; height: 22px; width: 139px;"></asp:TextBox> 

        <asp:Label ID="Postcodelabel" runat="server" Text="Post Code" style="position:absolute; top: 396px; left: 126px; height: 22px;"></asp:Label>
        <asp:TextBox ID="postCodetextBox" runat="server" style="position:absolute; top: 399px; left: 201px; height: 22px; width: 139px;"></asp:TextBox> 

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup='update' HeaderText="All the errors:    "   style="position:absolute; top: 135px; left: 754px; height: 152px; width: 337px;"/>
        
        <asp:Button ID="updateButton" runat="server" Text="Update profile" OnClientClick="hideResultLabel();" ValidationGroup='update' style="position:absolute; top: 357px; left: 480px;" OnClick="updateButton_Click"/>
        <asp:Label ID="updateConfirmLabel" runat="server" Text="Account updated!" style="position:absolute; top: 356px; left: 632px; height: 38px; width: 127px;" Visible="False"></asp:Label>
     
</asp:Content>
