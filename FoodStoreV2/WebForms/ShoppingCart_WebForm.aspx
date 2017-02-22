
<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingCart_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <div style="height: 552px">
           <asp:GridView AutoGenerateColumns="false" ID="shoppingCartGridView" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 88px; left: 100px; height: 324px; width: 422px;">
         <Columns>

                 <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                 <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("name") %>' style="font-size:12px;" OnClick="product_onClick"></asp:LinkButton>

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
                            <asp:TextBox runat="server" ID="txtQuantity" OnTextChanged="txtQuantity_TextChanged"
                        AutoPostBack="True" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox><br />
                            <asp:LinkButton runat="server" CssClass="noeffect" ID="addButton" Text="+" style="font-size:22px;" OnClick="addButton_Click"></asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="noeffect" ID="removeButton" Text="-" style="font-size:22px;"  OnClick="removeButton_Click"></asp:LinkButton> 
                        </ItemTemplate>
                    </asp:TemplateField>


               <asp:TemplateField>
            <ItemTemplate>
                     <asp:Button  ID="registerButton" class="btn btn-primary btn-xs" runat="server" Text="Delete" OnClick="deleteFromCartButton_Click"/>
            </ItemTemplate>
        </asp:TemplateField>


                </Columns>
     </asp:GridView>

        <asp:Label ID="CustomerInfoLabel" color='red' runat="server" style="position:absolute; top: 197px; left: 577px; height: 68px; width: 199px;"></asp:Label>
        <asp:Button ID="confirmAndPayButton" class="btn btn-primary btn-lg" runat="server" Text="Confirm and pay" style="position:absolute; top: 331px; left: 672px;" OnClick="confirmAndPayButton_Click"/>
                </div>
    

</asp:Content>