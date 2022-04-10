<%@ Page Language="C#" MasterPageFile="~/users/user.master" Title="Untitled Page" AutoEventWireup="true" EnableEventValidation ="false"  %>
<%@ Import Namespace ="System.Data"%>
 <%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>
<script runat="server">
    String pstr, itm , uprice;
    protected void Page_Load(object sender, EventArgs e) {
         if ( Session["loggedin"] == "") {
            Response.Redirect("login.aspx");
           }

         int updid = Convert.ToInt32(Request.QueryString["upd"]);
         if (IsPostBack )
         {
             if (updid > 0)
             {

                 upd_product();
             }
         }
        
        
        int deleteid = Convert.ToInt32(Request.QueryString["d"]);
	if (deleteid > 0) {
	      int queryvalue =Convert .ToInt32 ( Request.QueryString["d"]);
	  	 String  strSQL   = "DELETE FROM Tbl_item WHERE item_id = " + queryvalue + ";";
	  	  SqlConnection dconn =new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
          SqlCommand iCmd = new SqlCommand(strSQL, dconn);
       	  dconn.Open();
          iCmd.ExecuteReader();
          dconn.Close();
	}
        itempage();
        aditem();
    }

    void itempage() {
    
        int a=Convert .ToInt32 ((int)(Session["venorcustid"]));
          SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
       
           
            SqlCommand Cmd = new SqlCommand("sp_loadstock", objConn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.AddWithValue("@vendor_id", a);
            objConn.Open();
            SqlDataReader dbread;

            dbread = Cmd.ExecuteReader();
            
            
            tcms.DataSource = dbread;
            tcms.DataBind();
            dbread.Close();
            objConn.Close();
            String numberofpage = Convert.ToString (tcms.Items.Count) ;
            lblrcount.Text = numberofpage + " item(s) found";
        
    
    }
    void aditem()
    {

        int x = Convert.ToInt32(Request.QueryString["id"]);
        

        if (x > 0)
        {
            int y = Convert.ToInt32((int) (Session ["uid"]));
            if (y < 1) {
            Response.Redirect("users/login.aspx");
            }
            SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand icmd = new SqlCommand("sp_vendorselect", iConn);

            icmd.CommandType = CommandType.StoredProcedure;
            icmd.Parameters.AddWithValue("@item_id", x);
            icmd.Parameters.AddWithValue("@usr_id", y);
            HidField1.Value = Convert.ToString  (x);
            iConn.Open();

            SqlDataReader rdr = icmd.ExecuteReader();
            while (rdr.Read() == true)
            {
Image1.ImageUrl  ="~/" + Convert.ToString(rdr["itemphoto"]);
                this .Textqty .Text  = Convert.ToString(rdr["in_stock"]);
                itm = Convert.ToString(rdr["item"]);
                Textprice.Text  = Convert.ToString(rdr["unitprice"]);
                
            }
            rdr.Close();
            iConn.Close();


            light.Style.Add(HtmlTextWriterStyle.Display, "block");
            fade.Style.Add(HtmlTextWriterStyle.Display , "block");
            fade.Style.Add(HtmlTextWriterStyle.Filter, "alpha(opacity=60)");
            
        }
        
    }
   void upd_product( )
    {
        int x = Convert.ToInt32(HidField1 .Value );
        

        SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("update Tbl_item set  unitprice =@unitprice  , in_stock = @in_stock "
                + "where item_id =@item_id", iConn);

        cmd.Parameters.AddWithValue("@item_id", x);
        cmd.Parameters.AddWithValue("@unitprice", Textprice.Text);
        cmd.Parameters.AddWithValue("@in_stock", Textqty.Text);

        iConn.Open();
        try
        {
            if (cmd.ExecuteNonQuery() > 0)
            {
                Image1.ImageUrl = "";
            }
            else
            {
                Textprice.Text = "";
            }
        }
        catch (Exception ex)
        {
          throw ( ex);
        }
        finally {
            if (iConn.State == ConnectionState.Open) {
                iConn.Close();
            }
        }
        
        
        
        
        //Image1.ImageUrl = "";
        //itm = "";
        //Textprice.Text = "";
        //Textqty.Text = "";
    }
</script>
<style type ="text/css" >
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%; margin-bottom :0%;
			width: 100%;
			height: 100% ;
			background-color: black;
			z-index:1001;
			-moz-opacity: 0.8;
			/*opacity:.80;
			filter: alpha(opacity=80);*/
		}
		.white_content {
			display: none;
			position: absolute;
			top: 25%;
			left: 35%;
			width: 30%;
			height: 50%;
			padding: 16px;
			border: 2px solid orange;
			background-color: white;
			z-index:1002;
			overflow: auto;
		}
	</style>
	<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />


	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   

