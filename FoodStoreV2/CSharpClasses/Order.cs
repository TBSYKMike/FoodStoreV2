using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses

{
    public class Order
    {
        private int orderID;
        private int customerID;
        private int productID;
        private int productAmount;

        public Order(int orderID, int customerID, int productID, int productAmount)
        {
            this.orderID = orderID;
            this.customerID = customerID;
            this.productID = productID;
            this.productAmount = productAmount;
        }
        public int getOrderID()
        {
            return orderID;
        }
        public int getCustomerID()
        {
            return customerID;
        }
        public int getProductID()
        {
            return productID;
        }
        public int getProductAmount()
        {
            return productAmount;
        }
    }
}
