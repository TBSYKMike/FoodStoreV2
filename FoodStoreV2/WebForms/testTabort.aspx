<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testTabort.aspx.cs" Inherits="FoodStoreV2.WebForms.testTabort" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
           <asp:ScriptManager runat="server" EnablePageMethods="True" EnableScriptGlobalization="True" >
               </asp:ScriptManager>

           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           <ajaxToolkit:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" BehaviorID="TextBox1_AutoCompleteExtender" ServiceMethod="GetCompletionList" DelimiterCharacters="" ServicePath="~/WebForms/SearchHints.asmx" TargetControlID="TextBox1">
           </ajaxToolkit:AutoCompleteExtender>

    <div>
    
    </div>
    </form>
</body>
</html>
