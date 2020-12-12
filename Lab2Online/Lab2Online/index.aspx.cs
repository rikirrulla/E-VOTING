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
    public partial class index : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Apliko_Per_Vote(object sender, EventArgs e)
        {
            Response.Redirect("~/applyforvote.aspx");

        }

        protected void Vote(object sender, EventArgs e)
        {
            Response.Redirect("~/votenow.aspx");

        }
    }
}