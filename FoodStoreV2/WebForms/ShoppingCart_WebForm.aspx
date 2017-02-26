<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingCart_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-xs-12">
        <div class="container">
            <h2>Order Progress</h2>
            <p>Create a stacked progress bar by placing multiple bars into the same div with class .progress:</p>
            <div class="progress">
                <div class="progress-bar progress-bar-success active" role="progressbar" style="width: 33%">
                    Cart
                </div>
                <div class="progress-bar progress-bar-warning" role="progressbar" style="width: 33%">
                    Payment
                </div>
                <div class="progress-bar progress-bar-striped " role="progressbar" style="width: 34%">
                    Finished
                </div>
            </div>
        </div>
    </div>

    <div style="height: 552px">
        <asp:GridView AutoGenerateColumns="false" ID="shoppingCartGridView" runat="server" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" Style="position: absolute; top: 88px; left: 100px; height: 324px; width: 422px;">
            <Columns>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("name") %>' Style="font-size: 12px;" OnClick="product_onClick"></asp:LinkButton>

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
                        <asp:LinkButton runat="server" CssClass="noeffect" ID="addButton" Text="+" Style="font-size: 22px;" OnClick="addButton_Click"></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="noeffect" ID="removeButton" Text="-" Style="font-size: 22px;" OnClick="removeButton_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="deleteButton" class="btn btn-primary btn-xs" runat="server" Text="Delete" OnClick="deleteFromCartButton_Click" />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>
        <asp:Label ID="cartEmptyLabel" color='red' runat="server" Text="Cart is empty!" Style="position: absolute; top: 307px; left: 939px; height: 49px; width: 135px;" Visible="false"></asp:Label>
        <asp:Label ID="userInformation" runat="server" Style="position: absolute; top: 11px; left: 767px; height: 126px; width: 340px;"></asp:Label>
        <asp:Label ID="totalPriceLabel" runat="server" Style="position: absolute; top: 129px; left: 847px; height: 93px; width: 339px;"></asp:Label>
        <asp:Label ID="CustomerInfoLabel" color='red' runat="server" Style="position: absolute; top: 211px; left: 560px; height: 36px; width: 239px;"></asp:Label>
        <asp:Button ID="confirmAndPayButton" class="btn btn-primary btn-lg" runat="server" Text="Confirm and pay" Style="position: absolute; top: 240px; left: 873px;" OnClick="confirmAndPayButton_Click" />
        <asp:Button ID="clearCartButton" class="btn btn-primary btn-lg" runat="server" Text="Clear cart" Style="position: absolute; top: 341px; left: 536px; height: 40px; width: 122px;" OnClick="clearCartButton_Click" />
    </div>


</asp:Content>
