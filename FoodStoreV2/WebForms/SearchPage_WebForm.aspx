<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="SearchPage_WebForm.aspx.cs" Inherits="FoodStoreV2.WebForms.SearchPage_WebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
    
        
           <ajaxToolkit:AutoCompleteExtender ID="searchTextBox_AutoCompleteExtender" runat="server" BehaviorID="searchTextBox_AutoCompleteExtender" ServiceMethod="GetCompletionList" DelimiterCharacters="" ServicePath="~/WebForms/SearchHints.asmx" TargetControlID="searchTextBox">
           </ajaxToolkit:AutoCompleteExtender>
    
     <div style="height: 552px">
         <asp:GridView ID="searchResultGridView"  AutoGenerateColumns="false" runat="server" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" style="position:absolute; top: 65px; left: 122px; height: 193px; width: 256px;">
                 <Columns>

                 <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                 <asp:LinkButton runat="server" CssClass="noeffect" ID="openProductButton" Text='<%# Eval("name") %>' style="font-size:12px;" OnClick="product_onClick" CausesValidation="False"></asp:LinkButton>

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
     

        <asp:CheckBox ID="ppapCheckBox" runat="server" style="position:absolute; top: 182px; left: 589px;" Text="PPAP" />
        <asp:CheckBox ID="fruitCheckBox" runat="server" style="position:absolute; top: 237px; left: 591px;" Text="Fruit" />
        <asp:CheckBox ID="fishCheckBox" runat="server" style="position:absolute; top: 131px; left: 586px;" Text="Fish" />
        <asp:CheckBox ID="japaneseFoodCheckBox" runat="server" style="position:absolute; top: 263px; left: 593px;" Text="Japanese Food" />
        <asp:CheckBox ID="pancakeCheckBox" runat="server" style="position:absolute; top: 153px; left: 587px;" Text="Pancake" />
        <asp:CheckBox ID="vegetableCheckBox" runat="server" style="position:absolute; top: 208px; left: 590px;" Text="Vegetable" />
        <asp:CheckBox ID="otherTextBox" runat="server" style="position:absolute; top: 292px; left: 594px;" Text="Other" />

             <asp:RequiredFieldValidator ID="searchFieldValidator" runat="server" ValidationGroup='search' ErrorMessage="Search field cant be empty" ControlToValidate="searchTextBox" style="position:absolute; top: 244px; left: 797px;"></asp:RequiredFieldValidator>
        <asp:Button class="btn btn-primary btn-lg" ID="searchButton" runat="server" ValidationGroup='search' Text="Search" style="position:absolute; top: 156px; left: 1048px;" OnClick="searchButton_Click" />
         <asp:TextBox class="form-control" ID="searchTextBox"  runat="server" style="position:absolute; top: 155px; left: 755px; width: 248px;"></asp:TextBox>
       
         
                </div>
    
          
</asp:Content>
 