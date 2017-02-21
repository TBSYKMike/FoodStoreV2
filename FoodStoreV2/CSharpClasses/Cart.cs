using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class Cart
    {
        private Product product;
        private int productAmount;


        public Cart(Product product, int productAmount)
        {
            this.product = product;
            this.productAmount = productAmount;
        }
        public Cart()
        {
     
        }
        public void setProductAmount(int productAmount)
        {
            this.productAmount = productAmount;
        }
        public int getProductAmount()
        {
            return productAmount;
        }
        public Product getProduct()
        {
            return product;
        }
    }
}