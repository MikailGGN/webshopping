<%@ Page Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="users_Default" Title="Untitled Page" EnableEventValidation ="false" %>
<%@ Import NameSpace="System.Web" %>
<%@ Import Namespace ="System.Data"%>
<%@ Import Namespace ="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script runat ="server" >
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            inscat();
        }
       
    }
    void add_click(object sender, EventArgs e ) {
    
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("insert into Tbl_catergory(category)values(@category)", conn);

        cmd.Parameters.AddWithValue("@category", Textcat.Text);
        conn.Open();

        if (cmd.ExecuteNonQuery() > 0)
        {

            Listcat.Items.Add(Textcat.Text);
            Textcat.Text = "";

        }
        else { }
        conn.Close();
    }
    void addsub_click(object sender, EventArgs e) {


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("insert into Tbl_s_category(category_id, s_category)values(@category_id,@s_category)", conn);

        cmd.Parameters.AddWithValue("@category_id", Convert .ToInt32 (this.Listcat .SelectedItem .Value ));
        cmd.Parameters.AddWithValue("@s_category",this.Textscat .Text);
        conn.Open();

        if (cmd.ExecuteNonQuery() > 0)
        {

     this.Listscat  .Items.Add(Textscat.Text);
            Textscat.Text = "";

        }
        else { }
        conn.Close();
    
    
    
    }
   private  void cat_select( object sender, EventArgs e) {
       Listscat.Items.Clear();
       
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd=new SqlCommand ("select * from Tbl_s_category where category_id=@category_id", conn);
        cmd.Parameters.AddWithValue("@category_id", Convert.ToInt32(Listcat.SelectedItem.Value));

        da.SelectCommand = cmd; 
        conn.Open();
        DataSet objDs = new DataSet(); 
        da.Fill(objDs);
       // this.Listscat .Items.Add(new ListItem("Select...", ""));
        this.Listscat.AppendDataBoundItems = true;
        this.Listscat.DataSource = objDs;
        this.Listscat.DataTextField = "s_category";
        this.Listscat.DataValueField = "s_category_id";
        this.Listscat.DataBind();
        conn.Close();
    
    }
    void inscat() { 
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand("select * from Tbl_catergory", conn);
        da.SelectCommand = cmd; 
        conn.Open();
        DataSet objDs = new DataSet();
        da.Fill(objDs);
        //this.Listcat .Items.Add(new ListItem("Select...", ""));
        this.Listcat .AppendDataBoundItems = true;
        this.Listcat .DataSource = objDs;
        this.Listcat .DataTextField = "category";
        this.Listcat .DataValueField = "category_id";
        this.Listcat .DataBind();
        conn.Close();
    }
</script>
<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate >
<div class ="osii">

<table >
<tr>
<td>&nbsp;</td>
<td></td><td>&nbsp;</td><td></td><td></td>
</tr>
<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label>
    </td>
<td>
    <asp:TextBox ID="Textcat" runat="server"></asp:TextBox><asp:Button ID="Btn1" runat="server" Text="Add" OnClick ="add_click" /></td><td>
        <asp:Label ID="Label1" runat="server" Text="Sub-Category"></asp:Label>
    </td><td>
    <asp:TextBox ID="Textscat" runat="server"></asp:TextBox><asp:Button ID="Btn2" runat="server" Text="Add" OnClick ="addsub_click" /></td><td></td>
</tr>
<tr>
<td>&nbsp;</td>
<td></td><td>
    &nbsp;</td><td>
        &nbsp;</td><td></td>
</tr>
<tr>
<td>
    &nbsp;</td>
<td>
    <asp:ListBox ID="Listcat" runat="server" OnSelectedIndexChanged ="cat_select" 
        Width="161px" AutoPostBack ="true" ></asp:ListBox>
</td><td>
        &nbsp;</td><td>
<asp:ListBox ID="Listscat" runat="server" Width="164px"></asp:ListBox></td><td></td>
</tr>
</table>
</div>
</ContentTemplate>
<Triggers >
<asp:AsyncPostBackTrigger ControlID ="Btn2"  />
</Triggers>
 </asp:UpdatePanel>
</asp:Content>

