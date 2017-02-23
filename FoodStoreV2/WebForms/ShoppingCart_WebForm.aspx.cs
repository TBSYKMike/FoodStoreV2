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
    public partial class ShoppingCart_WebForm : System.Web.UI.Page
    {
        private List<Cart> cartlist = new List<Cart>();
        private DataTable dataTable;
        private SessionValues sessionValues = new SessionValues();
        private DatabaseConnector databaseConnector = new DatabaseConnector();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (sessionValues.getCartSessionList() != null)
            {
 
                cartlist = sessionValues.getCartSessionList();
                limitProductAmountOnStock();
                updatePriceLabel();
            }
            else
            {
               // confirmAndPayButton.Enabled = false;
            }

  

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
                dataTable = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dataTable;
            // setCustomerInfoLabel();
        }

        private void createDataTable()
        {
            dataTable.Columns.Add("Quantity", typeof(string));
            dataTable.Columns.Add("Name", typeof(string));
            dataTable.Columns.Add("Price", typeof(string));
            dataTable.Columns.Add("Category", typeof(string));
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            //Kraschar allt 
            /*    if (e.Row.RowType == DataControlRowType.DataRow)
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
            //Redirect to product page to see the product?
        }
        private void gridViewDataBind()
        {
            shoppingCartGridView.DataSource = dataTable;
            shoppingCartGridView.DataBind();
        }
        private void addProductsDataToGridView()
        {
            for (int i = 0; i < cartlist.Count; i++)
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["Name"] = cartlist[i].getProduct().getName();
                dataRow["Price"] = cartlist[i].getProduct().getPrice();
                dataRow["Category"] = cartlist[i].getProduct().getCategory();
                dataRow["Quantity"] = cartlist[i].getProductAmount();
                dataTable.Rows.Add(dataRow);
            }

        }
        protected void deleteFromCartButton_Click(object sender, EventArgs e)
        {
            deleteFromCart(sender, "button");
        }
        private void deleteFromCart(object sender, String buttonType)
        {
            System.Diagnostics.Debug.WriteLine("Delete product");
            GridViewRow row = null;
            if (buttonType == "button")
            {
                Button button = (Button)sender;
                row = (GridViewRow)button.NamingContainer;
            }
            else if (buttonType == "linkButton")
            {
                LinkButton button = (LinkButton)sender;
                 row = (GridViewRow)button.NamingContainer;
            }
            else if (buttonType == "textBox")
            {
                TextBox button = (TextBox)sender;
                row = (GridViewRow)button.NamingContainer;
            }

            if (row != null)
            {
                int index = row.RowIndex;
                cartlist.Remove(cartlist[index]);
            }
            sessionValues.setCartSession(cartlist);
            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
            addProductsDataToGridView();
            updatePriceLabel();
            gridViewDataBind();

        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("add");
            updateProductAmount(sender, 1);

        }
        private void updateProductAmount(object sender, int addValue)
        {
            LinkButton linkButton = (LinkButton)sender;
            GridViewRow row = (GridViewRow)linkButton.NamingContainer;
            if (row != null)
            {
                int index = row.RowIndex;
                System.Diagnostics.Debug.WriteLine("clicked on index:     " + index);
                int newProductAmmount = cartlist[index].getProductAmount() + addValue;
                if (newProductAmmount > 0)
                {
                    cartlist[index].setProductAmount(newProductAmmount);
                }
                else
                {
                    //Delete
                    deleteFromCart(sender, "linkButton");
                }
              
            }
            sessionValues.setCartSession(cartlist);

            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
            limitProductAmountOnStock();
            updatePriceLabel();
            addProductsDataToGridView();
            gridViewDataBind();
        }

        protected void removeButton_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("remove");
            updateProductAmount(sender, -1);
        }

        protected void product_onClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            GridViewRow row = (GridViewRow)linkButton.NamingContainer;

            if (row != null)
            {
                int index = row.RowIndex;
                System.Diagnostics.Debug.WriteLine("clicked on product:   " + cartlist[index].getProduct().getName());
                Response.Redirect("ProductPage_WebForm?param1=" + cartlist[index].getProduct().getProductID());
            }
        }

        protected void confirmAndPayButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment_WebForm?param1=" + totalPriceLabel.Text);
            System.Diagnostics.Debug.WriteLine("pay");
        }


        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Textboxx changed");

            TextBox textBox = (TextBox)sender;
            GridViewRow row = (GridViewRow)textBox.NamingContainer;
            if (row != null)
            {
                int index = row.RowIndex;
                System.Diagnostics.Debug.WriteLine("clicked on index:     " + index);
                int value;
                bool isNumeric = int.TryParse(textBox.Text, out value);
                
                if (isNumeric == false)
                {
                    textBox.Text = "1";
                }
                else if(value < 1)
                {
                    deleteFromCart(sender, "textBox");
                }
                else
                {
                    cartlist[index].setProductAmount(Int32.Parse(textBox.Text));
                }
              
            }
            sessionValues.setCartSession(cartlist);

            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
            limitProductAmountOnStock();
            updatePriceLabel();
            addProductsDataToGridView();
            gridViewDataBind();
        }

        protected void clearCartButton_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Cleared cart");
            cartlist = new List<Cart>();
            sessionValues.setCartSession(cartlist);
            dataTable.Clear();
            addProductsDataToGridView();
            updatePriceLabel();
            gridViewDataBind();
        }

        private void limitProductAmountOnStock()
        {
            for (int i = 0; i < cartlist.Count; i++)
            {
                int amountInStock = databaseConnector.checkProductAmount(cartlist[i].getProduct().getProductID());
                if (cartlist[i].getProductAmount() > amountInStock)
                {
                    cartlist[i].setProductAmount(amountInStock);
                    CustomerInfoLabel.Text = cartlist[i].getProduct().getName() + " have " + amountInStock + " in stock ";
                }
                else
                {
                    CustomerInfoLabel.Text = "";
                }
            }
                
        }
        private void updatePriceLabel()
        {
        //    MasterPage masterPage = (MasterPage)Page.Master;
        //  masterPage.
            int totalPrice = 0;
            for (int i = 0; i <cartlist.Count; i++)
            {
                totalPrice += Int32.Parse(cartlist[i].getProduct().getPrice()) * cartlist[i].getProductAmount();
            }
            totalPriceLabel.Text = "The total price is " + totalPrice.ToString();
        
    }



    }
}