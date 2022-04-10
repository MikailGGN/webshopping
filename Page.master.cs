using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Page : System.Web.UI.MasterPage
{

    //private HtmlMeta descriptionMeta;
    //private HtmlMeta keywordsMeta;

    //protected override void OnInit(EventArgs e)
    //{
    //    base.OnInit(e);

    //    this.MetaDescriptionHolder.Load += new EventHandler(MetaDescriptionHolder_Load);
    //    this.MetaKeywordsHolder.Load += new EventHandler(MetaKeywordsHolder_Load);

    //    this.Page.LoadComplete += new EventHandler(Page_LoadComplete);
    //}

    //private void MetaDescriptionHolder_Load(object sender, EventArgs e)
    //{
    //    string content = this.ParseHolderContent(this.MetaDescriptionHolder);

    //    if (string.IsNullOrEmpty(content)) return;

    //    this.descriptionMeta = new HtmlMeta();
    //    this.descriptionMeta.Name = "description";
    //    this.descriptionMeta.Content = content;
    //}

    //private void MetaKeywordsHolder_Load(object sender, EventArgs e)
    //{
    //    string content = this.ParseHolderContent(this.MetaKeywordsHolder);

    //    if (string.IsNullOrEmpty(content)) return;

    //    this.keywordsMeta = new HtmlMeta();
    //    this.keywordsMeta.Name = "keywords";
    //    this.keywordsMeta.Content = content;
    //}

    //private void Page_LoadComplete(object sender, EventArgs e)
    //{
    ////    Page ipage = sender as Page;
    ////    if (ipage == null) return;

    ////    if (this.descriptionMeta != null) ipage.Header.Controls.Add(this.descriptionMeta);
    ////    if (this.keywordsMeta != null) ipage.Header.Controls.Add(this.keywordsMeta);
    ////}

    ////private string ParseHolderContent(ContentPlaceHolder holder)
    ////{
    ////    if (holder == null || holder.Controls.Count == 0) return string.Empty;

    ////    LiteralControl control = holder.Controls[0] as LiteralControl;
    ////    if (control == null || string.IsNullOrEmpty(control.Text)) return string.Empty;

    ////    return control.Text.Trim();
    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dcat();

        }
    }

    protected void btn_search(object sender, EventArgs e)
      {

          SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
          SqlCommand scom = new SqlCommand("select * from Tbl_item  WHERE (item like '%" + this.Texts.Value + "%') and category_id =@category_id ", sconn);

          scom.Parameters.AddWithValue("@category_id", Select1.SelectedItem .Value );
          sconn.Open();
          SqlDataAdapter objAdapter = new SqlDataAdapter(scom);
          DataSet objDataSet = new DataSet();
          objAdapter.Fill(objDataSet);
          Session["abc"] = objDataSet;

          Response.Redirect("~/searchresult.aspx");


      }
      private void dcat()
      {
          SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
          SqlDataAdapter objDA = new SqlDataAdapter("Select * from Tbl_catergory", objConn);
          DataSet objDs = new DataSet();
          objDA.Fill(objDs);
          this.Select1.Items.Add(new ListItem("Select...", ""));
          this.Select1.AppendDataBoundItems = true;
          this.Select1.DataSource = objDs;
          this.Select1.DataTextField = "category";
          this.Select1.DataValueField = "category_id";
          this.Select1.DataBind();
          objConn.Close();
      }
  
}
