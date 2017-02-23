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
        private DataTable dataTable;
        private SessionValues sessionValues;
        private List<Order> userOrders = new List<Order>();
        protected void Page_Load(object sender, EventArgs e)
        {
            sessionValues = new SessionValues();
            if (!Page.IsPostBack)
            {
                dataTable = new DataTable();
                createDataTable();
                addOrdersToGridView();
                gridViewDataBind();
            }
            else
            {
                dataTable = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dataTable;
        }
        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            /*    if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(cartGridView, "Select$" + e.Row.RowIndex);

                    string onMouseOverStyle = "this.style.backgroundColor='yellow'";
                    string onMouseOutStyle = "this.style.backgroundColor='transparent'";
                    e.Row.Attributes.Add("onmouseover", onMouseOverStyle);
                    e.Row.Attributes.Add("onmouseout", onMouseOutStyle);
                }*/
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            /* {
                 foreach (GridViewRow row in orderHistoryGridView.Rows)
                 {
                     if (row.RowIndex == orderHistoryGridView.SelectedIndex)
                     {
                         row.BackColor = ColorTranslator.FromHtml("#2f7ab7");
                         // row.ToolTip = string.Empty;
                         String ISBN = row.Cells[2].Text;
                         System.Diagnostics.Debug.WriteLine("clicked on row:   " + ISBN);

                         booksInCartList = (List<Book>)Session["currentlyCartObjects"];
                         System.Diagnostics.Debug.WriteLine("felsökning");

                         for (int i = 0; i < booksInCartList.Count(); i++)
                         {
                             if (booksInCartList[i].getISBN().Equals(ISBN))
                             {
                                 Session.Add("SelectedBookObject", booksInCartList[i]);
                                 break;
                             }
                         }

                     }
                     else
                     {

                     }

                 }*/
        }

        private void gridViewDataBind()
        {
            orderHistoryGridView.DataSource = dataTable;
            orderHistoryGridView.DataBind();
        }

        private void addOrdersToGridView()
        {
    /*        DatabaseConnector databaseConnector = new DatabaseConnector();

            Customer customer = sessionValues.getCustomerSessionObject();
            userOrders = databaseConnector.getCustomerOrders(customer.getCustomerID());

             for (int i = 0; i < userOrders.Count; i++)
             {
                 DataRow dataRow = dataTable.NewRow();
                 dataRow["Order number"] = userOrders[i].getOrderNumber();
                 dataRow["Date"] = userOrders[i].
                 dataTable.Rows.Add(dataRow);
             }*/
        }

        private void createDataTable()
        {
            dataTable.Columns.Add("Order number");
            dataTable.Columns.Add("Total price");
            dataTable.Columns.Add("Order Date");
        }
    }
}