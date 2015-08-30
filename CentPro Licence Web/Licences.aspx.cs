using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace CentPro_Licence_Web
{
    public partial class Licences : Page
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["CentProSQL"].ConnectionString);
            //cmd.CommandText = "Select * from Licences";
            cmd.CommandText = "SELECT l.lID AS 'lID', u.uName AS 'Eier', a.aAgreementName AS 'Avtale', l.lDateFrom AS 'Gyldig fra', " +
                                "l.lDateTo AS 'Gyldig til', l.lCount AS 'Antall lisenser', n.nDescription AS 'Varsel', p.pName as 'Produsent', " +
                                "c.cName AS 'Kontaktperson' " +

                                "FROM Licences l, Users u, Agreements a " +

                                "LEFT JOIN Licences lic ON lic.aID = a.aID " +
                                "LEFT JOIN Notifications n ON lic.nID = n.nID " +
                                "LEFT JOIN Producer p ON lic.pID = p.pID " +
                                "LEFT JOIN Contacts c ON lic.cID = c.cID";
            cmd.Connection = con;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Open();
            cmd.ExecuteNonQuery();

            licenceGridView.DataSource = ds;
            licenceGridView.DataBind();

            con.Close();
        }

        protected void licenceGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            /*
            GridViewRow row = (GridViewRow)licenceGridView.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Licences where lID='" + Convert.ToInt32(licenceGridView.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindData();
            */
        }

        protected void licenceGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            licenceGridView.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void licenceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            licenceGridView.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void licenceGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            licenceGridView.EditIndex = -1;
            BindData();
        }


        protected void licenceGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int licenceID = Convert.ToInt32(licenceGridView.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)licenceGridView.Rows[e.RowIndex];

            Label lbllID = (Label)row.FindControl("lbllID");
            //TextBox txtname=(TextBox)gr.cell[].control[];
            TextBox txtOwner = (TextBox)row.Cells[0].Controls[0];
            TextBox txtCount = (TextBox)row.Cells[1].Controls[0];
            //TextBox textc = (TextBox)row.Cells[2].Controls[0]; //JRO removed
            //TextBox textadd = (TextBox)row.FindControl("txtadd");
            //TextBox textc = (TextBox)row.FindControl("txtc");
            licenceGridView.EditIndex = -1;

            con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", con);
            SqlCommand cmd = new SqlCommand("UPDATE Licences SET owner_uID=" + Int16.Parse(txtOwner.Text) + ", lCount=" + Int16.Parse(txtCount.Text) + " where lID=" + lbllID, con);
            cmd.ExecuteNonQuery();

            con.Close();
            BindData();
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