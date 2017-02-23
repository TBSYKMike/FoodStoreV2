using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodStoreV2.CSharpClasses

{
    public class DatabaseConnector
    {
        private MySqlConnection conn;
        private MySqlConnectionStringBuilder conn_string;
        private MySqlCommand cmd;
        private List<Product> productList = new List<Product>();

        private void startConnection()
        {
            conn_string = new MySqlConnectionStringBuilder();
            conn_string.Server = "localhost";
            conn_string.UserID = "root";
            conn_string.Password = "root";
            conn_string.Database = "fooddatabase";
        }
        private void createCommand(String sqlCommand)
        {
            using (conn = new MySqlConnection(conn_string.ToString()))
            using (cmd = conn.CreateCommand())
                cmd.CommandText = string.Format(sqlCommand);
            conn.Open();
        }
        public Customer getCustomerObject(String email)
        {
            startConnection();
            createCommand("SELECT * FROM Customers WHERE email=" + "'" + email + "'");

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Customer customer = new Customer(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetInt32(8));
                conn.Close();
                return customer;
            }
            return null;
        }

        public List<Product> getProductsOnCategory(int categoryID)
        {
            List<Product> productList = new List<Product>();
            startConnection();
            if (categoryID == 0)
            {
                createCommand("SELECT * FROM Products");
            }
            else
            {
                createCommand("SELECT * FROM Products WHERE category=" + categoryID);
            }
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7));
                productList.Add(product);
            }
            conn.Close();
            return productList;
        }

        public List<Category> getCategories()
        {
            List<Category> categoryList = new List<Category>();
            startConnection();

            createCommand("SELECT * FROM Categories");

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Category category = new Category(reader.GetInt32(0), reader.GetString(1));
                categoryList.Add(category);
            }
            conn.Close();
            return categoryList;
        }

        public Product getRandomProduct(Boolean onSale)
        {
            startConnection();
            if(onSale)
                createCommand("SELECT * FROM Products WHERE onSale= 'is_onSale' ORDER BY RAND() LIMIT 1");
            else
                createCommand("SELECT * FROM Products ORDER BY RAND() LIMIT 1");

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7));
                conn.Close();
                return product;
            }
            return null;
        }

        public List<Order> getCustomerOrders(int customerID)
        {
            startConnection();
            createCommand("SELECT * FROM Orders WHERE idOrder=" + customerID);
            List <Order> userOrders = new List<Order>();
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Order order = new Order(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2), reader.GetInt32(3));
                userOrders.Add(order);
            }
            conn.Close();
            return userOrders;
        }
        public void insertCustomer(String name, String streetAdress, String city, String postCode, String emailAdress, String userPassword, String userName, int isActivated, String code)
        {
            startConnection();
            createCommand("INSERT INTO Customers (name,street,city,postCode,email,password,userName, isActivated, confirmationCode) VALUES('" + name + "','" + streetAdress + "','" + city + "','" + postCode + "','" + emailAdress + "','" + userPassword + "','" + userName + "','" + isActivated + "','" + code + "')");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void activateCustomer(int isActivated, String code)
        {
            startConnection();
            createCommand("UPDATE Customers SET isActivated = '" + isActivated + "' WHERE confirmationCode = '" + code + "'");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public Boolean checkIfCustomerActive(String code)
        {
            startConnection();
            createCommand("SELECT * FROM customers WHERE confirmationCode " + "= '" + code + "'" + " AND isActivated = " +"'1'" );

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                conn.Close();
                return false;
            }
            conn.Close();
            return true;
        }
        public Boolean checkIfCollumnValueExist(String table, String collumn, String value)
        {
            startConnection();
            createCommand("SELECT " + collumn + " FROM " + table + " WHERE " + collumn + "='" + value + "'");

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                conn.Close();
                return false;
            }
            conn.Close();
            return true;
        }
        public Boolean checkUserCredentials(String emailAdress, String password)
        {
            startConnection();
            createCommand("SELECT email, password FROM Customers");
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.GetString(0).Equals(emailAdress) && reader.GetString(1).Equals(password))
                {
                    conn.Close();
                    return true;
                }
            }

            conn.Close();
            return false;
        }
        public void updateCustomerDetails(Customer customer, String oldEmail)
        {
            startConnection();
            createCommand("UPDATE Customers SET name = '" + customer.getName() + "', street = '" + customer.getStreetAdress() + "', city = '" + customer.getCity() + "', postCode = '" + customer.getPostCode() + "', email = '" + customer.getEmailAdress() + "', password = '" + customer.getUserPassword() + "', userName = '" + customer.getUserName() + "' WHERE email = '" + oldEmail + "'");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void updateCustomerPassword(String email, String newPassword)
        {
            startConnection();
            createCommand("UPDATE Customers SET password = '" + newPassword + "' WHERE email = '" + email + "'");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void updateProductAmount(int productID, int newAmount)
        {
            startConnection();
            createCommand("UPDATE Products SET amount = '" + newAmount + "' WHERE id = '" + productID + "'");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public List<Product> getProductObjectsFromSearchResult(String searchValue)
        {
            string[] searchValueSplittedOnSpace = searchValue.Split(null);
            startConnection();
            for (int i = 0; i < searchValueSplittedOnSpace.Length; i++)
            {
                loopTroughProductQueries("SELECT * FROM Products WHERE name LIKE" + "'%" + searchValueSplittedOnSpace[i] + "%' OR producer LIKE" + "'%" + searchValueSplittedOnSpace[i] + "%'");
              //  loopTroughProductQueries("SELECT * FROM Products WHERE producer LIKE" + "'%" + searchValueSplittedOnSpace[i] + "%'");
            }
            List<Product> SortedList = productList.OrderByDescending(product => product.getSearchHits()).ToList(); //Sorting list on hit counter value
            conn.Close();
            return SortedList;
        }
        private void loopTroughProductQueries(String command)
        {
            Boolean productExist;
            createCommand(command);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                productExist = false;
                for (int h = 0; h < productList.Count; h++)
                {
                    if (productList[h].getProductID().Equals(reader.GetString(0)))
                    {
                        productList[h].setSearchHits(productList[h].getSearchHits() + 1);
                        productExist = true;
                    }
                }
                if (productExist == false)
                {
                    //int productID, String name, String price, int category, String amount, String onSale, String info, String image)
                    Product product = new Product(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7));
                    productList.Add(product);
                }
            }

        }
        public int checkProductAmount(int productID)
        {
            startConnection();
            createCommand("SELECT amount FROM Products WHERE id='" + productID + "'");
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int amount = Int32.Parse(reader.GetString(0));
                conn.Close();
                return amount;
            }
            conn.Close();
            return 0;
        }

        public void insertOrder(int customerID, String date)
        {
            startConnection();
            createCommand("INSERT INTO Orders (customerId,date) VALUES('" + customerID + "','" + date + "')");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public int getOrderID()
        {
            startConnection();
            createCommand("SELECT COUNT(*) FROM Orders");
            Object o = cmd.ExecuteScalar();
            Int32 id = Convert.ToInt32(o);
            conn.Close();
            return id;
        }

        public void insertOrderDetails(Order order, int productAmount)
        {
            startConnection();
            createCommand("INSERT INTO fooddatabase.orderdetails (ordersID,productID,orderAmount) VALUES('" + order.getOrderID() + "','" + order.getProductID() + "','" + productAmount + "')");
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}