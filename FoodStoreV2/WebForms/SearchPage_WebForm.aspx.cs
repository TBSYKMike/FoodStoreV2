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
    public partial class SearchPage_WebForm : System.Web.UI.Page
    {
        private DataTable dataTable;
        private List<Product> productList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((List<Product>)Session["productList"] != null)
            {
                productList = (List<Product>)Session["productList"];
            }
            if (!Page.IsPostBack)
            {
                dataTable = new DataTable();
                createDataTable();

                //   String categoryFromMenu = Request.QueryString["CategoryView"];
                // if (categoryFromMenu != null)
                //  {
          //      if (Session["bookList"]!=null)
            //    {
              //      DatabaseConnector databaseConnector = new DatabaseConnector();
               //     addProductsDataToGridView();
                 //   gridViewDataBind();
                //}
                 
               // }
              
            }
            else
            {
                dataTable = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dataTable;
        }


        private void createDataTable()
        {
            dataTable.Columns.Add("Name", typeof(string));
            dataTable.Columns.Add("Price", typeof(string));
            dataTable.Columns.Add("Category", typeof(string));
            dataTable.Columns.Add("Amount", typeof(string));
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
        /*    if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(searchResultGridView, "Select$" + e.Row.RowIndex);

                string onMouseOverStyle = "this.style.backgroundColor='yellow'";
                string onMouseOutStyle = "this.style.backgroundColor='transparent'";
                e.Row.Attributes.Add("onmouseover", onMouseOverStyle);
                e.Row.Attributes.Add("onmouseout", onMouseOutStyle);
            }*/
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in searchResultGridView.Rows)
            {
                if (row.RowIndex == searchResultGridView.SelectedIndex)
                {
                    // row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    // row.ToolTip = string.Empty;
                 /*   String ISBN = row.Cells[2].Text;
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


                   Response.Redirect("SelectedProductPage.aspx");*/

                }
                else
                {
                    // row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    //row.ToolTip = "Click to select this row.";
                }

            }
        }

        private void gridViewDataBind()
        {
            searchResultGridView.DataSource = dataTable;
            searchResultGridView.DataBind();
        }
        private void addProductsDataToGridView()
        {
            productList = (List<Product>)Session["productList"];
            for (int i = 0; i < productList.Count; i++)
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["Name"] = productList[i].getName();
                dataRow["Price"] = productList[i].getPrice();
                dataRow["Category"] = productList[i].getCategory();
                dataRow["Amount"] = productList[i].getAmount();
                dataTable.Rows.Add(dataRow);
            }
        }

        protected void product_onClick(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Product on click in search");
            LinkButton linkButton = (LinkButton)sender;
            GridViewRow row = (GridViewRow)linkButton.NamingContainer;

            if (row != null)
            {
                int index = row.RowIndex;
                Response.Redirect("ProductPage_WebForm?param1=" + productList[index].getProductID());
            }
        }


        protected void searchButton_Click(object sender, EventArgs e)
        {
            dataTable.Clear();
            System.Diagnostics.Debug.WriteLine("Searched for products");
            this.Validate();
            if (this.IsValid)//Needs to fulfill all validating
            {
                DatabaseConnector databaseConnector = new DatabaseConnector();
                List<Product> productList = databaseConnector.getProductObjectsFromSearchResult(searchTextBox.Text);     

                for(int i = 0; i < productList.Count; i++)
                {
                    System.Diagnostics.Debug.WriteLine("Search result before filter:    " + (productList[i].getName() + "    category:   ") + productList[i].getCategory());
                }
                List<Product> matchedProductList = new List<Product>();

                for (int i = 0; i < productList.Count; i++)
                {
                    if (((otherTextBox.Checked.Equals(true) && productList[i].getCategory().Equals(1)) || (ppapCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(2)) || (fruitCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(3))
                    || (fishCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(4)) || (japaneseFoodCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(5))
                    || (pancakeCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(6)) || (vegetableCheckBox.Checked.Equals(true) && productList[i].getCategory().Equals(7))))
                    {
                        //Produkten matchar
                        System.Diagnostics.Debug.WriteLine("Sökresultat :     " + productList[i].getName() + "  kategori:   " + productList[i].getCategory());
                        matchedProductList.Add(productList[i]);
                    }
                    else if (otherTextBox.Checked.Equals(false) && ppapCheckBox.Checked.Equals(false) && fruitCheckBox.Checked.Equals(false) && fishCheckBox.Checked.Equals(false) && japaneseFoodCheckBox.Checked.Equals(false)
                        && pancakeCheckBox.Checked.Equals(false) && vegetableCheckBox.Checked.Equals(false))
                    {
                        //Om vi inte gjort någon kategorisökning
                        matchedProductList.Add(productList[i]);                
                    }
                    else
                    {
            
                    }
                }
                Session.Add("productList", matchedProductList);
                addProductsDataToGridView();
                gridViewDataBind();
                //    Response.Redirect("SearchPage_WebForm.aspx");
            }
        }
    }

}