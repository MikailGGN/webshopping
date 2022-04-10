<%@ Page Language="C#" AutoEventWireup="true" CodeFile="catcha.aspx.cs" Inherits="catcha" %>
<%@ Import Namespace ="System.Drawing" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
    <script runat ="server" >
        void btnSubmit_Click(object sender, EventArgs e) { 
        
        if (Page.IsValid && (txtCaptcha.Text.ToString() == Session["RandomStr"].ToString()))
 {


    Response.Write("Code verification Successful");


  }


  else


   {


    Response.Write( "Please enter info correctly");


  }

        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <img   alt="" src="BuildCaptcha.aspx">
<br />
        <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
   


   <asp:Button runat="Server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" />

    </div>
    </form>
</body>
</html>
