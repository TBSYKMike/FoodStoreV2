<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowAndEditProfile_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShowAndEditProfile_WebForm" %>

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

                <!-- Holder for error messages -->
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup='update' HeaderText="All the errors:    " Style="" />
            </div>
            <br />
            <div class="col-sm-12 rounded" style="background-color: none">
                <!-- Holder for main content -->
                <script type="text/javascript">
                    function hideResultLabel() {
                        document.getElementById('<%= updateConfirmLabel.ClientID %>').style.display = 'none';
                    }
                </script>

                <div class="col-sm-12 rounded" style="background-color: none">
                    <!-- Holder for Edit contact profile -->
                    <h4>Edit Contact information</h4>

                    <asp:Label ID="userNameLabel" runat="server" Text="User name" Style=""></asp:Label>
                    <asp:CustomValidator ID="userNameExistValidator" ValidationGroup='update' runat="server" Style="" ControlToValidate="userNameTextBox" Text="*" ErrorMessage="Username allready exist" OnServerValidate="userNameExistValidator_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="userNameTextBox" class="form-control" runat="server" placeholder="Enter Username here"></asp:TextBox>


                    <asp:Label ID="oldPasswordLabel" runat="server" Text="Current password" Style=""></asp:Label>
                    <asp:Label ID="LabelInfo" runat="server" rel="popoverinfo" data-content="Password must contain minimum over 10 characters and contain both Letters & Numbers">[?]</asp:Label>
                    <asp:CustomValidator ID="oldPasswordMatchValidator" ValidationGroup='update' runat="server" Style="" ControlToValidate="oldPasswordTextBox" Text="*" ErrorMessage="Old password is incorrect" OnServerValidate="oldPasswordMatchValidator_ServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="oldPasswordRequirement" runat="server" Style="" ValidationGroup='update' ErrorMessage="Please enter your old password" ControlToValidate="oldPasswordTextBox">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="oldPasswordTextBox" class="form-control" TextMode="Password" runat="server" placeholder="Enter Password here"></asp:TextBox>


                    <asp:Label ID="emailLabel" runat="server" Text="Email" Style=""></asp:Label>
                    <asp:CustomValidator ID="emailExistValidator" ValidationGroup='update' runat="server" Style="" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Email allready exist" OnServerValidate="emailExistValidator_ServerValidate"></asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="emailCorrectValidator" ValidationGroup='update' runat="server" Style="" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Not a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="emailTextBox" class="form-control" runat="server" placeholder="Enter Email here"></asp:TextBox>


                    <asp:Label ID="nameLabel" runat="server" Text="Name" Style=""></asp:Label>
                    <asp:RegularExpressionValidator ID="nameValidator" ValidationGroup='update' runat="server" Style="" ControlToValidate="nameTextBox" Text="*" ErrorMessage="Name must be with letters" ValidationExpression="[a-zA-Z]{1,20}"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="nameTextBox" class="form-control" runat="server" placeholder="Enter Name here"></asp:TextBox>


                    <asp:Label ID="streetAdressLabel" runat="server" Text="adress" Style=""></asp:Label>
                    <asp:Label ID="Label1" runat="server" rel="popoverinfo" data-content="Address must contain both Street Name and Number">[?]</asp:Label>
                    <asp:CustomValidator ID="adressValidator" runat="server" ValidationGroup='update' Style="" ControlToValidate="streetAdressTextbox" Text="*" ErrorMessage="Not a valid adress" OnServerValidate="streetValidate"></asp:CustomValidator>
                    <asp:TextBox ID="streetAdressTextBox" class="form-control" runat="server" placeholder="Enter Address here"></asp:TextBox>


                    <asp:Label ID="cityLabel" runat="server" Text="City" Style=""></asp:Label>
                    <asp:TextBox ID="cityTextbox" class="form-control" runat="server" placeholder="Enter City here"></asp:TextBox>


                    <asp:Label ID="Postcodelabel" runat="server" Text="Post Code" Style=""></asp:Label>
                    <asp:TextBox ID="postCodetextBox" class="form-control" runat="server" placeholder="Enter Post code here"></asp:TextBox>


                </div>
                <br />
                <div class="col-sm-12" style="background-color: darkseagreen">
                </div>
                <br />
                <div class="col-sm-12 rounded" style="background-color: none">
                    <!-- Holder for Edit password  -->

                    <h4>Change Password</h4>
                    <asp:Label ID="passwordOneLabel" runat="server" Text="New password" Style=""></asp:Label>
                    <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ValidationGroup='update' Style="" ControlToValidate="passwordTextbox" Text="*" ErrorMessage="Password must be with numbers and letters and at least 10 char long" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z]).{10,}$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="passwordTextBox" class="form-control" TextMode="Password" runat="server" placeholder="Enter Password here"></asp:TextBox>


                    <asp:Label ID="passwordTwoLabel" runat="server" Text="re-enter New password" Style=""></asp:Label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup='update' Style="" ErrorMessage="Passwords do not match" ControlToValidate="passwordTextBox" ControlToCompare="repasswordTextBox" Text="*"></asp:CompareValidator>
                    <asp:TextBox ID="repasswordTextBox" class="form-control" TextMode="Password" runat="server" placeholder="Re-Enter Password here"></asp:TextBox>


                </div>
                <br />
                <div class="col-sm-12 rounded" style="background-color: lawngreen">
                    <asp:Label ID="updateConfirmLabel" runat="server" Text="Account updated!" Style="" Visible="False"></asp:Label>

                </div>
                <br />
                <div class="col-sm-12 rounded" style="background-color: none">
                    <!-- Holder for buttons profile -->
                    <asp:Button ID="updateButton" class="btn btn-primary btn-lg" runat="server" Text="Update profile" OnClientClick="hideResultLabel();" ValidationGroup='update' Style="" OnClick="updateButton_Click" />

                    <br />
                    <br />

                    <asp:Button ID="orderHistoryButton" class="btn btn-info btn-lg" runat="server" Text="Order history" Style="" OnClick="orderHistoryButton_Click" />
                </div>
                <br />

            </div>
            <br />
        </div>
        <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
        </div>
    </div>



</asp:Content>
