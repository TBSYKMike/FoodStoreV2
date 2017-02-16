using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses

{
    public class Product
    {
        private int productID;
        private String name;
        private String price;
        private int category;
        private String amount;
        private String onSale;


        public Product(int productID, String name, String price, int category, String amount, String onSale)
        {
            this.productID = productID;
            this.name = name;
            this.price = price;
            this.category = category;
            this.amount = amount;
            this.onSale = onSale;
        }
    }
}