<div >
<asp:Repeater id="tcms" runat="server"  >
<HeaderTemplate>
<table border="1" cellspacing="0" cellpadding="4" bordercolor="#1273ae" width ="755px" >
<tr bgcolor="#eaf0f2">
	<th colspan ="120">Category</th>
	<th colspan ="120">Item(s)</th>
	<th colspan ="120">Unit Price</th>
	<th colspan ="100">Stock</th>
	<th colspan ="50">Edit</th>
	<th colspan ="50">Delete</th>
	
</tr>
</HeaderTemplate>

<ItemTemplate>
<tr bgcolor="#f0f0f0">
	
	<td colspan ="120" valign ="top" ><%#DataBinder.Eval(Container.DataItem,"Category")%></td>
	<td colspan ="120" valign ="top"><%#DataBinder.Eval(Container.DataItem,"item")%></td>
	<td colspan ="120" valign ="top">N&nbsp; <%#DataBinder.Eval(Container.DataItem,"unitprice","{0:0,000}")%></td>
	<td colspan ="100" valign ="top"><%#DataBinder.Eval(Container.DataItem,"in_stock")%></td>
	<td colspan ="50" valign ="top"><a href="initial.aspx?id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>" title="edit">Edit</a>&nbsp;</td>
	<td colspan ="50" valign ="top"><a href="initial.aspx?d=<%#DataBinder.Eval(Container.DataItem, "item_id")%>"title="delete"> Delete</a> </td>
</tr>

</ItemTemplate>

<FooterTemplate>

</table>
</FooterTemplate>
</asp:Repeater>
  <a href ="productinfo.aspx" >Add Stock</a> 
 <asp:Label ID="lblrcount" runat="server" ></asp:Label>

</div><asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode ="Conditional"  >
   <ContentTemplate>
<div id="light" class="white_content" runat ="server" >Edit Product Price 
 <a href = "javascript:void(0)" onclick = "document.getElementById('<%=light.ClientID%>').style.display='none';document.getElementById('<%=fade.ClientID%>').style.display='none';" onserverclick ="popclear">Close</a>

  
<table >
<tr>
<td>
    <asp:Image ID="Image1" runat="server" Height ="130px" Width ="135px"  />
    <br />
    <%=itm %>
    <br />
   Price : <asp:TextBox ID="Textprice" runat="server" ></asp:TextBox>
    <br />
  Available Quantity :  <asp:TextBox ID="Textqty" runat="server" ></asp:TextBox>
    <br />
    
    <asp:HiddenField ID="HidField1" runat="server" />
</td>
</tr>
</table>
 
<asp:Button ID="Button1" runat="server" Text="Save" PostBackUrl ="~/users/initial.aspx?upd=1"  />
</div></ContentTemplate>
		<Triggers >
		<asp:AsyncPostBackTrigger ControlID ="Button1" />
		 
		</Triggers>
		 </asp:UpdatePanel>
		<div id="fade" class="black_overlay" runat ="server" ></div>
		
</asp:Content>

