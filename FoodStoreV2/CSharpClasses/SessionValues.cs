using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class SessionValues
    {
        public SessionValues()
        {

        }
        public void setLoginSession(Customer customer)
        {
            HttpContext.Current.Session["currentLogedInUserObject"] = customer;
        }
        public Customer getCustomerSessionObject()
        {
            return (Customer)HttpContext.Current.Session["currentLogedInUserObject"];
        }
        public void setCartSession(List<Product> cartList)
        {
            HttpContext.Current.Session["cartList"] = cartList;
        }
        public List<Product> getCartSessionList()
        {
            return (List<Product>)HttpContext.Current.Session["cartList"];
        }

    }
}