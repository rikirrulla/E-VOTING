using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2Online
{
    public partial class apply : System.Web.UI.Page
    {
        private Connection conn = new Connection();

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Apliko(object sender, EventArgs e)
        {
            string txtBoxNrPersonal = snrPersonal.Text;
            string txtBoxNrLeternjoftimit = snrLeternjoftimit.Text;

            if (txtBoxNrPersonal == "" || txtBoxNrLeternjoftimit.Length == 0)
            {
                Response.Write("<script>alert('Ju lutem shtypni numrin personal.');</script>");
            }

            if (txtBoxNrLeternjoftimit == "" || txtBoxNrLeternjoftimit.Length == 0)
            {
                Response.Write("<script>alert('Ju lutem shtypni numrin e leternjoftimit.');</script>");
            }
            else
            {
                SqlDataReader sqlDataReader;
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = conn.connectionDB();
                sqlCommand.CommandText = "select * from [Zgjedhjet].[dbo].[Personi] where numri_personal = '" + txtBoxNrPersonal + "' and numri_leternjoftimit = '" + txtBoxNrLeternjoftimit + "'";
                sqlCommand.ExecuteNonQuery();

                SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        UserModelApply.Numri_Personal = dt.Rows[i]["numri_personal"].ToString();
                        UserModelApply.Emri = dt.Rows[i]["emri"].ToString();
                        UserModelApply.Mbiemri = dt.Rows[i]["mbiemri"].ToString();
                        UserModelApply.Ditelindja= dt.Rows[i]["ditelindja"].ToString();
                        UserModelApply.Gjinia = dt.Rows[i]["gjinia"].ToString();
                        UserModelApply.Numri_Leternjoftimit = dt.Rows[i]["numri_leternjoftimit"].ToString();
                        UserModelApply.Adresa = dt.Rows[i]["adresa"].ToString();
                        UserModelApply.Vendi = dt.Rows[i]["vendi"].ToString();
                        UserModelApply.Komuna = dt.Rows[i]["komuna"].ToString();


                        if (KontrolloNeseKaAplikuar())
                        {
                            Response.Redirect("~/verifysms.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Ju keni aplikuar nje here!')</script>");

                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Numri i leternjtimit ose numri personal nuk pershtatet')</script>");
                }
                conn.closeConnection();
                clearFildes();

            }
        }

        private Boolean KontrolloNeseKaAplikuar()
        {
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = conn.connectionDB();
            sqlCommand1.CommandText = "select * from [Zgjedhjet].[dbo].[VerfikimiVotuesit] where numri_personal = '"+UserModelApply.Numri_Personal+"'";
            sqlCommand1.ExecuteNonQuery();

            SqlDataAdapter sda1 = new SqlDataAdapter(sqlCommand1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);


            if (dt1.Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private void clearFildes()
        {
            snrPersonal.Text = "";
            snrLeternjoftimit.Text = "";
        }
    }
}