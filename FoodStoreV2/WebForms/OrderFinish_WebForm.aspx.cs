using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FoodStoreV2.CSharpClasses;

namespace FoodStoreV2.WebForms
{
    public partial class OrderFinish_WebForm : System.Web.UI.Page
    {
        private List<Cart> cartlist = new List<Cart>();
        private SessionValues sessionValues = new SessionValues();
        private StringBuilder order = new StringBuilder();
        private SendMail sendMail = new SendMail();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (sessionValues.getCartSessionList() != null)
            {
                cartlist = sessionValues.getCartSessionList();
            }
            else
            {

            }

            sendOrderCompleted();
            insertOrder();

        }
        
        private void insertOrder()
        {
            Customer customer = sessionValues.getCustomerSessionObject();
            DatabaseConnector databaseConnector = new DatabaseConnector();
            DateTime thisDay = DateTime.Now;
            String thisDayAsString = thisDay.ToString();
            databaseConnector.insertOrder(customer.getCustomerID(), thisDayAsString);

            int orderID = databaseConnector.getOrderID();

            // public Order(int orderID, int customerID, int productID, int productAmount)
            
            for(int i=0;i< cartlist.Count; i++)
            {
                Order order = new Order(orderID, customer.getCustomerID(), cartlist[i].getProduct().getProductID(), Int32.Parse(cartlist[i].getProduct().getAmount()));
                databaseConnector.insertOrderDetails(order);
            }
        }

        private void sendOrderCompleted() {
            
            for(int i = 0; i < cartlist.Count; i++) {
                order.Append(cartlist[i].getProduct().getName()).Append(" Quantity:").Append(cartlist[i].getProduct().getAmount()).Append(" Price per item:").Append(cartlist[i].getProduct().getPrice()).Append("SEK\n");
            }

            sendMail.mailer(sessionValues.getCustomerSessionObject().getEmailAdress(), "Your order at Foodstore" , "Here are the details of your order.\n\n" + order + "\nThank you for buying at Foodstore!");
        }
    }
}