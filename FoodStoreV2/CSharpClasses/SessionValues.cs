﻿using System;
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
            if (HttpContext.Current.Session["cart"] == null)
            {
                HttpContext.Current.Session["cart"] = new List<Cart>();
            }
            return (List<Cart>)HttpContext.Current.Session["cart"];
        }

        public void addToCart(int productID)
        {
            DatabaseConnector dbc = new DatabaseConnector();
            List<Product> productList = dbc.getProductsOnCategory(0);
            Product productObject =  new Product(1,"name","price1123", 1, "amount33", "onsale", "product info", "imgURL");
            foreach ( Product tempProductObject in productList)
            {
                if(tempProductObject.getProductID() == productID)
                {
                    productObject = tempProductObject;
                    break;
                }
            }

            ((List<Cart>)HttpContext.Current.Session["cart"]).Add(new Cart(productObject, 1));
        }

    }
}