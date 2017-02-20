using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class Cart
    {
        private int productID;
        private int productAmount;

        public Cart(int productID, int productAmount)
        {
            this.productID = productID;
            this.productAmount = productAmount;
        }
        public void setProductAmount(int productAmount)
        {
            this.productAmount = productAmount;
        }
        public int getProductAmount()
        {
            return productAmount;
        }
        public int getProductID()
        {
            return productID;
        }

    }
}