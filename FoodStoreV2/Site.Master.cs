using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using FoodStoreV2.CSharpClasses;

namespace FoodStoreV2
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Session["FirstName"] = "";
            //Session.Add("FirstName", "");

            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["FirstName"] = "mike";
            Session.Add("FirstName", "mike");

            Response.Redirect("~/WebForms/ShoppingPage_WebForm");
        }

        protected Customer callGetCustomerSessionObject()
        {
            SessionValues sv = new SessionValues();
            return sv.getCustomerSessionObject();
        }

        protected List <Cart> callGetCartSessionListObject()
        {
            SessionValues sv = new SessionValues();
            return sv.getCartSessionList();
        }


        protected string getTotalAmount()
        {
            SessionValues sv = new SessionValues();
            sv.getCartSessionList();
            int totalAmount = 0;
            for(int i = 0; i < sv.getCartSessionList().Count; i++)
            {
                totalAmount += sv.getCartSessionList()[i].getProductAmount();
                System.Diagnostics.Debug.WriteLine("count total cart amount" + sv.getCartSessionList()[i].getProductAmount());
            }

            return totalAmount.ToString();
        }

        protected Product getRandomProduct(Boolean onSale)
        {
            DatabaseConnector dbc = new DatabaseConnector();
            Product randomProductList = dbc.getRandomProduct(onSale);// get onsale parameter = true; else false will generate random
            
            return randomProductList;
        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            DateStampLabel.Text = DateTime.Now.ToString();
        }

    }

}