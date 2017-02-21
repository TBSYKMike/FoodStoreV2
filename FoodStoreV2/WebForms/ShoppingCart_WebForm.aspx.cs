using FoodStoreV2.CSharpClasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FoodStoreV2.WebForms
{
    public partial class ShoppingCart_WebForm : System.Web.UI.Page
    {
        private DataTable dataTable;
        private List<Product> productList;
        private SessionValues sessionValues = new SessionValues();
        private DatabaseConnector databaseConnector = new DatabaseConnector();
        protected void Page_Load(object sender, EventArgs e)
        {
            testFillCart();
            if (!Page.IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Not Post back");
                dataTable = new DataTable();
                createDataTable();
                addProductsDataToGridView();
                gridViewDataBind();
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Postback");
             //   dataTable = (DataTable)ViewState["DataTable"];
            }
          //  ViewState["DataTable"] = dataTable;
           // setCustomerInfoLabel();
        }
        private void testFillCart()
        {
            productList = databaseConnector.getProductObjectsFromSearchResult("R");
                
        }


        private void createDataTable()
        {
          //  dataTable.Columns.Add("Quantity");
            //dataTable.Columns.Add("Name");
           // dataTable.Columns.Add("Price");
           // dataTable.Columns.Add("Category");

            dataTable.Columns.Add("Quantity", typeof(string));
            dataTable.Columns.Add("Name", typeof(string));
            dataTable.Columns.Add("Price", typeof(string));
            dataTable.Columns.Add("Category", typeof(string));
            //   dataTable.Columns.Add("Producer");
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
           /* if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(shoppingCartGridView, "Select$" + e.Row.RowIndex);

                string onMouseOverStyle = "this.style.backgroundColor='yellow'";
                string onMouseOutStyle = "this.style.backgroundColor='transparent'";
                e.Row.Attributes.Add("onmouseover", onMouseOverStyle);
                e.Row.Attributes.Add("onmouseout", onMouseOutStyle);
            }*/
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
          /*  foreach (GridViewRow row in shoppingCartGridView.Rows)
            {
                if (row.RowIndex == shoppingCartGridView.SelectedIndex)
                {
                    // row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    // row.ToolTip = string.Empty;
                    String ISBN = row.Cells[2].Text;
                    System.Diagnostics.Debug.WriteLine("clicked on row:   " + ISBN);

                    List<Book> bookList = (List<Book>)Session["bookList"];

                    for (int i = 0; i < bookList.Count(); i++)
                    {
                        if (bookList[i].getISBN().Equals(ISBN))
                        {
                            Session.Add("SelectedBookObject", bookList[i]);
                            break;
                        }
                    }


                   Response.Redirect("SelectedProductPage.aspx");

                }
                else
                {
                    // row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    //row.ToolTip = "Click to select this row.";
                }

            }*/
        }

        private void gridViewDataBind()
        {
            shoppingCartGridView.DataSource = dataTable;
            shoppingCartGridView.DataBind();
        }
        private void addProductsDataToGridView()
        {
            //productList = sessionValues.getCartSessionList();
            for (int i = 0; i < productList.Count; i++)
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["Name"] = productList[i].getName();
                dataRow["Price"] = productList[i].getPrice();
                dataRow["Category"] = productList[i].getCategory();
                dataRow["Quantity"] = "3";
             //      dataTable.Columns.Add("Quantity", typeof(string));





                // dataRow["Producer"] = productList[i].getProducer();
                dataTable.Rows.Add(dataRow);
            }
          
        }
        protected void lnkView_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("add");
        }
        protected void deleteFromCartButton_Click(object sender, EventArgs e)
        {
            /* booksInCartList = (List<Book>)Session["currentlyCartObjects"];

             for(int i = 0; i < booksInCartList.Count; i++)
             {
                 if (booksInCartList[i].Equals((Book)Session["SelectedBookObject"])){
                     booksInCartList.Remove(booksInCartList[i]);
                     break;
                 }
             }
             Session.Add("currentlyCartObjects", booksInCartList);*/

          //  MasterPage masterPage = (MasterPage)Page.Master;
          //  Book book = (Book)Session["SelectedBookObject"];
          //  masterPage.deleteFromCart(book.getTitle());

         //   Response.Redirect("CheckOutPage.aspx");

        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            /* booksInCartList = (List<Book>)Session["currentlyCartObjects"];

             for(int i = 0; i < booksInCartList.Count; i++)
             {
                 if (booksInCartList[i].Equals((Book)Session["SelectedBookObject"])){
                     booksInCartList.Remove(booksInCartList[i]);
                     break;
                 }
             }
             Session.Add("currentlyCartObjects", booksInCartList);*/

            //  MasterPage masterPage = (MasterPage)Page.Master;
            //  Book book = (Book)Session["SelectedBookObject"];
            //  masterPage.deleteFromCart(book.getTitle());

            //   Response.Redirect("CheckOutPage.aspx");
            System.Diagnostics.Debug.WriteLine("add");
        }
        protected void removeButton_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("remove");
        }

    

        protected void confirmAndPayButton_Click(object sender, EventArgs e)
        {
            /* DatabaseConnector databaseConnector = new DatabaseConnector();
          Customer customer = (Customer)Session["customerObject"];
          Double totalPrice = (Double)Session["totalPrice"];

          // MasterPage masterPage = (MasterPage)Page.Master;
          // masterPage.clearCartAndPrice();

          Response.Redirect("WebForm1.aspx");*/
            System.Diagnostics.Debug.WriteLine("pay");
        }
    }

}