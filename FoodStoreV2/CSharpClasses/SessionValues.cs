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

    }
}