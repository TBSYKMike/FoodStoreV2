using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStoreV2.WebForms
{
    public partial class OrderHistory_WebForm : System.Web.UI.Page
    {
        private Customer customer;
        private DataTable orderTable;
        private DataTable orderDetailTabel;
        private SessionValues sessionValues;
        private DatabaseConnector databaseConnector = new DatabaseConnector();

        protected void Page_Load(object sender, EventArgs e)
        {
            sessionValues = new SessionValues();
            if (!Page.IsPostBack)
            {
                orderTable = new DataTable();
                orderDetailTabel = new DataTable();
                createDataTables();
                addOrdersToGridView();
                gridViewDataBind();
            }
            else
            {
                orderTable = (DataTable)ViewState["orderTable"];
                orderDetailTabel = (DataTable)ViewState["orderDetailTabel"];
            }
            ViewState["orderTable"] = orderTable;
            ViewState["orderDetailTabel"] = orderDetailTabel;
        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
        
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
         
        }

        private void gridViewDataBind()
        {
            orderHistoryGridView.DataSource = orderTable;
            orderHistoryGridView.DataBind();
        }


        protected void order_onClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            createDetailOrderGridView(Int32.Parse(linkButton.Text));
        }

        private void addOrdersToGridView()
        {
            customer = sessionValues.getCustomerSessionObject();
            List<ActualOrder> userOrders = databaseConnector.getCustomerOrders(customer.getCustomerID());

            for (int i = 0; i < userOrders.Count; i++)
             {
                 DataRow dataRow = orderTable.NewRow();
                System.Diagnostics.Debug.WriteLine("seeee!!!!!   " + userOrders[i].getOrderID());
                dataRow["OrderID"] = userOrders[i].getOrderID();
                 dataRow["Date"] = userOrders[i].getDate();
                orderTable.Rows.Add(dataRow);
            }
    

        }

        private void createDataTables()
        {
            orderTable.Columns.Add("OrderID", typeof(string));
            orderTable.Columns.Add("Date", typeof(string));
            orderDetailTabel.Columns.Add("Amount", typeof(string));
            orderDetailTabel.Columns.Add("ProductName", typeof(string));
            orderDetailTabel.Columns.Add("productPrice", typeof(string));
        }




        private void createDetailOrderGridView(int orderID)
        {
            orderDetailLabel.Visible = true;
            orderDetailTabel.Clear();
            List<Order> orderDetails = databaseConnector.getCustomerOrderDetails(orderID);
            for (int i = 0; i < orderDetails.Count; i++)
            {
                DataRow dataRow = orderDetailTabel.NewRow();
                Product product = databaseConnector.getProductObject(orderDetails[i].getProductID());
                dataRow["Amount"] = orderDetails[i].getProductAmount();
                dataRow["ProductName"] = product.getName();
                dataRow["productPrice"] = product.getPrice();
                orderDetailTabel.Rows.Add(dataRow);
            }
            orderDetailsGridView.DataSource = orderDetailTabel;
            orderDetailsGridView.DataBind();
        }
    }
}