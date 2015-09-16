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
    public partial class Agreements : Page
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
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["CentProSQL"].ConnectionString);
                //cmd.CommandText = "Select * from Agreements";
                cmd.CommandText = "SELECT a.aID AS 'aID', a.aAgreementName AS 'Avtale', u.uName AS 'Avtaleeier'" +
                                    "FROM Users u, Agreements a " +
                                    "JOIN Users us ON a.uID_AgreementOwner = us.uID";
                cmd.Connection = con;

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Open();
                cmd.ExecuteNonQuery();

                agreementsGridView.DataSource = ds;
                agreementsGridView.DataBind();

                con.Close();
            }
            catch (SqlException)
            {
                //TODO: show errors to user on page. -jr
            }
            finally
            {
                con.Close();
            }
        }

        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            // Handle specific exception.
            if (exc is HttpUnhandledException)
            {
                //ErrorMsgTextBox.Text = "An error occurred on this page. Please verify your " +
                //"information to resolve the issue."
            }
            // Clear the error from the server.
            Server.ClearError();
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
            agreementsGridView.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void licenceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            agreementsGridView.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void licenceGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            agreementsGridView.EditIndex = -1;
            BindData();
        }


        protected void licenceGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int licenceID = Convert.ToInt32(agreementsGridView.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)agreementsGridView.Rows[e.RowIndex];

            Label lbllID = (Label)row.FindControl("lbllID");
            //TextBox txtname=(TextBox)gr.cell[].control[];
            TextBox txtOwner = (TextBox)row.Cells[0].Controls[0];
            TextBox txtCount = (TextBox)row.Cells[1].Controls[0];
            //TextBox textc = (TextBox)row.Cells[2].Controls[0]; //JRO removed
            //TextBox textadd = (TextBox)row.FindControl("txtadd");
            //TextBox textc = (TextBox)row.FindControl("txtc");
            agreementsGridView.EditIndex = -1;

            con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", con);
            SqlCommand cmd = new SqlCommand("UPDATE Agreements SET aID=" + Int16.Parse(txtOwner.Text) + ", lCount=" + Int16.Parse(txtCount.Text) + " where lID=" + lbllID, con);
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