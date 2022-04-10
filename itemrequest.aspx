<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="itemrequest.aspx.cs" Inherits="variance" Title="nairatags.com | Online Shopping Services."  %>
<%@ Import NameSpace="System" %>
<%@ Import NameSpace="System.Web" %>
<%@ Import NameSpace="Microsoft.VisualBasic" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
 <style type ="text/css" >
 .twotop{ padding-top :20px; line-height :16px; padding-left :30px;
 	
 	}
 	.txt
{  overflow:auto ;
	border : solid 1px #ddd;
	width : 320px; color :#999;
	font :tahoma lucida console;
	font-size :small ;
	}
 </style>
<script runat="server"> 
    
    
    DataTable dt ;
    DataRow dr;
        protected void Page_Load(object sender, EventArgs e){
       
            if (!IsPostBack ){ 
           
              
                createtable();
            }

            if (Session["itemz"] != null)
            {
                 
                Labqty.Text = Convert.ToString((int) Session["itemz"]) + " item(s) { N " +Convert .ToString ( string .Format ("{0:n}",(double ) Session["prc"])) + "}";
            }
            //if ((Request.QueryString["uni"]) != null)
            //{

            //    requested();

            //}
                       
            

        } 

   
    void createtable() {

        if (Session["Cart"] == null)
        {
            dt = new DataTable("cart");
            // Define the columns of the table.
            dt.Columns.Add(new DataColumn("ID", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Item", typeof(String)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Price", typeof(double)));
            dt.Columns.Add(new DataColumn("ITEMID", typeof(Int32 )));
           
            Session["Cart"] = dt;
        }
    }
    void chkout( object sender, EventArgs e) {
        
        Response.Redirect("~/checklist.aspx");
    
    }
    </script>

   

    <link href="mainstyle.css" rel="stylesheet" type="text/css" />
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    
<div class ="oke">
<si:scrollimage  ID ="st1" runat ="server" />
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >
<div class ="osi3">

<dl ><p class ="twotop"> If you you donot see what you are want, you can Make a request.<br /> Fill the form below and the seller will contact you.<br /> This way you are sure of getting the item(s) and the best rate. </p>

</dl>
<dl>
   <dd style ="margin-left :30px"><table>
   <tr>
   <td>
       <asp:Label ID="Label1" runat="server" Text="Name :"></asp:Label></td><td>
           <asp:TextBox ID="Textname" runat="server" CssClass ="txt " ></asp:TextBox></td><td></td>
   </tr>
   <tr>
   <td>
       <asp:Label ID="Label2" runat="server" Text="Email :" ></asp:Label></td><td >
           <asp:TextBox ID="Textemail" runat="server" CssClass ="txt " ></asp:TextBox></td><td></td>
   </tr>
   <tr>
   <td valign ="top" >
       <asp:Label ID="Label3" runat="server" Text="Item Description :"></asp:Label></td><td >
           <asp:TextBox ID="Textdesc" runat="server" TextMode ="MultiLine"  Rows ="4" CssClass ="txt "></asp:TextBox></td><td></td>
   </tr>
   <tr>
   <td>
       <asp:Label ID="Label4" runat="server" Text="Deadline :"></asp:Label></td><td >
           <asp:TextBox ID="TextBox1" runat="server" CssClass ="txt "></asp:TextBox></td><td></td>
   </tr>
   <tr>
   <td></td><td>
       <asp:Button ID="Button1" runat="server" Text="send" /></td><td></td>
   </tr>
   </table></dd>

</dl> 

 
</div>
<div class ="otun3">
<dt style ="margin-top : auto ;"><a class="basket " href ="#">
    <asp:Label ID="Labqty" runat="server" Width ="190px" Text ="0 item(s) { N 0.00}" ></asp:Label></a></dt>
<br />
 <asp:DataList ID="Dlcart" runat="server" Width ="99%" Font-Size ="8px" >
 <HeaderStyle Font-Bold ="true" ForeColor ="#127" BackColor ="#EFEFEF" />
 <HeaderTemplate >
 <table >
 <tr><td>SN0.</td><td>
    ITEM( QTY)
    </td><td> PRICE</td><td style ="visibility :hidden "><%# DataBinder.Eval(Container.DataItem, "ITEMID")%></td>
    
 </HeaderTemplate>
    <ItemTemplate >
    <tr><td><%# DataBinder.Eval(Container.DataItem, "ID") %></td><td>
    <%# DataBinder.Eval(Container.DataItem, "Item")%> (<%# DataBinder.Eval(Container.DataItem, "Quantity")%>)
    </td><td> N <%# DataBinder.Eval(Container.DataItem, "Price", "{0:N}")%></td><td style ="visibility :hidden "><%# DataBinder.Eval(Container.DataItem, "ITEMID")%></td>
    
    </ItemTemplate>
    <FooterTemplate >
    </table>
    <asp:ImageButton  ID="Btnchk" runat="server" Text="checkout" OnClick ="chkout" ImageUrl ="~/images/add2.png" />
    </FooterTemplate>
    </asp:DataList>
      
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
 