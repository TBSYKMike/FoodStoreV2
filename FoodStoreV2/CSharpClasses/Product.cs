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
        private String info;
        private String image;
        private int searchHits;

        public Product(int productID, String name, String price, int category, String amount, String onSale, String info, String image)
        {
            this.productID = productID;
            this.name = name;
            this.price = price;
            this.category = category;
            this.amount = amount;
            this.onSale = onSale;
            this.info = info;
            this.image = image;
        }

        public int getSearchHits()
        {
            return searchHits;
        }
        public void setSearchHits(int searchHits)
        {
            this.searchHits = searchHits;
        }
        public int getProductID()
        {
            return productID;
        }
        public int getCategory()
        {
            return category;
        }
        public String getName()
        {
            return name;
        }
        public String getPrice()
        {
            return price;
        }
        public String getAmount()
        {
            return amount;
        }

        public string getOnSale()
        {
            return onSale;
        }

        public string getInfo()
        {
            return info;
        }

        public string getImageURL()
        {
            return image;
        }


    }
}
