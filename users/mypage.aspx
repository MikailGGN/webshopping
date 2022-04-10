<%@ Page Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true"    CodeFile="mypage.aspx.cs" Inherits="users_mypage" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href ="../mainstyle.css" rel="stylesheet" type="text/css"/>
<script runat = "server" >
          
          protected void Page_Load(object sender, EventArgs e){
       
            
                pageinfo();
            
          }
        private void pageinfo(){
            
            /// subject are selected by the year id in the session
         SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String query= "Select * FROM Tbl_pageinfo";
           
            SqlCommand Cmd = new SqlCommand(query, objConn);
            objConn.Open();
            SqlDataReader dbread;

            dbread = Cmd.ExecuteReader();
            
            
            tcms.DataSource = dbread;
            tcms.DataBind();
            dbread.Close();
            objConn.Close();
            String numberofpage = Convert.ToString (tcms.Items.Count) ;
            lblrcount.Text = numberofpage + " Page(s) found";
        }
        </script>
        
        <script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:Repeater id="tcms" runat="server" >
<HeaderTemplate>
<table border="1" cellspacing="0" cellpadding="4" bordercolor="#1273ae" width ="755px" >
<tr bgcolor="#eaf0f2">
	
	<th colspan ="120">Page Description</th>
	<th colspan ="220">Url</th>
	<th colspan ="220">Edit</th>
	<th colspan ="195">Delete</th>
	
</tr>
</HeaderTemplate>

<ItemTemplate>
<tr bgcolor="#f0f0f0">
	
	<td colspan ="120" valign ="top" ><%#DataBinder.Eval(Container.DataItem,"pagedesc")%></td>
	<td colspan ="220" valign ="top"><a href ="blog.aspx?article=<%#DataBinder.Eval(Container.DataItem,"pageid")%>" title="blog.aspx?article=<%#DataBinder.Eval(Container.DataItem ,"pageid")%>" target="_blank">blog.aspx?article=<%#DataBinder.Eval(Container.DataItem,"pageid")%> </td>
	<td colspan ="220" valign ="top"><a href="detail.aspx?id=<%#DataBinder.Eval(Container.DataItem,"pageid")%>" title="edit">Edit</a>&nbsp;</td>
	<td colspan ="195" valign ="top"><a href = "mypage.aspx?id= <%#DataBinder.Eval(Container.DataItem, "pageid")%>" title ="delete">Delete</a> &nbsp;</td>
</tr>

</ItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>
<asp:Label Id="lblrcount" RunAt="server"   />
<a href ="detail.aspx?addpage=1">Addpage</a> 
</asp:Content>

