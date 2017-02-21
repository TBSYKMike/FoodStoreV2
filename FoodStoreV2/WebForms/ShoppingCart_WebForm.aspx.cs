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
        private List<Cart> cartlist = new List<Cart>();
        private List<Product> productList;
        private DataTable dataTable;
        private SessionValues sessionValues = new SessionValues();
        private DatabaseConnector databaseConnector = new DatabaseConnector();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (sessionValues.getCartSessionList() != null)
            {
                cartlist = sessionValues.getCartSessionList();
            }
            else
            {

            }

            if (!Page.IsPostBack)
            {
                testFillCart();
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
        private void testFillCart()
        {
            productList = databaseConnector.getProductObjectsFromSearchResult("R");
            Cart cart22 = new Cart(productList[0], 1);
            Cart cart23 = new Cart(productList[1], 2);

            cartlist.Add(cart22);
            cartlist.Add(cart23);
            sessionValues.setCartSession(cartlist);

        }
        private void getCartProducts()
        {

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
            System.Diagnostics.Debug.WriteLine("Delete product");

            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            if (row != null)
            {
                int index = row.RowIndex;
                cartlist.Remove(cartlist[index]);
            }
            sessionValues.setCartSession(cartlist);
            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
            addProductsDataToGridView();
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
                cartlist[index].setProductAmount(newProductAmmount);
            }
            sessionValues.setCartSession(cartlist);

            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
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
            LinkButton textBox = (LinkButton)sender;
            GridViewRow row = (GridViewRow)textBox.NamingContainer;

            if (row != null)
            {
                int index = row.RowIndex;
                System.Diagnostics.Debug.WriteLine("clicked on product:   " + cartlist[index].getProduct().getName());
                //Redirect to product page    Response.Redirect(".aspx");
            }
        }

        protected void confirmAndPayButton_Click(object sender, EventArgs e)
        {
            //Sätt carten
            Response.Redirect("OrderFinish_WebForm.aspx");
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
                cartlist[index].setProductAmount(Int32.Parse(textBox.Text));
            }
            sessionValues.setCartSession(cartlist);

            //Gör om hela gridviewen då jag inte hittar hur man uppdaterar en textfield som är i en kollumn
            dataTable.Clear();
            addProductsDataToGridView();
            gridViewDataBind();
        }

    }
}