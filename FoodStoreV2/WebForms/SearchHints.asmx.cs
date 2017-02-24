using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FoodStoreV2
{
    /// <summary>
    /// Summary description for SearchHints
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SearchHints : System.Web.Services.WebService
    {

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetCompletionList(string prefixText, int count)
{
            System.Diagnostics.Debug.WriteLine("GetCompletionList");

            DatabaseConnector databaseConnector = new DatabaseConnector();

            List<Product> productList = databaseConnector.getProductsOnCategory(0);

            List<String> suggestions = new List<string>();
            for (int i=0;i< productList.Count; i++)
            {
                if(productList[i].getName().Contains(prefixText))
                suggestions.Add(productList[i].getName());
            }
            return suggestions.ToArray();
} 
    }
}
