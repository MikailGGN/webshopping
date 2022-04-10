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

public partial class _Default : System.Web.UI.Page
{int u_id, r_id;


    
    protected void Page_Load(object sender, EventArgs e)
    {
//        if (Convert .ToInt32 ( Request.QueryString["logout"] )== 1)
//        {

//            Session.Abandon();
//            Response.Redirect("~/Default.aspx");
//        }

        if (!IsPostBack) {
            dcat();
           
        }

//        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));

//        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

//        Response.Cache.SetNoStore();
   }


//    void get_rid()
//    {

//        SqlConnection iconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//        SqlCommand icom = new SqlCommand("sp_userides", iconn);

//        icom.CommandType = CommandType.StoredProcedure;
//        icom.Parameters.AddWithValue("@email", Textuser.Value );
//        icom.Parameters.AddWithValue("@password", Textpass.Value );
//        iconn.Open();

//        SqlDataReader ird = icom.ExecuteReader();
//        while (ird.Read() == true)
//        {
//            u_id = Convert.ToInt32(ird["usr_id"]);
//            r_id = Convert.ToInt32(ird["role_id"]);

//        }
//        ird.Close();
//        iconn.Close();
//    }
//    void sel_vend()
//    {
//        get_rid();
//        string tbl;
//        string tb;
//        int i;
//        switch (r_id)
//        {
//            case 1:
//                tbl = "Tbl_customer";
//                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//                SqlCommand com = new SqlCommand("select email, customer_id from " + tbl + "where usr_id=@usr_id ", conn);

//                com.CommandType = CommandType.StoredProcedure;
//                com.Parameters.AddWithValue("@usr_id", u_id);

//                conn.Open();

//                SqlDataReader rd = com.ExecuteReader();
//                while (rd.Read() == true)
//                {
//                    HidField.Value = Convert.ToString(rd["email"]);
//                    Session["venorcustid"] = Convert.ToInt32(rd[1]);
//                }
//                rd.Close();
//                conn.Close();

//                if (HidField.Value == this.Textuser.Value )
//                {

//                    Session["uid"] = u_id;
//                    Session["loggedin"] = "true";
//                    Response.Redirect("~/users/initial.aspx");

//                }
//                else
//                {
//                }
//                break;
//            case 2:
//                tbl = "Tbl_vendor";
//                SqlConnection vconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//                SqlCommand vcom = new SqlCommand("select vendor_email,vendor_id from " + tbl + " WHERE (usr_id = @usr_id) ", vconn);

//                vcom.Parameters.AddWithValue("@usr_id", u_id);

//                vconn.Open();

//                SqlDataReader vrd = vcom.ExecuteReader();
//                while (vrd.Read() == true)
//                {
//                    HidField.Value = Convert.ToString(vrd["vendor_email"]);
//                    Session["venorcustid"] = Convert.ToInt32(vrd["vendor_id"]);
//                }
//                vrd.Close();
//                vconn.Close();

//                if (HidField.Value == this.Textuser.Value )
//                {

//                    Session["uid"] = u_id;
//                    Session["loggedin"] = "true";
//                    Response.Redirect("~/users/initial.aspx");

//                }
//                else
//                {
//                }
//                // Console.WriteLine("Case 2");
//                break;
//            case 3:
//                Session["roleid"] = r_id;
//                tbl = "Tbl_vendor";
//                SqlConnection vcon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
//                SqlCommand vcmd = new SqlCommand("select vendor_email,vendor_id from " + tbl + " WHERE (usr_id = @usr_id) ", vcon);

//                vcmd.Parameters.AddWithValue("@usr_id", u_id);

//                vcon.Open();

//                SqlDataReader vrdr = vcmd.ExecuteReader();
//                while (vrdr.Read() == true)
//                {
//                    HidField.Value = Convert.ToString(vrdr["vendor_email"]);
//                    Session["venorcustid"] = Convert.ToInt32(vrdr["vendor_id"]);
//                }
//                vrdr.Close();
//                vcon.Close();

//                if (HidField.Value == this.Textuser.Value )
//                {

//                    Session["uid"] = u_id;
//                    Session["loggedin"] = "true";
//                    Response.Redirect("~/users/initial.aspx");

//                }
//                else
//                {
//                }
//                // Console.WriteLine("Case 3");
//                break;
//            default:
//                tbl = " ";
//                //Console.WriteLine("Default case");
//                break;
//        }


//    }
//protected void Button2_Click(object sender, EventArgs e)
//{
    
//    sel_vend();
//}

private void dcat()
{
    SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlDataAdapter objDA = new SqlDataAdapter("Select * from Tbl_catergory", objConn);
    DataSet objDs = new DataSet();
    objDA.Fill(objDs);
    this.Select1.Items .Add(new ListItem("Select...", ""));
    this.Select1 .AppendDataBoundItems = true;
    this.Select1 .DataSource = objDs;
    this.Select1 .DataTextField = "category";
    this.Select1 .DataValueField = "category_id";
    this.Select1 .DataBind();
    objConn.Close();
}
}
