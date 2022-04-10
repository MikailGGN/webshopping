<%@ Page Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="productinfo.aspx.cs" Inherits="users_productinfo" Title="Untitled Page" %>

<%@ Import Namespace ="System.Data"%>
 <%@ Import Namespace ="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type ="text/css" >
		
		.below_content {
			display: none;
			position: absolute;
			border: 1px solid #1273ae;
			background-color: white;
    }
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
<script runat ="server" >

    String nupath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack ) {
          //  ddlvend();
            ddlcat();
        }
    }
    protected void Butins_Click(object sender, EventArgs e)
    { below.Style.Add(HtmlTextWriterStyle.Display, "block"); }
    void updocumt(){
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("spinsvendorsproduct", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@item", this.Textproduct.Text);
        cmd.Parameters.AddWithValue("@descriptn", this.Textdescriptn.Text);
        cmd.Parameters.AddWithValue("@category_id", DDLcategory.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@itemphoto",HidF .Value );
        cmd.Parameters.AddWithValue("@unitprice", this.Textprice.Text);
        cmd.Parameters.AddWithValue("@in_stock", Convert.ToInt32(Textqty.Text));
        cmd.Parameters.AddWithValue("@s_category_id", DDLscat.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@vendor_id", Convert .ToInt32 ((int)(Session["venorcustid"]) ));


        String lastid = "select MAX(usr_id) as lid from Tbl_user ";
        SqlCommand iCmd = new SqlCommand(lastid, conn);
        
        conn.Open();

        if (cmd.ExecuteNonQuery() > 0)
        {
            SqlDataReader rd = iCmd.ExecuteReader();
            while (rd.Read() == true)
            {
                HidField2.Value = Convert.ToString(rd["lid"]);
            }
            
            clear();
            below.Style.Add(HtmlTextWriterStyle.Display, "none");
        }
        else {
            clear();
            below.Style.Add(HtmlTextWriterStyle.Display, "none");
        }

        conn.Close();
    }
    void clear() {
        Textprice.Text = "";
        Textproduct.Text = "";
        Textqty.Text = "";
        Textdescriptn.Text = "";
        DDLcategory.SelectedIndex = 0;
        DDLscat.SelectedIndex = 0;
       // DDLvendor.SelectedIndex = 0;
    }
    protected void upload_Click(Object Sender, EventArgs e)
    {

        string uploadpath = Server.MapPath("prodimage/");
        FileName.InnerHtml = MyFile.PostedFile.FileName;
        FileContent.InnerHtml = MyFile.PostedFile.ContentType;
        FileSize.InnerHtml = Convert.ToString(MyFile.PostedFile.ContentLength);
        UploadDetails.Visible = true;

        String strFileName = MyFile.PostedFile.FileName;
        String c = System.IO.Path.GetFileName(strFileName);


        if (!(strFileName == ""))
        {
            MyFile.PostedFile.SaveAs(MapPath("~/prodimage/") + c);
            nupath = "prodimage/" + c;
            HidF.Value  = nupath;
            
            Span1.Visible = true;
            Span1.InnerHtml = "Enter Product details below.";
            updocumt();
        }
        else
        {

            Span1.Visible = true;
            Span1.InnerHtml = "No file was selected to upload.";
        }

       
    }

    protected void upload_Click2(Object Sender, EventArgs e)
    {
        String uploadpath = Server.MapPath("prodimage/");

       
        String strFileName = File1.PostedFile.FileName;
        String c = System.IO.Path.GetFileName(strFileName);


        if (!(strFileName == ""))
        {
            
            ListBox1.Items.Add(c);

        }
       
    }

    protected void refd(object sender, EventArgs e) {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        
        for (int j = 0; j < ListBox1.Items.Count; j++)
        {

            SqlCommand ccmd = new SqlCommand("insert into Tbl_image_description( item_id , itemphoto) values (@item_id, @itemphoto)", conn);
            conn.Open();
            String npath = "prodimage/" + ListBox1.Items[j].Value;

            ccmd.Parameters.AddWithValue("@item_id", Convert.ToInt32(HidField2.Value));
            ccmd.Parameters.AddWithValue("@itemphoto", Convert.ToString(npath));
            ccmd.ExecuteNonQuery();
            conn.Close();


            Request.SaveAs(MapPath("prodimage/") + ListBox1.Items[j].Value, true);
            
        }
        
        light.Style.Add(HtmlTextWriterStyle.Display, "none");
        fade.Style.Add(HtmlTextWriterStyle.Display, "none");
    
    }
    //private void ddlvend()
    //{
    //    //To populate the country dropdown
    //    SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //    SqlDataAdapter objDA = new SqlDataAdapter("Select * from Tbl_vendor", objConn);
    //    DataSet objDs = new DataSet();
    //    objDA.Fill(objDs);
    //    this.DDLvendor .Items.Add(new ListItem("Select...", ""));
    //    this.DDLvendor .AppendDataBoundItems = true;
    //    this.DDLvendor .DataSource = objDs;
    //    this.DDLvendor .DataTextField = "vendor";
    //    this.DDLvendor .DataValueField = "vendor_id";
    //    this.DDLvendor .DataBind();
    //    objConn.Close();
    //}
    private void ddlcat()
    {
        //To populate the country dropdown
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter objDA = new SqlDataAdapter("spallcat", objConn);
        DataSet objDs = new DataSet();
        objDA.Fill(objDs);
        this.DDLcategory .Items.Add(new ListItem("Select...", ""));
        this.DDLcategory .AppendDataBoundItems = true;
        this.DDLcategory .DataSource = objDs;
        this.DDLcategory .DataTextField = "category";
        this.DDLcategory .DataValueField = "category_id";
        this.DDLcategory .DataBind();
        objConn.Close();
    }
    private void ddlscat()
    {
        //To populate the country dropdown
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter objDA = new SqlDataAdapter();
        SqlCommand cmd= new SqlCommand ("spsubcatgory", objConn);
        
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@category_id", DDLcategory.SelectedItem.Value);

        objDA.SelectCommand = cmd;
        DataSet objDs = new DataSet();
        objDA.Fill(objDs);
        this.DDLscat .Items.Add(new ListItem("Select...", ""));
        this.DDLscat .AppendDataBoundItems = true;
        this.DDLscat .DataSource = objDs;
        this.DDLscat .DataTextField = "s_category";
        this.DDLscat .DataValueField = "s_category_id";
        this.DDLscat .DataBind();
        objConn.Close();
    }
    void DDLcategory_SelectedIndexChanged(object sender,EventArgs e ) {

        ddlscat();
        
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<div > 
<table >
<tr>
<td><%--<label >Vendor :</label>--%></td><td>
   <%-- <asp:DropDownList ID="DDLvendor" runat="server">
    </asp:DropDownList>--%>
    </td><td></td>
</tr>
<tr>
<td>
  <label >Product :</label> </td><td>
      <asp:TextBox ID="Textproduct"  runat="server"></asp:TextBox></td><td></td>
</tr>
<tr>
<td><label >Category :</label></td><td>
    <asp:DropDownList ID="DDLcategory" runat="server"  OnSelectedIndexChanged ="DDLcategory_SelectedIndexChanged">
    </asp:DropDownList>
    </td><td></td>
</tr>
<tr>
<td> <label >Model/Brand :</label></td><td>
                            <asp:DropDownList ID="DDLscat" runat="server" >
                            </asp:DropDownList>
                            </td><td></td>
</tr>
<tr>
<td> <label >Price :</label></td><td>
    <asp:TextBox ID="Textprice" runat="server"></asp:TextBox></td><td></td>
</tr>

<tr>
<td><label >Description :</label></td><td>
    <asp:TextBox ID="Textdescriptn" runat="server"></asp:TextBox> </td><td></td>
</tr>
<tr>
<td> <label >Available Quantity :</label></td><td>
    <asp:TextBox ID="Textqty" runat="server"></asp:TextBox>
    </td><td><asp:Button ID="Butins" runat="server" Text="Add Picture" onclick="Butins_Click" /></td>
</tr>

</table>
<br />
 
    <asp:HiddenField ID="HidF" runat="server" />
</div>
<div id="below" class ="below_content"  runat ="server" >
 <input id ="MyFile" type = "file" runat = "server"  size ="40"/>
                            
  <input id="Submit1" type= "submit"  value="Upload" OnServerclick="upload_Click" RunAt="Server" style="height: 22px" />
  <p>Click browse, choose file, then click upload</p>
  <br />
  <p>
  <div id="UploadDetails"  visible = "false"  RunAt="Server">
  File Name: <span  id="FileName" RunAt="Server"/>
  <br/>File Content: <span id="FileContent" RunAt="Server"/>
  <br/>File Size: <span id="FileSize" RunAt="Server" /> bytes
  <br />
  
  <span id="Span1" RunAt="Server"/>
  </div>
  </div> 
  <a href = "javascript:void(0)" onclick = "document.getElementById('<%=light.ClientID%>').style.display='block';document.getElementById('<%=fade.ClientID%>').style.display='block';" onserverclick ="popclear">Add more pictures of this item</a>
 
  </p>
   
<div id="light" class="white_content" runat ="server" > 
 <a href = "javascript:void(0)" onclick = "document.getElementById('<%=light.ClientID%>').style.display='none';document.getElementById('<%=fade.ClientID%>').style.display='none';" onserverclick ="popclear">Close</a>

  
<table >
<tr>
<td>
   <input id ="File1" type = "file" runat = "server"  size ="40"/>
                            
  <input id="Submit2" type= "submit"  value="Upload" OnServerclick="upload_Click2" RunAt="Server" style="height: 22px" />
  <p>Click browse, choose file, then click upload</p>
  <br />
  <p>
  
    <asp:HiddenField ID="HidField2" runat="server" />
<dd >
    <asp:ListBox Id="ListBox1" RunAt="server" Width="334px" Rows="5" />
</td>
</tr>
</table>
 
<asp:Button ID="Button1" runat="server" Text="Save"  OnClick ="refd"  />
</div>

<div id="fade" class="black_overlay" runat ="server" ></div>
		 

</asp:Content>

