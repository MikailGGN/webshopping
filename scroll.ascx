<%@ Control Language="C#" AutoEventWireup="true" CodeFile="scroll.ascx.cs" Inherits="scroll" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Web" %>
<%@ Register TagPrefix ="simg" Namespace ="System.Data.SqlClient" %>

 <script src="scrollable/script/jquery.tools.min.js"></script> 
<link rel="stylesheet" type="text/css" href="scrollable/css/scrollable1.css" /> 
<link rel="stylesheet" type="text/css" href="scrollable/css/buttons.css" /> 
<script runat ="server" >
  
   
</script>
  <div >
  <a class="prevPage  left"></a> 
<div class="scrollable">
<h6>Featured Items</h6>	
	<div   class="items"> 
	
	
	<%
	 
	   
    
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String query = "SELECT TOP (12) item_id, item, descriptn, vendor_id, category_id, s_category_id, itemphoto, unitprice, in_stock " +
            "FROM Tbl_item ORDER BY NEWID()";

        SqlCommand Cmd = new SqlCommand(query, objConn);
        objConn.Open();
        SqlDataReader dbread;

        dbread = Cmd.ExecuteReader();

        while (dbread.Read() == true) { 
            
        %>
        <dd>
        <img src ="<%=   dbread["itemphoto"] %>"  />
        
       <a href ="item-description.aspx?id=<%=dbread["item_id"] %>" > <%=dbread ["item"] %></a>
        </dd>
        <%
        
        }
        dbread.Close();
        objConn.Close();       %>
        </div> 
</div> 
<a class="nextPage right"></a> 

<script> 
	$(function()  { $("div.scrollable").scrollable({size: 5}); });
</script> 

    
    </div>