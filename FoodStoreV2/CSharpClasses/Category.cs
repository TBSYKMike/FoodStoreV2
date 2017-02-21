using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class Category
    {

        private int categoryID;
        private String categoryName;



        public Category(int categoryID, String categoryName)
        {
            this.categoryID = categoryID;
            this.categoryName = categoryName;
        }

        public int getCategoryID()
        {
            return categoryID;
        }

        public string getCategoryName()
        {
            return categoryName;
        }


    }

    
}