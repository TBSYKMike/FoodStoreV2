using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class AdRedirector : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String adversitmentName = Request.QueryString["ad"];
            String redirectAspx = Request.QueryString["target"];
            if (adversitmentName == null | redirectAspx == null)
            {
                redirectAspx = "ShoppingPage_WebForm.aspx";
            }
            System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
            String path = @"~/App_Data/AdResponses.xml";
            doc.Load(Server.MapPath(path));
            System.Xml.XmlNode root = doc.DocumentElement;
            System.Xml.XmlNode adNode = root.SelectSingleNode(@"descendant::ad[@adname='" + adversitmentName + "']");
            if (adNode != null)
            {
                int count = int.Parse(adNode.Attributes["hitCount"].Value);
                count += 1;
                System.Xml.XmlNode newAdNode = adNode.CloneNode(false);
                newAdNode.Attributes["hitCount"].Value = count.ToString();
                root.ReplaceChild(newAdNode, adNode);
                doc.Save(Server.MapPath(path));
            }
            Response.Redirect(redirectAspx);
        }
    }
}
