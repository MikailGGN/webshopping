<%@ Page Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="vendor_reg.aspx.cs" Inherits="users_vendor_reg" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />
<style type ="text/css" >
.txtfield {
	border: 1px #9A9A9A solid;
	width: 195px;
	height: 16px;
 margin-left :0px;
}</style>
<script runat ="server" >
    
    void save_click(object sender, EventArgs e) {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("insert into Tbl_vendor (vendor, vendor_address, vendor_phone, vendor_email) values (@vendor, @vendor_address, @vendor_phone, @vendor_email)", conn);
       

        cmd.Parameters.AddWithValue("@vendor", this.textvendor .Value );
        cmd.Parameters.AddWithValue("@vendor_address", this.textaddress.Value );
        cmd.Parameters.AddWithValue("@vendor_phone",textphone .Value );
        cmd.Parameters.AddWithValue("@vendor_email", textemail .Value );

        conn.Open();

        if (cmd.ExecuteNonQuery() > 0)
        {
 clear();
        }
        else
        {
           
            
        }

        conn.Close();
    
    }
    void clear() {

        textaddress.Value = "";
        textemail.Value = "";
        textphone.Value = "";
        textvendor.Value = "";
        
    
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="forms">
<dl>
<dt></dt></dl><dl>
<table  cellpadding cellpadding ="0" cellspacing="0" 
        style ="width :700px"  >
<tr>
<td align="right">
<label >Vendor Name :</label>&nbsp;</td><td><input type ="text" id ="textvendor" runat ="server" class ="txtfield" />
</td></tr><tr>
<td align="right"><label >Contact Address :</label>&nbsp;</td><td><input type ="text" id ="textaddress" class ="txtfield" runat ="server" />
</td></tr><tr>
<td align="right"><label >Contact Email :</label>&nbsp;</td><td><input type ="text" id ="textemail" runat ="server" class ="txtfield" />
</td></tr><tr>
<td align="right"><label >Contact Telephone :</label>&nbsp;</td><td><input type ="text" id ="textphone" runat ="server" class ="txtfield" />
                 </td></tr><tr>
<td></td><td><input type ="button" runat ="server" id="save" runat ="server" value ="Save" onserverclick ="save_click" />
</td></tr></table>
</dl>
</div>

</asp:Content>

