<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.ShoppingCart_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-xs-12 default-style">
        <div class="col-sm-12 col-md-12 ">
            <div class="jumbotron">
                <h1>Shopping Cart</h1>
            </div>
        </div>
        <div class="col-sm-12 col-md-1" style="background-color: cornflowerblue">
        </div>
        <div class="col-sm-12 col-md-8 border default-style-content" style="">
            <div class="col-sm-12" style="background-color: burlywood">

                <!-- Holder for error messages -->
            </div>
            <div class="col-xs-12">
                <!-- Holder for main content -->
                <div class="container">
                    <h2>Order Progress</h2>
                    
                    <div class="progress">
                        <div class="progress-bar progress-bar-success active" role="progressbar" style="width: 33%">
                            Cart
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12">
                  <div class="round_corners">  
                <asp:GridView AutoGenerateColumns="false" ID="shoppingCartGridView" HeaderStyle-BackColor="#99ccff"
        HeaderStyle-ForeColor="White" RowStyle-BackColor="#e1e1d0" AlternatingRowStyle-BackColor="#f5f5ef"
        RowStyle-ForeColor="#3A3A3A" runat="server" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" class="productgridview">
                    <Columns>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("name") %>' Style="font-size: 12px;" OnClick="product_onClick"></asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="txtPrice" runat="server">
                                    <%# Eval("Price") %> kr
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
                                <asp:LinkButton runat="server" CssClass="noeffect" ID="removeButton" Text="-" Style="font-size: 22px; color:red;" OnClick="removeButton_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="deleteButton" class="btn btn-danger btn-xs" runat="server" Text="Delete" OnClick="deleteFromCartButton_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                           </div>
                <asp:Label ID="cartEmptyLabel" color='red' runat="server" Text="Cart is empty!" Style=" " Visible="false">Cart is empty! <br /><br /> </asp:Label>
                
                <asp:Button ID="clearCartButton" class="btn btn-danger btn-md" runat="server" Text="Clear cart" Style="" OnClick="clearCartButton_Click" />
                <br />
                <br />
                
                <br />
                <asp:Label ID="userInformation" runat="server" Style=" "></asp:Label>
                <br />
                <asp:Label ID="totalPriceLabel" runat="server" Style=" "></asp:Label>
                <br />
                <asp:Label ID="CustomerInfoLabel" color='red' runat="server" Style=" "></asp:Label>
                <br />
                <asp:Button ID="confirmAndPayButton" class="btn btn-success btn-lg" runat="server" Text="Confirm and pay" Style=" " OnClick="confirmAndPayButton_Click" />
                <br />
                
            </div>
        </div>
        <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
        </div>
    </div>

</asp:Content>
