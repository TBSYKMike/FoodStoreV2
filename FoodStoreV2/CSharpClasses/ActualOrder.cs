using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class ActualOrder
    {
        private int idOrder;
        private int customerID;
        private String date;


        public ActualOrder(int idOrder, int customerID, String date)
        {
            this.idOrder = idOrder;
            this.customerID = customerID;
            this.date = date;
        }
        public int getOrderID()
        {
            return idOrder;
        }
        public int getCustomerID()
        {
            return customerID;
        }
        public String getDate()
        {
            return date;
        }

    }
     }