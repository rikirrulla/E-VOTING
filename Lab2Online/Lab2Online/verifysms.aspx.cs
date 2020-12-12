using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2Online
{
    public partial class evotingsms : System.Web.UI.Page
    {
        private Connection conn = new Connection();
        SqlDataReader sqlDataReader;
        SqlCommand sqlCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserModelApply.Numri_Personal != null)
            {

            }
            else
            {
                Response.Redirect("403forbidden.aspx");
            }
        }

        protected void Apliko(object sender, EventArgs e)
        {
            if (true)
            {
                var bytes = new byte[3];
                using (var rng = new RNGCryptoServiceProvider())
                {
                    rng.GetBytes(bytes);
                }

                string hash1 = BitConverter.ToString(bytes);
                string hash2 = BitConverter.ToString(bytes).Replace("-", "").ToLower();
                UserModelApply.hashcode = hash2;



                sqlCommand.Connection = conn.connectionDB();
                sqlCommand.CommandText = "INSERT INTO [Zgjedhjet].[dbo].[VerfikimiVotuesit] VALUES ('"+UserModelApply.Numri_Personal+"','" + hash2 + "','"+ UserModelApply.Emri+ "','" + UserModelApply.Mbiemri+ "','" + UserModelApply.Ditelindja+ "', '" + UserModelApply.Gjinia+ "', '" + UserModelApply.Numri_Leternjoftimit+ "', '" + UserModelApply.Adresa+ "', '" + UserModelApply.Vendi+ "', '" + UserModelApply.Komuna+ "','Jo')";
                sqlCommand.ExecuteNonQuery();
                conn.closeConnection();
                clear();

                Response.Redirect("~/index.aspx");
            }
            else
            {

            }

        }

        private bool existsNumber()
        {
            return true;
        }

        private void clear()
        {
            UserModelApply.Numri_Personal = "";
        }
    }
}