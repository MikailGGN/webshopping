<%@ Page Language="C#" MasterPageFile="~/Page.master" AutoEventWireup="true" CodeFile="orderlist.aspx.cs" Inherits="orderlist" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script runat ="server" >
      
    protected void Page_Load(object sender, EventArgs e)
    {
        insessiontable();
    }
    void insessiontable()
    {
        Txtitem.Text = (string)(Session["cmdarg"]);
        
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div >

<table >
<tr>
<td></td><td></td><td><asp:TextBox ID="Txtitem" runat="server"></asp:TextBox></td><td></td>
</tr>


<tr>
<td></td><td></td><td><asp:DropDownList ID="DDLQty" runat="server"></asp:DropDownList>
</td><td></td>
</tr>
<tr>
<td></td><td></td><td><asp:TextBox ID="Txtprice" runat="server"></asp:TextBox></td><td></td>
</tr>
<tr>
<td></td><td></td><td><asp:DropDownList ID="DDLcolor" runat="server"></asp:DropDownList></td><td></td>
</tr>
<tr>
<td></td><td></td><td><asp:TextBox ID="Txtmixunit" runat="server"> </asp:TextBox><asp:Button ID="Button1" runat="server" Text="+"></asp:Button></td><td></td>
</tr>
<tr>
<td></td><td colspan ="2">
    <asp:Repeater ID="Repeater1" runat="server">
    </asp:Repeater>
</td><td> </td>
</tr>
</table>
    

</div> 
    
</asp:Content>

