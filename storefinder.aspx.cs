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
using System.Text.RegularExpressions;
public partial class storefinder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { if (!IsPostBack)
            {
                dstore();
            }

        if (Hidd1.Value != "")
        {
            dabind();
        }
        else
        {
           
        }

        
    }

   
    protected void DDLstore_SelectedIndexChanged(object sender, EventArgs e) {

        if (DDLstore.SelectedIndex > 0)
        {
            Hidd1.Value = DDLstore.SelectedItem.Value;
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlDataAdapter objDA = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("sp_storefinder", objConn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vendor_id", DDLstore.SelectedItem.Value);

            objDA.SelectCommand = cmd;

            DataSet objDS = new DataSet();

            objDA.Fill(objDS);
            tdealers.DataSource = objDS;
            tdealers.DataBind();
        }
    }

    private void dabind() {

        tdealers.Dispose();
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter objDA = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("sp_storefinder", objConn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@vendor_id", Hidd1 .Value);

        objDA.SelectCommand = cmd;

        DataSet objDS = new DataSet();

        objDA.Fill(objDS);
        tdealers.DataSource = objDS;
        tdealers.DataBind();  
    }


    private void dstore()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter objDA = new SqlDataAdapter("select vendor,vendor_id from Tbl_vendor", objConn);
        DataSet objDs = new DataSet();
        objDA.Fill(objDs);
        this.DDLstore.Items.Add(new ListItem("Select...", ""));
        this.DDLstore.AppendDataBoundItems = true;
        this.DDLstore.DataSource = objDs;
        this.DDLstore.DataTextField = "vendor";
        this.DDLstore.DataValueField = "vendor_id";
        this.DDLstore.DataBind();
        objConn.Close();
    }

  
protected  void Item_Command(Object sender, ListViewCommandEventArgs e)
    {
             if (String.Equals(e.CommandName, "AddToList")) {
            // Verify that the employee ID is not already in the list. If not, add the
            // employee to the list.
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            int itemID = Convert.ToInt32(tdealers.DataKeys[dataItem.DisplayIndex].Value.ToString());
            string cmdarg = e.CommandArgument.ToString();
            Session["itemID"] = itemID;
            Session["cmdarg"] = cmdarg;
        }
        //Session["ordercart"] = dt; 

Response.Redirect("~/itemdescription.aspx");
            }





protected void Btnchk_Click(object sender, ImageClickEventArgs e)
{
    DDLstore.SelectedIndex = 0;
    tdealers.Dispose();
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
    String strSQLQuery;
       string  strSearch = Textsearch.Text;
    int l=((strSearch.Trim ()).Length);
        if ( l > 0){

      strSQLQuery = "Select a.item,a.item_id,a.unitprice,a.in_stock,a.itemphoto, b.vendor, b.vendor_address," +
    "b.vendor_city, b.vendor_phone, b.vendor_email from Tbl_item  as a join Tbl_vendor as b on a.vendor_id= b.vendor_id " +
    "where a.item LIKE '%" + Regex.Replace(strSearch, "'", "''") + "%' or a.descriptn LIKE '%" + Regex.Replace(strSearch, "'", "''") + "%' ORDER BY item ;";

            
            cn.Open();
            SqlCommand objCommand = new SqlCommand(strSQLQuery, cn);
            SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
            DataSet objDataSet = new DataSet();
            objAdapter.Fill(objDataSet);

            tdealers.DataSource = objDataSet;

            tdealers.DataBind();

            cn.Close();
           
        }
    else {
        Textsearch .Text = "Enter search criteria!";


        }
}

}
