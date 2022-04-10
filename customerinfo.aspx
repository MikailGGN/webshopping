<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="customerinfo.aspx.cs" Inherits="customerinfo" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
<link href="mainstyle.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            width: 189px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="osi2 ">
<div style ="height :200px; width :100%">
   <table >
   <tr style ="height :80px"><td></td><td></td></tr>
   <tr style ="height :120px">
   <td align ="center"  width="200px" valign ="middle" ><img src="images/WARN.png" /></td><td valign="middle" >
   
       Information provide on this page will only<br /> be used for the ongoing users 
       transaction.<br />
       Enter your personal details and proceed to the payment.
   </td></tr>
   </table> 
</div>
<div >

<div class ="forms" >
<table cellpadding ="5px" cellspacing ="10px" width="100%" >
<tr style="background :url(images/banner.png) repeat-x; height:25px;">
    
<td colspan="6"></td>
 
</tr>
<tr style="height:60px;">
<td></td><td></td><td> 
    <asp:HiddenField ID="Hiddenqty" runat="server" />
</td><td class="style1"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
<td style="width:40px;"></td><td>
    <asp:Label ID="Label1" runat="server" Text="Name :"></asp:Label></td><td>
    <asp:TextBox ID="Txtname" runat="server" Width="251px"></asp:TextBox> </td>
    <td style="border-spacing: 5px">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="Txtname" ErrorMessage="Name required">*</asp:RequiredFieldValidator>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
<td></td><td><asp:Label ID="Label2" runat="server" Text="Email :"></asp:Label></td><td> 
    <asp:TextBox ID="Txtemail" runat="server" Width="252px"></asp:TextBox></td>
    <td class="style1">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="Txtemail" ErrorMessage="email required">*</asp:RequiredFieldValidator>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
<td></td><td><asp:Label ID="Label3" runat="server" Text="Address :"></asp:Label></td><td> 
    <asp:TextBox ID="Txtaddress" runat="server" Width="252px"></asp:TextBox></td>
    <td class="style1">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="Txtaddress" ErrorMessage="Address Requiredr">*</asp:RequiredFieldValidator>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
<td></td><td><asp:Label ID="Label4" runat="server" Text="Telephone(Home) :"></asp:Label></td><td> 
    <asp:TextBox ID="Txthphone" runat="server" Width="252px"></asp:TextBox></td>
    <td class="style1">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="Txthphone" ErrorMessage="Telephone Required">*</asp:RequiredFieldValidator>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
<td></td><td><asp:Label ID="Label5" runat="server" Text="Mobile :"></asp:Label></td><td> 
    <asp:TextBox ID="Txtmphone" runat="server" Width="251px"></asp:TextBox></td>
    <td class="style1"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
<td></td><td><asp:Label ID="Label6" runat="server" Text="Delivery Time :"></asp:Label></td><td> 
    <asp:DropDownList ID="DDLtime" runat="server" Width="249px">
    </asp:DropDownList> </td><td class="style1">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="DDLtime" ErrorMessage="Delivery Time Required">*</asp:RequiredFieldValidator>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
<td></td><td></td><td> </td><td class="style1"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td><td>&nbsp;</td><td> 
    <div>
        <img alt="" src="BuildCaptcha.aspx" />
        <br />
        <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
    </div>
    </td><td class="style1">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td><td>&nbsp;</td><td> &nbsp;</td><td class="style1">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
<td></td><td>
   
    </td><td>
    <asp:Button ID="btnadv" runat="server" Text="Submit" onclick="btnadv_Click"/> </td>
    <td class="style1"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
</table>
</div>
</div>
</div> 
</asp:Content>

