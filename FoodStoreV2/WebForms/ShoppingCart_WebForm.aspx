
<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingCart_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <div style="height: 552px">
           <asp:GridView AutoGenerateColumns="false" ID="shoppingCartGridView" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 163px; left: 176px; height: 193px; width: 256px;">
         <Columns>

                 <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="txtName" runat="server" Text='<%# Eval("name") %>'>

                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="txtPrice" runat="server" Text='<%# Eval("Price") %>'>

                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Category">
            <ItemTemplate>
                <asp:Label ID="txtCategory" runat="server" Text='<%# Eval("Category") %>'>


          </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>




                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox><br />
                            <asp:LinkButton runat="server" CssClass="noeffect" ID="addButton" Text="+" style="font-size:12px;" OnClick="addButton_Click" CausesValidation="false"></asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="noeffect" ID="removeButton" Text="-" style="font-size:12px;"  OnClick="removeButton_Click" CausesValidation="false"></asp:LinkButton> 
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
           
           
           
           </asp:GridView>

          <asp:Button ID="deleteFromCartButton" runat="server" Text="Delete marked" style="position:absolute; top: 326px; left: 474px;" OnClick="deleteFromCartButton_Click"/>
        <asp:Label ID="CustomerInfoLabel" runat="server" style="position:absolute; top: 141px; left: 498px; height: 68px; width: 199px;"></asp:Label>
        <asp:Button ID="confirmAndPayButton" runat="server" Text="Confirm and pay" style="position:absolute; top: 110px; left: 563px;" OnClick="confirmAndPayButton_Click"/>
                </div>
    

</asp:Content>