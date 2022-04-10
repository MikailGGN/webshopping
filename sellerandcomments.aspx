<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="sellerandcomments.aspx.cs" Inherits="variance" Title="nairatags.com | Online Shopping Services. " %>
<%@ Import NameSpace="System" %>
<%@ Import NameSpace="System.Web" %>
<%@ Import NameSpace="Microsoft.VisualBasic" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<meta name="description" content="Online Shopping Services.  
      | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      low prices, premium service, quick Sales" />

<script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
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

<div style ="margin-top :auto ;">
<div style ="padding-left :10px;"> <h5 style ="padding-top :12px;">Featured Topic(s) </h5> 


<div class ="fblogs" >
<dl>
<% 
 SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        String query = "select Top (10)  *  from Tbl_pageinfo ";

        SqlCommand Cmd = new SqlCommand(query, myConn);
        
        myConn.Open();
        SqlDataReader dbread;

        dbread = Cmd.ExecuteReader();
        while (dbread.Read() == true) 
        {%>
        <dd> <a  href ="users/blog.aspx?article=<%= dbread["pageid"]%>" title ="<%= dbread["pagedesc"]%>" > <span ><small> <%= dbread["pagedesc"]%></small> <br /> <%=dbread["pagedata"]%> </span></a></dd>
 <% 
    }

        dbread.Close();
        myConn.Close();
    
     %></dl>
     </div>
 
 </div>
</div> 

 <div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="http://www.nairatags.com/sellerandcomments.aspx" send="true" width="450" show_faces="true" font="lucida grande"></fb:like>

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
      <div class ="relles">
      
      <table >
      </table>
      </div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
 