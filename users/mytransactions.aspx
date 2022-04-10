<%@ Page Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="mytransactions.aspx.cs" Inherits="users_mytransactions" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>

<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />

<script runat ="server">
    
    protected void Page_Load(object sender, EventArgs e)
    {
        mysaleslog();
    }
    
    void mysaleslog()
    {
        int a = Convert.ToInt32((int)(Session["venorcustid"]));
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        SqlCommand Cmd = new SqlCommand("sp_trans_vendor_view", objConn);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.AddWithValue("@vendor_id", a);
        objConn.Open();
        SqlDataReader dbread;

        dbread = Cmd.ExecuteReader();


        tcms.DataSource = dbread;
        tcms.DataBind();
        dbread.Close();
        objConn.Close();
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<div>
   <asp:Repeater id="tcms" runat="server" >
<HeaderTemplate>
<table border="1" cellspacing="0" cellpadding="4" bordercolor="#1273ae" width ="755px" >
<tr bgcolor="#eaf0f2">
	<th colspan ="120">Date</th>
	<th colspan ="120">Item(s)</th>
	<th colspan ="120">Unit Price</th>
	<th colspan ="100">Quantity</th>
	
</tr>
</HeaderTemplate>

<ItemTemplate>
<tr bgcolor="#f0f0f0">
	
	<td colspan ="120" valign ="top" ><%#DataBinder.Eval(Container.DataItem,"transaction_date")%></td>
	<td colspan ="120" valign ="top"><%#DataBinder.Eval(Container.DataItem,"item")%></td>
	<td colspan ="120" valign ="top">N&nsbp; <%#DataBinder.Eval(Container.DataItem,"unitprice","{0:0,000}")%></td>
	<td colspan ="100" valign ="top"><%#DataBinder.Eval(Container.DataItem,"qty")%></td>
	</tr>

</ItemTemplate>

<FooterTemplate>

</table>
</FooterTemplate>
</asp:Repeater>
</div>
</asp:Content>

