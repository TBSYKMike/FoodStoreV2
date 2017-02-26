<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.Register_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>


    <script type="text/javascript">
        function hideResultLabel() {
            document.getElementById('<%= accountCreatedLabel.ClientID %>').style.display = 'none';
        }
    </script>

    <script>
        $(function () {

            var overPopup = false;

            $('[rel=popoverinfo]').popover({
                trigger: 'manual',
                placement: 'right'

                // replacing hover with mouseover and mouseout
            }).mouseover(function (e) {
                // when hovering over an element which has a popover, hide
                // them all except the current one being hovered upon
                $('[rel=popoverinfo]').not('#' + $(this).attr('id')).popover('hide');
                var $popover = $(this);
                $popover.popover('show');

                // set a flag when you move from button to popover
                // dirty but only way I could think of to prevent
                // closing the popover when you are navigate across
                // the white space between the two
                $popover.data('popoverinfo').tip().mouseenter(function () {
                    overPopup = true;
                }).mouseleave(function () {
                    overPopup = false;
                    $popover.popover('hide');
                });

            }).mouseout(function (e) {
                // on mouse out of button, close the related popover
                // in 200 milliseconds if you're not hovering over the popover
                var $popover = $(this);
                setTimeout(function () {
                    if (!overPopup) {
                        $popover.popover('hide');
                    }
                }, 200);
            });
        });
    </script>


    <div class="col-sm-12 ">
        <div class="jumbotron">
            <!-- <div class="page-header"> -->
            <h1>Register</h1>
            <p>Please register an account to be enable you to buy from our wonderful shop.</p>
        </div>
    </div>
    <div class="col-sm-12 col-md-1" style="background-color: mediumaquamarine">
    </div>
    <div class="col-sm-12 col-md-8" style="background-color: none">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <div class="col-sm-12" style="background-color: burlywood">
            error messages

        </div>
        <br />
        <div class="col-sm-12" style="background-color: none">



            <asp:Label ID="userNameLabel" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="userNameTextBox" class="form-control" runat="server" placeholder="Enter Username here"></asp:TextBox>
            <asp:CustomValidator ID="userNameExistValidator" ValidationGroup='register' runat="server" ControlToValidate="userNameTextBox" Text="*" ErrorMessage="Username allready exist" OnServerValidate="userNameExistValidator_ServerValidate"></asp:CustomValidator>

            <asp:Label ID="passwordOneLabel" runat="server" Text="Password"></asp:Label>
            <asp:Label ID="LabelInfo" runat="server" rel="popoverinfo" data-content="Password must contain minimum over 10 characters and contain both Letters & Numbers" >[?]</asp:Label>
            <asp:TextBox ID="passwordTextBox" class="form-control" TextMode="Password" runat="server" placeholder="Enter Password here"></asp:TextBox>
            <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ValidationGroup='register'
                ControlToValidate="passwordTextbox" Text="*" ErrorMessage="Password must be with numbers and letters and at least 10 char long" ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z]).{10,}$"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup='register' ErrorMessage="not match"
                ControlToValidate="passwordTextBox" ControlToCompare="repasswordTextBox" Text="*"></asp:CompareValidator>

            <asp:Label ID="passwordTwoLabel" runat="server" Text="Re-Enter Password"></asp:Label>
            <asp:TextBox ID="repasswordTextBox" class="form-control" TextMode="Password" runat="server" placeholder="Re-Enter Password here"></asp:TextBox>


            <asp:Label ID="emailLabel" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="emailTextBox" class="form-control" runat="server" placeholder="Enter Email here"></asp:TextBox>
            <asp:CustomValidator ID="emailExistValidator" ValidationGroup='register' runat="server" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Email allready exist" OnServerValidate="emailExistValidator_ServerValidate"></asp:CustomValidator>
            <asp:RegularExpressionValidator ID="emailCorrectValidator" ValidationGroup='register' runat="server" ControlToValidate="emailTextBox" Text="*" ErrorMessage="Not a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="nameTextBox" class="form-control" runat="server" placeholder="Enter Name here"></asp:TextBox>
            <asp:RegularExpressionValidator ID="nameValidator" ValidationGroup='register' runat="server" ControlToValidate="nameTextBox" Text="*" ErrorMessage="Name must be with letters" ValidationExpression="[a-zA-Z]{1,20}"></asp:RegularExpressionValidator>

            <asp:Label ID="streetAdressLabel" runat="server" Text="Address"></asp:Label>
            <asp:Label ID="Label1" runat="server" rel="popoverinfo" data-content="Address must contain both Street Name and Number" >[?]</asp:Label>
            <asp:TextBox ID="streetAdressTextBox" class="form-control" runat="server" placeholder="Enter Address here"></asp:TextBox>
            <asp:CustomValidator ID="adressValidator" runat="server" ValidationGroup='register' ControlToValidate="streetAdressTextbox" Text="*" ErrorMessage="Not a valid adress" OnServerValidate="streetValidate"></asp:CustomValidator>

            <asp:Label ID="cityLabel" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="cityTextbox" class="form-control" runat="server" placeholder="Enter City here"></asp:TextBox>

            <asp:Label ID="Postcodelabel" runat="server" Text="Post Code"></asp:Label>
            <asp:TextBox ID="postCodetextBox" class="form-control" runat="server" placeholder="Enter Post code here"></asp:TextBox>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup='register' HeaderText="All the errors:    " />
            <br />
            <div class="col-sm-12" style="background-color: bisque">
                <div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
                <asp:Label ID="robotLabel" runat="server" Text="Are you a robot? If not, check the box!" Visible="False"></asp:Label>
            </div>
            <br />
            <asp:Button ID="registerButton" class="btn btn-primary btn-lg" runat="server" OnClientClick="hideResultLabel();" Text="Register" ValidationGroup='register' OnClick="registerButton_Click" />
            <asp:Label ID="accountCreatedLabel" runat="server" Text="Account created. Before login account activation is required. Check your mail!" Visible="False"></asp:Label>



        </div>
        <br />
    </div>
    <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
    </div>


</asp:Content>
