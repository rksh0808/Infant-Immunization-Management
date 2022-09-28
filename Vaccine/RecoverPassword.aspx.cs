using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class RecoverPassword : System.Web.UI.Page
{
    String GUIDvalue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=IIM;Integrated Security=True"))
        {
            GUIDvalue = Request.QueryString["id"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select * from ForgotPass where Id=@Id", conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@Id", GUIDvalue);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblmsg.Text = "Your Password Reset Link is expired or invalid ... try again";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        if (!IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                txtConfirmPass.Visible = true;
                txtNewPass.Visible = true;
                lblNewPassword.Visible = true;
                lblConfirmPass.Visible = true;
                btnResetPass.Visible = true;
            }
            else
            {
                lblmsg.Text = "Your Password Reset Link is expired or invalid ... try again";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=IIM;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update tblUsers set Password=@p where Uid=@Uid", conn);
                cmd.Parameters.AddWithValue("@p", txtNewPass.Text);
                cmd.Parameters.AddWithValue("@Uid", Uid);
                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("Delete from ForgotPass where Uid='" + Uid + "'", conn);
                cmd2.ExecuteNonQuery();
                Response.Write("<script>alert('Password Reset Successfully Done'); </script>");
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}