<%@ Page Language="C#" MasterPageFile="~/users/vpage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="users_login" Title="nairatags | online marketplace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type ="text/css"  >
     .txtfield {
	border: 1px #9A9A9A solid;
	width: 210px;
	height: 16px; 

}
.lbl 
{
	 font : 10px tahoma  #000;
     padding-left :20px;
    
      }
</style> 
<link href="../pagestyle.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" >
<%--<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style =" margin-top :100px; margin-left :200px; padding-top :10px; border : solid 1.5px #efefef; height :320px; width :600px; background : url(../images/bg_container2.jpg) repeat-x;">
    <h3>User Login</h3>
<center >
<table style ="margin-top :100px" cellspacing ="5px"  ><tr><td align ="right" >
    <asp:Label ID="Label1" runat="server" CssClass ="lbl " Text="Email"></asp:Label> </td><td> <asp:TextBox ID="Textuser" runat="server" CssClass ="txtfield "></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="Textuser" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
  </td></tr><tr><td>
  <asp:Label ID="Label2" runat="server" CssClass ="lbl " Text="Password"></asp:Label></td><td>  <asp:TextBox ID="Textpass" runat="server" CssClass ="txtfield " TextMode ="Password" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="Textpass" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
   </td></tr> 
   <tr><td>
      </td><td align ="right" ><a href ="recovery.aspx" class ="lbl " > Forgot password</a> <asp:ImageButton ID="Button1" runat="server" Text="Login" 
               onclick="Button1_Click" ImageUrl="~/images/login.png" /></td></tr>
               <tr><td >
                   <asp:HiddenField ID="HidField" runat="server" />
               </td><td></td></tr>
               </table>
    </center>
</div>
</asp:Content>

