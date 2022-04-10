using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;

public partial class customerinfo : System.Web.UI.Page
{
    DataTable dt;
    int cust_id, trans_id;
    String getconnect() {
        return (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        insession();

    }
    void insession() {
        dt = (DataTable)(Session["Cart"]);
        int totalqty=0;
        foreach (DataRow rw in dt.Rows)
        {
            //totalqty values
            totalqty += Convert.ToInt32(rw[2]);
        }
        Hiddenqty .Value   = Convert.ToString(totalqty);
    }
    protected void btnadv_Click(object sender, EventArgs e)
    {

        if (Page.IsValid && (txtCaptcha.Text.ToString() == Session["RandomStr"].ToString()))
        {
cust();

          //  Response.Write("Code verification Successful");
            trans_log(); trans();
        }
else
        {
  //Response.Write("Please enter info correctly");
}
        

    }
    void cust() {

        string iconn = getconnect();

        SqlConnection conn = new SqlConnection(iconn);



        SqlCommand acmd = new SqlCommand("Sp_insertcustomer", conn);
        SqlCommand xi = new SqlCommand("SELECT IDENT_CURRENT('Tbl_customer') AS Expr1",conn);

        acmd.CommandType = CommandType.StoredProcedure;
        acmd.Parameters.AddWithValue("@customer_name", this.Txtname.Text);
        acmd.Parameters.AddWithValue("@customer_address", this.Txtaddress.Text);
        acmd.Parameters.AddWithValue("@customer_email", this.Txtemail.Text);
        acmd.Parameters.AddWithValue("@customer_hphone", this.Txthphone.Text);
        acmd.Parameters.AddWithValue("@customer_mphone", this.Txtmphone.Text);

        
        
        conn.Open();
        acmd.ExecuteNonQuery();
        SqlDataReader rd=xi.ExecuteReader ();
        rd.Read();
        cust_id =Convert .ToInt32 ( rd["Expr1"]);
        
        conn.Close();


    }
    void trans_log() {
        string iconn = getconnect();

        SqlConnection conn = new SqlConnection(iconn);

        Double a=(Double ) (Session ["transhipping"]);
        Double b = (Double)(Session["trantotal"]);

        SqlCommand bcmd = new SqlCommand("sp_transactionlog", conn);
        bcmd.CommandType = CommandType.StoredProcedure;
        SqlCommand xj = new SqlCommand("SELECT IDENT_CURRENT('Tbl_transaction_log') AS Expr1", conn);

        bcmd.Parameters.AddWithValue("@transaction_date", DateTime .Now );
        bcmd.Parameters.AddWithValue("@qty_total", Convert.ToInt32 (Hiddenqty .Value ));
        bcmd.Parameters.AddWithValue("@transaction_total",b);
        bcmd.Parameters.AddWithValue("@shipping_cost", a);
     
        conn.Open();
        bcmd.ExecuteNonQuery();
        SqlDataReader rd = xj.ExecuteReader();

        trans_id = Convert.ToInt32(rd["Expr1"]);
        
        conn.Close();

    }

    void trans() {
        string iconn = getconnect();

        SqlConnection conn = new SqlConnection(iconn);



        SqlCommand tcmd = new SqlCommand("sp_transaction", conn);

        foreach (DataRow r in dt.Rows)
        {

            tcmd.Parameters.AddWithValue("@transaction_id", Convert.ToInt32(trans_id));
            tcmd.Parameters.AddWithValue("@customer_id", Convert.ToInt32(cust_id));
            tcmd.Parameters.AddWithValue("@item_id", Convert.ToInt32 (r[4]));
            tcmd.Parameters.AddWithValue("@transaction_date", DateTime.Now);

            conn.Open();
            tcmd.ExecuteNonQuery();

            conn.Close();
        }
    
    }
}
