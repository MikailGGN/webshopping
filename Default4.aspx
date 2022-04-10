<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>
<%@ Register TagPrefix="si" TagName="scroll1"  Src="~/scroll1.ascx"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <si:scroll1  ID ="st1" runat ="server" />
     <si:scroll1  ID ="Sc1" runat ="server" />
    </div>
    </form>
</body>
</html>
