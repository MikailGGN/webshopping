<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="checklist.aspx.cs" Inherits="checklist" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script runat ="server" >
    DataTable dt;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        dstate();
        
        if (Session["Cart"] != null)
        {
            insessiontable();
        }
    }
    void insessiontable()
    {
           
        dt = (DataTable)(Session["Cart"]);
        //dt.Columns [0].ColumnName  ="";
        dt.Columns[1].ColumnName   = "Item";
        dt.Columns[2].ColumnName = "Quantity";
        dt.Columns[3].ColumnName  = "Price"; 
          
        GV.DataSource = dt;
        GV.DataBind();

    }
    protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        // dt.RowDeleting += new DataRowChangeEventHandler(Row_Deleting);
        DataRowCollection itemColumns = dt.Rows;

        itemColumns[e.RowIndex].Delete();
        dt.AcceptChanges();
        GV.DataSource = dt;
        GV.DataBind();
    }

    protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Width = Unit.Pixel(5);
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[5].Visible = false;
        //e.Row.Cells[0].BorderColor = System.Drawing.Color.White ;

        //e.Row.Cells[0].BackColor = System.Drawing.Color.;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //for (int i = 2; i < e.Row.Cells.Count; i++)
            //{

                TextBox txt = new TextBox();
                txt.Text = e.Row.Cells[1].Text;
                if (txt.Text == "&nbsp;")
                {
                    txt.Text = "";
                }

                txt.TextMode = TextBoxMode.SingleLine;

                txt.Rows = 1;

               txt.BorderWidth = Unit.Pixel(0);
                txt.Width = Unit.Pixel(300);
                e.Row.Cells[1].Controls.Add(txt);
                e.Row.Cells[1].BorderColor = System.Drawing.Color.White ;

                txt.Attributes.Add("onclick", "javascript:setFocus(this)");
            
            txt=new TextBox() ;
            txt.Text = e.Row.Cells[2].Text;
                if (txt.Text == "&nbsp;")
                {
                    txt.Text = "";
                }

                txt.TextMode = TextBoxMode.SingleLine;

                txt.Rows = 1;
                txt.BorderWidth = Unit.Pixel(0);
                txt.Width = Unit.Pixel(300);
                e.Row.Cells[2].Controls.Add(txt);
                e.Row.Cells[2].BorderColor = System.Drawing.Color.White ;

                txt.Attributes.Add("onclick", "javascript:setFocus(this)");

                DropDownList ddl = new DropDownList();
                ddl.Items.Add(new ListItem("1", "1")); ddl.Items.Add(new ListItem("2", "2"));
                ddl.Items.Add(new ListItem("3", "3")); ddl.Items.Add(new ListItem("4", "4"));
                ddl.Items.Add(new ListItem("5", "5")); ddl.Items.Add(new ListItem("6", "6"));
                ddl.Items.Add(new ListItem("7", "7")); ddl.Items.Add(new ListItem("8", "8"));
                ddl.Items.Add(new ListItem("9", "9")); ddl.Items.Add(new ListItem("10", "10"));
           
            ddl.SelectedValue = e.Row.Cells[3].Text;
            ddl.ID = "ddl";
            ddl.Width = Unit.Pixel(80);
            
                //txt = new TextBox();
                //txt.Text = e.Row.Cells[3].Text;
                //if (txt.Text == "&nbsp;")
                //{
                //    txt.Text = "";
                //}

                //txt.TextMode = TextBoxMode.SingleLine;

                //txt.Rows = 1;
                //txt.BorderWidth = Unit.Pixel(0);
                //txt.Width = Unit.Pixel(80);
           
                e.Row.Cells[3].Controls.Add(ddl );
                e.Row.Cells[3].BorderColor = System.Drawing.Color.White ;
               ddl.SelectedIndexChanged += new EventHandler(changeprice);
               ddl.AutoPostBack = true;

                txt = new TextBox();
                txt.Text = e.Row.Cells[4].Text ;
               txt .Text =string .Format ("{0:n}",Convert .ToDouble (txt .Text ));
                if (txt.Text == "&nbsp;")
                {
                    txt.Text = "";
                }

                txt.TextMode = TextBoxMode.SingleLine;
                txt.Style.Add(HtmlTextWriterStyle.TextAlign , "right");
                txt.Rows = 1;
                txt.BorderWidth = Unit.Pixel(0);
                txt.Width = Unit.Pixel(100);
                txt.ID = "Textp";
                e.Row.Cells[4].Controls.Add(txt);
                e.Row.Cells[4].BorderColor = System.Drawing.Color.White ;

                txt.Attributes.Add("onclick", "javascript:setFocus(this)");

           // }

               

        }
        else if (e.Row.RowType == DataControlRowType.Header)
        {

            //e.Row.BackColor = System.Drawing.Color.FromArgb(242, 242, 242);

            for (int i = 1; i < e.Row.Cells.Count; i++)
            {

               // e.Row.Cells[i].BorderColor = System.Drawing.Color.White ;

            }

        }

        Decimal totalprice = 0;
                for (int x = 0; x < GV.Rows.Count; x++)
                {
                    totalprice += Convert.ToDecimal(((TextBox)GV.Rows[x].Cells[4].Controls[0]).Text);
                }

                Session["trantotal"] = totalprice;
                totalLabel.Text = " Total : N" + Convert.ToString(string .Format ("{0:n}",totalprice));
             

    }
    void changeprice(object sender, EventArgs e)
    {
//qty postback
        Decimal uprice , bprice ;
        GridViewRow gr = (GridViewRow)((DataControlFieldCell)((DropDownList)sender).Parent).Parent;
        DropDownList d1 = (DropDownList)gr.FindControl("ddl");
        
        
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("Select unitprice from Tbl_item where item_id=@item_id ", myConn);
              int x =  Convert .ToInt32 ( gr.Cells[5].Text);
      cmd.Parameters.AddWithValue("@item_id", x);
      myConn.Open();

      SqlDataReader rd = cmd.ExecuteReader();
      rd.Read();
      uprice = Convert.ToDecimal(rd["unitprice"]);
      myConn.Close();
      bprice = uprice * Convert.ToInt32(d1.SelectedValue );
     
     gr.Cells[4].Text = Convert.ToString(string .Format ("{0:n}",bprice));

        
     Decimal totalprice = 0;
     foreach (GridViewRow row in GV.Rows)
     {


         totalprice += Convert.ToDecimal(row.Cells [4].Text);
     }
     Session["trantotal"] = totalprice;
     totalLabel.Text = " Total : N" + Convert.ToString(string .Format ("{0:n}",  totalprice));
    }
    
    protected void DDLstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from Tbl_state where state_id=@state_id", objConn);
