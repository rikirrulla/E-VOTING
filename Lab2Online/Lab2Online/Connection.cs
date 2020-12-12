using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Lab2Online
{
    public class Connection
    {
        private SqlConnection conn = new SqlConnection("Data Source=DESKTOP-EPPCL1H;Initial Catalog=Zgjedhjet;Integrated Security=True");

        public SqlConnection connectionDB()
        {
            if (conn.State == System.Data.ConnectionState.Closed)
                conn.Open();
            return conn;
        }

        public SqlConnection closeConnection()
        {
             conn.Close();  
            conn.Dispose();  
            return conn;
        }
    }
}