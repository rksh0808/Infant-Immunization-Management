using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=IIM;Integrated Security=True"))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblUsers where Email=@Email", conn);
            cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", conn);
                cmd1.ExecuteNonQuery();

                // Send Reset link via Email
                String ToEmailAddress = dt.Rows[0][3].ToString();
                String Username = dt.Rows[0][1].ToString();
                String EmailBody = "Hi , " + Username + ",<br/><br/>Click the link below to reset your password <br/><br/> http://localhost:60655/RecoverPassword.aspx?id=" + myGUID;

                MailMessage PassRecMail = new MailMessage("rksquare91@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = true;
                    client.Credentials = new NetworkCredential("rksquare91@gmail.com", "fekqfucubytnotnd");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(PassRecMail);
                }
                //SmtpClient SMTP = new SmtpClient("SMTP.gmail.com",587);
                //SMTP.Credentials = new NetworkCredential()
                //{
                //    UserName = "Your Email@gmail.com" ,
                //    Password = "Your Password"
                //};
                //SMTP.EnableSsl = true;
                //SMTP.Send(PassRecMail);

                // -------------------------
                lblResetPassMsg.Text = "Reset Link Sent.Please Check your Email to Reset the Password !!!";
                lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                txtEmailID.Text = String.Empty;
            }
            else
            {
                lblResetPassMsg.Text = "Oops ! Entered Email doesn't Exist .... Try Again";
                lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                txtEmailID.Text = String.Empty;
                txtEmailID.Focus();
            }
        }
    }
}