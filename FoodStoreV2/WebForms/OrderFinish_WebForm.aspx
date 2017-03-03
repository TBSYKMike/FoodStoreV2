<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderFinish_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.OrderFinish_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="col-xs-12">
                <!-- Holder for main content -->
                <div class="container">
                    <h2>Order Progress</h2>
                    
                    <div class="progress">
                        <div class="progress-bar progress-bar-success " role="progressbar" style="width: 33%">
                           
                        </div>
                        <div class="progress-bar progress-bar-success" role="progressbar" style="width: 33%">
                            
                        </div>
                         <div class="progress-bar progress-bar-success" role="progressbar" style="width: 34%">
                            
                        </div>
                       
                    </div>
                </div>
            </div>

<div class="col-sm-12 row text-center " style="background-color: navajowhite;">
        <h1>Your order is completed!</h1>
        <br />
        <br />
         An email has been sent to you with the order details.
    </div>

    
</asp:Content>
