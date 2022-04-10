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

public partial class searchresult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // dcat();
            intPageSize.Text = "30";
            intCurrIndex.Text = "0";


            DaBind();
        }
    }

    private void DaBind()
    {SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlDataAdapter objDA;
        DataSet objDS = new DataSet();
        if (Session["abc"] == null)
        {
            

            objDA = new SqlDataAdapter("exec allitems", objConn);

           

            if (!IsPostBack)
            {
                objDA.Fill(objDS);
                intRecordCount.Text = Convert.ToString(objDS.Tables[0].Rows.Count);
                objDS.Clear();

                objDS = new DataSet();
        objDA.Fill(objDS, Convert.ToInt32(intCurrIndex.Text), Convert.ToInt32(intPageSize.Text), "Tbl_item");
ItemsList.DataSource = objDS;
        ItemsList.DataBind();
        objConn.Close();
                PrintStatus();
            }
        }
        else {
            objDS = (DataSet)(Session["abc"]);
            intRecordCount.Text = Convert.ToString(objDS.Tables[0].Rows.Count);
            ItemsList.DataSource = objDS;
            ItemsList.DataBind();
            PrintStatus();
        }
        
        
    }

    public void ShowFirst(object sender, EventArgs e)
    {

        intCurrIndex.Text = "0";
        DaBind();

    }


    public void ShowPrevious(object sender, EventArgs e)
    {
        intCurrIndex.Text = Convert.ToString(Convert.ToInt64(intCurrIndex.Text) - Convert.ToInt64(intPageSize.Text));
        if (Convert.ToInt64(intCurrIndex.Text) < 0)
        {
            intCurrIndex.Text = "0";
        }
        DaBind();
    }

    public void ShowNext(object sender, EventArgs e)
    {
        if (Convert.ToInt64(intCurrIndex.Text) + 1 < Convert.ToInt64(intRecordCount.Text))
        {
            intCurrIndex.Text = Convert.ToString(Convert.ToInt64(intCurrIndex.Text) + Convert.ToInt64(intPageSize.Text));
        }
        DaBind();
    }

    public void ShowLast(object sender, EventArgs e)
    {
        long tmpInt;

        tmpInt = (Convert.ToInt64(intRecordCount.Text)) % (Convert.ToInt64(intPageSize.Text));
        if (tmpInt > 0)
        {
            intCurrIndex.Text = Convert.ToString(Convert.ToInt64(intRecordCount.Text) - tmpInt);
        }
        else
        {
            intCurrIndex.Text = Convert.ToString(Convert.ToInt64(intRecordCount.Text) - Convert.ToInt64(intPageSize.Text));
        }
        DaBind();
    }
    private void PrintStatus(){
        lblStatus.Text = " Items:<b>" + intRecordCount.Text;
        lblStatus.Text += "</b> - Page :<b> ";
        lblStatus.Text += Convert.ToString(Convert.ToInt64(Convert.ToInt64(intCurrIndex.Text) / Convert.ToInt64(intPageSize.Text) + 1));
        lblStatus.Text += "</b> of <b>";

        if (( Convert .ToInt64 (intRecordCount.Text) % Convert.ToInt64 (intPageSize.Text)) > 0 ){
            lblStatus.Text += Convert .ToString (Convert .ToInt64 ( Convert .ToInt64 (intRecordCount.Text) / Convert .ToInt64 (intPageSize.Text) + 1));
        }
        else {
            lblStatus.Text += Convert .ToString (Convert .ToInt64 (intRecordCount.Text) / Convert .ToInt64(intPageSize.Text));
        }
        lblStatus.Text += "</b>";
    }

    //private void dcat()
    //{
    //    SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //    SqlDataAdapter objDA = new SqlDataAdapter("Select * from Tbl_catergory", objConn);
    //    DataSet objDs = new DataSet();
    //    objDA.Fill(objDs);
    //    this.Select1.Items.Add(new ListItem("Select...", ""));
    //    this.Select1.AppendDataBoundItems = true;
    //    this.Select1.DataSource = objDs;
    //    this.Select1.DataTextField = "category";
    //    this.Select1.DataValueField = "category_id";
    //    this.Select1.DataBind();
    //    objConn.Close();
    //}
    //public  void btn_search(object sender, EventArgs e)
    //{

    //    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //    SqlCommand scom = new SqlCommand("select * from Tbl_item  WHERE (item like '%" + this.Texts.Value + "%') and category_id =@category_id ", sconn);

    //    scom.Parameters.AddWithValue("@category_id", Select1.SelectedItem.Value);
    //    sconn.Open();
    //    SqlDataAdapter objAdapter = new SqlDataAdapter(scom);
    //    DataSet objDataSet = new DataSet();
    //    objAdapter.Fill(objDataSet);
        
    //    ItemsList.DataSource = objDataSet;
    //    ItemsList.DataBind();
    //}
}
