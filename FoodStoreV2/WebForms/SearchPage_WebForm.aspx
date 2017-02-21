<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.SearchPage_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <div style="height: 552px">
         <asp:GridView ID="searchResultGridView" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 65px; left: 122px; height: 193px; width: 256px;">
        </asp:GridView>
     


           <asp:CheckBox ID="category1" runat="server" style="position:absolute; top: 283px; left: 578px;" Text="category1" />
        <asp:CheckBox ID="category2" runat="server" style="position:absolute; top: 173px; left: 575px;" Text="category2" />
        <asp:CheckBox ID="category3" runat="server" style="position:absolute; top: 229px; left: 574px;" Text="category3" />
        <asp:CheckBox ID="category4" runat="server" style="position:absolute; top: 131px; left: 586px;" Text="category4" />

          <asp:TextBox class="form-control" ID="searchTextBox" runat="server" style="position:absolute; top: 155px; left: 755px; width: 248px;"></asp:TextBox>
             <asp:RequiredFieldValidator ID="searchFieldValidator" runat="server" ValidationGroup='search' ErrorMessage="Search field cant be empty" ControlToValidate="searchTextBox" style="position:absolute; top: 244px; left: 797px;"></asp:RequiredFieldValidator>
     
           <asp:Button class="btn btn-primary btn-lg" ID="searchButton" runat="server" ValidationGroup='search' Text="Search" style="position:absolute; top: 156px; left: 1048px;" OnClick="searchButton_Click" />
         
                </div>
    

</asp:Content>
 