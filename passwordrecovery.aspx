﻿<%@ Page Language="C#"  ViewStateEncryptionMode ="Always"  %>
<%@ Register TagPrefix ="simg" Namespace ="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <si:scrollimage  ID ="st1" runat ="server" />
    
    </div>
    </form>
</body>
</html>
