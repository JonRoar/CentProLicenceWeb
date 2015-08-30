using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CentPro_Licence_Web
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sqltestbtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["CentProSQL"].ConnectionString);
                connection.Open();

                if (connection.State == System.Data.ConnectionState.Open)
                {
                    Response.Write("Connection successful!");
                    connection.Close();
                } else
                {
                    Response.Write("No connection...");
                }
            }
            catch
            {
                Response.Write("Connection string: " + ConfigurationManager.ConnectionStrings["CentProSQL"].ToString() + "\r\nCatched a try: No connection. Timed out without response...");
            }
        }
    }
}