<%@ Page Language="C#" MasterPageFile="~/users/user.master"  AutoEventWireup="true"  EnableEventValidation ="true"   CodeFile="detail.aspx.cs" Inherits="users_detail" Title="Untitled Page"  ValidateRequest ="false"  Debug ="true" %>
<%@ Import NameSpace="System.Web" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>
<style type ="text/css" >
.txtfield {
	border: 1px #9A9A9A solid;
	width: 195px;
	height: 16px;
 margin-left :0px;
}
</style>
    <link href ="../mainstyle.css" rel="stylesheet" type="text/css" />
   
<script runat ="server" >
    
    protected void Page_Load(object sender, EventArgs e) {

        
        int newpage = Convert.ToInt32(Request.QueryString["addpage"]);
        if (newpage == 1)
        {
            
            BtnSave.Visible = true;
        }
        else
        {
            Btnupd.Visible = true ;
        }

        if (IsPostBack) {

            if (Hiddencreate.Value != null)
            {
                update_page();
            }
        }        
sel_page();
        
    }

    void create_newpage(object sender, EventArgs e)
    {

       
        
        String insquery="INSERT into Tbl_pageinfo (pagename,pagedesc,pagedata,url)values ( '" + Textname .Text +"','"+Textdesc .Text +
            "', '" + textedita.Value + "' )";
           SqlConnection iConn = new  SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           
           SqlCommand iCmd = new SqlCommand (insquery , iConn);
	  	  
          iConn.Open();
          iCmd.ExecuteReader();
          iConn.Close();
              
   
    }

    void sel_page() {


        int pagenew = Convert.ToInt32(Request.QueryString["id"]);

        String selquery = "Select * from Tbl_pageinfo where pageid =@pageid";
        SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand iCmd = new SqlCommand(selquery, iConn);
        iCmd.Parameters.AddWithValue("@pageid", pagenew);
        iConn.Open();
        SqlDataReader rd = iCmd.ExecuteReader();

        while (rd.Read() == true)
        {
            Textname.Text = Convert.ToString(rd["pagename"]);
            Textdesc.Text = Convert.ToString(rd["pagedesc"]);
            textedita.Value = Convert.ToString(rd["pagedata"]);
            Hiddencreate.Value = Convert.ToString(rd["pageid"]);

        }

        iConn.Close();

    }
  void update_page()
  {
     
      
      String updquery = "update Tbl_pageinfo set  pagedesc ='" + Textdesc.Text + "' ,pagedata = '" + textedita.Value + "' where pageid='"+Hiddencreate.Value +"'";
          SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

          SqlCommand iCmd = new SqlCommand(updquery, iConn);

          iConn.Open();
          iCmd.ExecuteReader();
          iConn.Close();

      
  }
    </script>
 
 <script language ="javascript" src="../texteditor/wysiwyg.js"  type="text/javascript"></script>
 
 
 
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div style ="margin-left :70px" >
   
  <table  cellpadding ="0" cellspacing ="0">
<tr>
   <td align ="right">Page :</td><td>
     &nbsp;<asp:TextBox ID="Textname" runat="server" CssClass ="txtfield "></asp:TextBox>
</td><td align ="right" >
 Description :</td><td>
  &nbsp;<asp:TextBox ID="Textdesc" runat="server" CssClass ="txtfield"></asp:TextBox>
</td></tr>
<tr>
<td colspan ="4">
    <asp:HiddenField ID="Hiddencreate" runat="server" />
</td> 
</tr>
<tr>
<td colspan ="4">
<br />
<br />
Page Content <img src="../cotentslider/arrowdown.gif"  width= "10px" height ="10px"/>
<br />
<br />
</td> </tr> 
<tr>
<td colspan ="4">
<textarea id="textedita" runat ="server"  style="height: 400px; width: 750px;">

</textarea>
        
<script language="javascript1.2">

  generate_wysiwyg('<%=textedita.ClientID%>');
</script></td></tr>
</table>
    <asp:HiddenField ID="updField" runat="server" />

  <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick ="create_newpage"  Visible ="false"  />
    
<asp:Button ID="Btnupd" runat="server" Text="Save" Visible ="false"   />  
</div>

</asp:Content>

