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

        private void startConnection()
        {
            conn_string = new MySqlConnectionStringBuilder();
            conn_string.Server = "localhost";
            conn_string.UserID = "root";
            conn_string.Password = "";
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
                Customer customer = new Customer(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7));
                conn.Close();
                return customer;
            }
            return null;
        }
        public List<Product> getProductsOnCategory(int categoryID)
        {
            List<Product> productList = new List<Product>();
            startConnection();
            createCommand("SELECT * FROM Products WHERE category=" + categoryID);

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5));
            }
            conn.Close();
            return productList;
        }
        public Product getRandomProduct()
        {
            startConnection();
            createCommand("SELECT * FROM Products ORDER BY RAND() LIMIT 1");

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5));
                conn.Close();
                return product;
            }
            return null;
        }
        public Order getCustomerOrders(int customerID)
        {
            startConnection();
            createCommand("SELECT * FROM Orders WHERE idOrder=" + customerID);

            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Order order = new Order(reader.GetInt32(0), reader.GetInt32(1), reader.GetInt32(2), reader.GetInt32(3));
                conn.Close();
                return order;
            }
            return null;
        }

    }
}