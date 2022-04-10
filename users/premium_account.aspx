<%@ Page Language="C#" MasterPageFile="~/users/vpage.master" AutoEventWireup="true" CodeFile="premium_account.aspx.cs" Inherits="createuser" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type ="text/css" >
.txtfield {
	border: 1px #9A9A9A solid;
	width: 195px;
	height: 16px;
 margin-left :0px;
 overflow :auto ;
}
    #TextArea1
    {
        width: 194px;
    }
</style>
<link href="../pagestyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style =" margin-top :100px; margin-left :200px; padding-top :10px; border : solid 1.5px #efefef; height :320px; width :600px; background : url(../images/bg_container2.jpg) repeat-x;">

<table align="center"  cellpadding ="5px" >
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="3">
               <h3> CREATE USER</h3></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
      <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Username</td>
            <td align="left">
                <asp:TextBox ID="Txtuser" runat="server" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Txtuser" ErrorMessage="Please enter username">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" valign="top">
                Address </td>
            <td align="left">
                <textarea id="textaddress" name="S1" rows="2" runat ="server"  class ="txtfield "></textarea><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator7" runat="server" Display="Dynamic" 
                    ErrorMessage="Address Please" ControlToValidate="textaddress">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:HiddenField ID="HidField1" runat="server" />        &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Email</td>
            <td align="left">
                <asp:TextBox ID="Txtemail" runat="server" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Txtemail" ErrorMessage="Please your email address">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Telephone:</td>
            <td align="left">
                <asp:TextBox ID="Txtphone" runat="server" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="Txtphone" ErrorMessage="Please enter Phone N0.">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Password</td>
            <td align="left">
                <asp:TextBox ID="Txtpass" runat="server" TextMode="Password" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="Txtpass" ErrorMessage="Please enter password">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Confirm Password</td>
            <td align="left">
                <asp:TextBox ID="Txtcpass" runat="server" TextMode="Password" CssClass="txtfield "></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="Txtpass" ControlToValidate="Txtcpass" 
                    ErrorMessage="The password do not match">*</asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Security Question</td>
            <td align="left">
                <asp:TextBox ID="Txtsquet" runat="server" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Txtsquet" ErrorMessage="Please enter security question">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Answer</td>
            <td align="left">
                <asp:TextBox ID="Txtans" runat="server" CssClass="txtfield "></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Txtans" ErrorMessage="Please answer the question">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td align="left">
            
                <asp:Button ID="Btnsub" runat="server" Text="Submit" onclick="Btnsub_Click1" />
            &nbsp;<a href="login.aspx">Login</a></td>
            <td>
                
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td align="left">
            
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
 </div> 
</asp:Content>

