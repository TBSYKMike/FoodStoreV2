﻿using FoodStoreV2.CSharpClasses;
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
            dataTable.Columns.Add("Name");
            dataTable.Columns.Add("Price");
            dataTable.Columns.Add("Category");
            dataTable.Columns.Add("Amount");
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(searchResultGridView, "Select$" + e.Row.RowIndex);

                string onMouseOverStyle = "this.style.backgroundColor='yellow'";
                string onMouseOutStyle = "this.style.backgroundColor='transparent'";
                e.Row.Attributes.Add("onmouseover", onMouseOverStyle);
                e.Row.Attributes.Add("onmouseout", onMouseOutStyle);
            }
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
            productList = (List<Product>)Session["bookList"];
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

        protected void searchButton_Click(object sender, EventArgs e)
        {
            dataTable.Clear();
            System.Diagnostics.Debug.WriteLine("Searched for products");
            this.Validate();
            if (this.IsValid)//Needs to fulfill all validating
            {
                DatabaseConnector databaseConnector = new DatabaseConnector();
                List<Product> productList = databaseConnector.getProductObjectsFromSearchResult(searchTextBox.Text);

                for (int i = 0; i < productList.Count(); i++)
                {
                    if (category1.Checked.Equals(true) && productList[i].getCategory().Equals(1) || category2.Checked.Equals(true) && productList[i].getCategory().Equals(2)
                    || category3.Checked.Equals(true) && productList[i].getCategory().Equals(3) || category4.Checked.Equals(true) && productList[i].getCategory().Equals(4))
                    {
                        //Boken matchar någon av kategorierna
                        System.Diagnostics.Debug.WriteLine("Sökresultat :     " + productList[i].getName() + "  kategori:   " + productList[i].getCategory());
                    }
                    else if (category1.Checked.Equals(false) && category2.Checked.Equals(false) && category3.Checked.Equals(false) && category4.Checked.Equals(false))
                    {
                        //Om vi inte gjort någon kategorisökning
                    }
                    else
                    {
                        //Om vi gjort kategorisökning och boken inte passade in.
                        productList.Remove(productList[i]);
                    }
                }
                Session.Add("bookList", productList);
                  addProductsDataToGridView();
                gridViewDataBind();
                //    Response.Redirect("SearchPage_WebForm.aspx");
            }
        }
    }

}