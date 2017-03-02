<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="SearchPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.SearchPage_WebForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="col-xs-12 default-style">
        <div class="col-sm-12 col-md-12 ">
            <div class="jumbotron">
                <h1>Search</h1>
            </div>
        </div>
        <div class="col-sm-12 col-md-1" style="background-color: cornflowerblue">
        </div>
        <div class="col-sm-12 col-md-8 border default-style-content" style="">
            <div class="col-sm-12" style="background-color: burlywood">

                <!-- Holder for error messages -->
            </div>
            <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>


            <ajaxToolkit:AutoCompleteExtender ID="searchTextBox_AutoCompleteExtender" runat="server" BehaviorID="searchTextBox_AutoCompleteExtender" ServiceMethod="GetCompletionList" DelimiterCharacters="" ServicePath="~/WebForms/SearchHints.asmx" TargetControlID="searchTextBox">
            </ajaxToolkit:AutoCompleteExtender>




            <div class="col-sm-12">
                


                <br />
                <br />
                <asp:CheckBox ID="ppapCheckBox" runat="server" Style="" Text="PPAP  " />
                <asp:CheckBox ID="fruitCheckBox" runat="server" Style="" Text="Fruit  " />
                <asp:CheckBox ID="fishCheckBox" runat="server" Style="" Text="Fish  " />
                <asp:CheckBox ID="japaneseFoodCheckBox" runat="server" Style="" Text="Japanese Food  " />
                <asp:CheckBox ID="pancakeCheckBox" runat="server" Style="" Text="Pancake  " />
                <asp:CheckBox ID="vegetableCheckBox" runat="server" Style="" Text="Vegetable  " />
                <asp:CheckBox ID="otherTextBox" runat="server" Style="" Text="Other  " />
                
                <br />
                <asp:RequiredFieldValidator ID="searchFieldValidator" runat="server" ValidationGroup='search' ErrorMessage="Search field cant be empty" ControlToValidate="searchTextBox" Style=""></asp:RequiredFieldValidator>
                
                <asp:TextBox class="form-control" ID="searchTextBox" runat="server" Style=""></asp:TextBox>
                <br />
                <asp:Button class="btn btn-primary btn-lg" ID="searchButton" runat="server" ValidationGroup='search' Text="Search" Style="" OnClick="searchButton_Click" />


            </div>
            <br />
            <div class="col-sm-12">

                <asp:GridView ID="searchResultGridView" AutoGenerateColumns="false" runat="server" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" Style="height: 193px; width: 256px;">
                    <Columns>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("name") %>' Style="font-size: 12px;" OnClick="product_onClick" CausesValidation="False"></asp:LinkButton>

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

                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="txtAmount" runat="server" Text='<%# Eval("Amount") %>'>

                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>

                </asp:GridView>

            </div>
            <br />
        </div>
        <div class="col-sm-12 col-md-3" style="background-color: deepskyblue">
        </div>
    </div>

</asp:Content>
