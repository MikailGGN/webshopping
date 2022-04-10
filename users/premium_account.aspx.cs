using System;
using System.Collections;
using System.Configuration;
using System.Data;using System.Data.SqlClient ;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using Microsoft.VisualBasic;
using System.Web.Mail;

public partial class createuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
   
     protected void Btnsub_Click1(object sender, EventArgs e)
     {


         int id;
         String strsql = "insert into Tbl_user ( role_id, phone , password, email,question,answer) values ('3','" + Txtphone.Text + "','" + Txtpass.Text + "','" + Txtemail.Text + "','" + Txtsquet.Text + "','" + Txtans.Text + "')";
        
         SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
         SqlCommand iCmd = new SqlCommand(strsql, iConn);
         String lastid = "select MAX(usr_id) as lid from Tbl_user ";
         SqlCommand jCmd = new SqlCommand(lastid, iConn);
         
         iConn.Open();
         iCmd .ExecuteNonQuery ();
      SqlDataReader rd=   jCmd.ExecuteReader();
      while (rd.Read() == true)
      {
        HidField1 .Value  = Convert.ToString (rd["lid"]);
      }
         iConn.Close();

         SqlCommand Cmd = new SqlCommand("insert into Tbl_vendor (usr_id, vendor, vendor_address, vendor_phone, vendor_email) values" +
             "(@usr_id,@vendor, @vendor_address, @vendor_phone, @vendor_email)", iConn);

         Cmd.Parameters.AddWithValue("@usr_id", Convert.ToInt32 (  HidField1.Value));
         Cmd .Parameters .AddWithValue ("@vendor", Txtuser .Text  );
         Cmd.Parameters.AddWithValue("@vendor_address", this.textaddress.Value);
         Cmd.Parameters.AddWithValue("@vendor_phone", Txtphone.Text);
         Cmd.Parameters.AddWithValue("@vendor_email", Txtemail.Text);

         iConn.Open();

        if (Cmd.ExecuteNonQuery() > 0 ){
            MessageBox .Show ("A new user profile has been created");
            Txtuser.Text = "";
            Txtpass.Text = "";
            Txtemail.Text = "";
            Txtsquet.Text = "";
            Txtans.Text = "";
            textaddress.Value = "";
            Txtphone.Text = "";
        }else {
            MessageBox.Show("connection error, please try again");
            textaddress.Value = "";
            Txtuser.Text = "";
            Txtpass.Text = "";
            Txtemail.Text = "";
            Txtsquet.Text = "";
            Txtans.Text = "";
            Txtphone.Text = "";
        }

        iConn.Close();
        

     }
}