cmd.Parameters .AddWithValue ("@state_id", DDLstate.SelectedItem .Value );
objConn.Open();
SqlDataReader rd = cmd.ExecuteReader();
rd.Read();
shippingLabel.Text = Convert.ToString(rd["shipping_cost"]);
timeLabel.Text = Convert.ToString(rd["shipping_duration"]);
rd.Close();
objConn.Close();              
        
        
    }
    protected void Btncont_Click(object sender, EventArgs e)
    {

        Session["Cart"] = dt;
        Response.Redirect("~/itemsgallery.aspx");
        
    }
    protected void Btnnext_Click(object sender, EventArgs e)
    {

        Session["Cart"] = dt;
        Session["transhipping"] = shippingLabel.Text;
        Session["trantotal"] = TransactnTotalLabel.Text;
        Response.Redirect("~/customerinfo.aspx");

    }
    private void dstate()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter objDA = new SqlDataAdapter("sp_state", objConn);
        DataSet objDs = new DataSet();
        objDA.Fill(objDs);
        this.DDLstate .Items.Add(new ListItem("Select...", ""));
        this.DDLstate.AppendDataBoundItems = true;
        this.DDLstate.DataSource = objDs;
        this.DDLstate.DataTextField = "state";
        this.DDLstate.DataValueField = "state_id"; 
        //this.schsession.DataBind();
        objConn.Close();
    }
</script>
 <script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
    <link href="mainstyle.css" rel="stylesheet" type="text/css" />
<style type ="text/css" >
.hd{ padding :9px 5px 2px 8px;}</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="osi2">
<div style ="height :200px; width :100%">
<table >
<tr>
<td></td><td></td>
</tr>
</table>

</div>
<div >
    
<asp:GridView ID="GV" runat="server" OnRowDataBound="GV_RowDataBound"  HeaderStyle-ForeColor ="Black"  HeaderStyle-Font-Size ="Small" OnRowDeleting="GV_RowDeleting" AutoGenerateDeleteButton="true" Width ="99%" HeaderStyle-BorderStyle ="None" HeaderStyle-BackColor ="#efefef"  >
   
    </asp:GridView>
    <asp:HiddenField ID="Hiddenqty" runat="server" />
   <table > <tr><td></td><td align ="right" >
   <asp:Label ID="totalLabel" runat="server"></asp:Label>
    <br />
    </td></tr>
    
    <tr><td>
   <img src ="images/delivery.jpg" />
    </td><td>
        
    **Delivery time and rate vary by location. select your location to view.
    <br />
 Location :  <asp:DropDownList ID="DDLstate" runat="server"  Width ="120px"
        onselectedindexchanged="DDLstate_SelectedIndexChanged">
    </asp:DropDownList>:
    <asp:Label ID="shippingLabel" runat="server"></asp:Label>
    <asp:Label ID="timeLabel" runat="server" ></asp:Label>
   <br />
    Trasaction Total : <asp:Label ID="TransactnTotalLabel"  runat="server"></asp:Label>
   </td></tr> </table>
</div>
<div>
<asp:Button ID="Btncont" runat="server" Text="Continue Shopping" OnClick ="Btncont_Click" />
    <asp:Button ID="Btnnext" runat="server" Text="Next" OnClick ="Btnnext_Click" />
</div>
</div>
</asp:Content>

