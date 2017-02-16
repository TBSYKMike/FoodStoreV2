﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses
{
    public class Customer
    {
        private int customerID;
        private String name;
        private String streetAdress;
        private String city;
        private String postCode;
        private String emailAdress;
        private String userPassword;
        private String userName;

        public Customer(int customerID, String name, String streetAdress, String city, String postCode, String emailAdress, String userPassword, String userName)
        {
            this.customerID = customerID;
            this.name = name;
            this.streetAdress = streetAdress;
            this.city = city;
            this.postCode = postCode;
            this.emailAdress = emailAdress;
            this.userPassword = userPassword;
            this.userName = userName;
        }
        public String getName()
        {
            return name;
        }
        public String getEmailAdress()
        {
            return emailAdress;
        }
        public String getStreetAdress()
        {
            return streetAdress;
        }
        public String getUserPassword()
        {
            return userPassword;
        }
        public String getCity()
        {
            return city;
        }
        public String getPostCode()
        {
            return postCode;
        }
        public String getUserName()
        {
            return userName;
        }
        public int getCustomerID()
        {
            return customerID;
        }
    }
}
