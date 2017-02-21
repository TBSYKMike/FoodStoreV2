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
        public void setCartSession(List<Cart> cart)
        {
            HttpContext.Current.Session["cart"] = cart;
        }
        public List<Cart> getCartSessionList()
        {
            return (List<Cart>)HttpContext.Current.Session["cart"];
        }

    }
}