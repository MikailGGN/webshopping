<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="item-description.aspx.cs" Inherits="itemsgallery" Title="Untitled Page"   %>
<%@ Import NameSpace="System.Web" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
 <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
 <style type ="text/css" >
     .flot{ clear :both; }
     .retmt{ padding-left :20px;height: 18px;float: both ; padding-top:5px;}
     .pop{ display: block;
	width: 18px;
	height: 18px;
	float: right ;
	margin: -17px 400px;
	cursor: pointer;
           background: url(images/del.png) no-repeat;  clear:right; margin-right: 0px;
           }
           
        .white_content
        {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 50%;
            height: 45%;
            padding: 16px;
            border: 2px solid #ccc;
            background-color:#efefef ;
            z-index: 1002;
            overflow: auto;
        }
    </style>
  
<script runat ="server" >
    DataTable dt ;
    DataRow dr;
    String desc, uprice, itm, pstr,ide;
        protected void Page_Load(object sender, EventArgs e){
       
          if(! IsPostBack ){
              createtable();
          }

          if (Session["itemz"] != null)
          {

              Labqty.Text = Convert.ToString((int)Session["itemz"]) + " item(s) { N " + Convert.ToString(string.Format("{0:n}", (double)Session["prc"])) + "}";
          }
            aditem();
           

        } 
     

    void aditem()
    {

        int x = Convert.ToInt32(Request .QueryString ["id"] );

        if (x > 0)
        {
            SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand icmd = new SqlCommand("Select * from Tbl_item where item_id = @item_id", iConn);
            icmd.Parameters.AddWithValue("@item_id", x );

            iConn.Open();

            SqlDataReader rdr = icmd.ExecuteReader();
            while (rdr.Read() == true)
            {
                pstr = Convert.ToString(rdr["itemphoto"]);
                desc = Convert.ToString(rdr["descriptn"]);
                itm = Convert.ToString(rdr["item"]);
                uprice = Convert.ToString(rdr["unitprice"]);
                ide = Convert.ToString(rdr["item_id"]);
                ItemLabel.Text = Convert.ToString(rdr["item"]);
                PriceLabel.Text = Convert.ToString(rdr["unitprice"]);
                idLabel.Text = Convert.ToString(rdr["item_id"]);
            }
            rdr.Close();
            iConn.Close();


            
          
        }
        
    }
    void addtocart( object sender, EventArgs e) {
        // Set the SelectedIndex property to select an item in the DataList.
        dt = (DataTable)(Session["Cart"]);
        
        // Populate the table with sample values.
        //for (int i = 0; i < 9; i++)
        //{
        int i = dt.Rows.Count;


        bool pqty = false;
        String product = ItemLabel.Text; ;
        foreach (DataRow r in dt.Rows)
        {
            if (Convert.ToString(r[1]) == product)
            {

                r[2] = Convert.ToInt32(r[2]) + Convert.ToInt32(QtyLabel.Text);
                r[3] = Convert.ToDouble(r[3]) + Convert.ToDouble(PriceLabel.Text);
                pqty = true;
                break;
            }
        }

        dr = dt.NewRow();
        if (!pqty == true)
        {
            dr[0] = i + 1;
            dr[1] = ItemLabel.Text;
            dr[2] = Convert.ToInt32(QtyLabel.Text);
            dr[3] = Convert.ToDouble(PriceLabel.Text);
            dr[4] = Convert.ToInt32(idLabel.Text);
            dt.Rows.Add(dr);

        }
        Session["Cart"] = dt;


        //dr.AcceptChanges();
        Dlcart.DataSource = dt;
        Dlcart.DataBind();
        // Rebind the data source to the DataList to refresh the control.
       
        int itemz = 0;
        double prc = 0;
        foreach (DataRow row in dt.Rows)
        {


            itemz = itemz + ((int)row["Quantity"]);
            prc = prc + ((double)row["Price"]);

        }
        string uze = Convert.ToString(prc);
        String k = string.Format("{0:n}", prc);
        Session["itemz"] = itemz;
        Session["prc"] = prc;
        Labqty.Text = Convert.ToString(itemz) + " item(s) { N " + k + "}";
    }

    void createtable()
    {

        if (Session["Cart"] == null)
        {
            dt = new DataTable("cart");
            // Define the columns of the table.
            dt.Columns.Add(new DataColumn("ID", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Item", typeof(String)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Price", typeof(double)));
            dt.Columns.Add(new DataColumn("ITEMID", typeof(Int32)));

            Session["Cart"] = dt;
        }
    }
    void chkout(object sender, EventArgs e)
    {

        Response.Redirect("~/checklist.aspx");

    }
    
</script>
 
 <link href="mainstyle.css" rel="stylesheet" type="text/css" />
    <script type ="text/javascript" >
     function engimage(x){
    var x;
    document.getElementById('Img1').src=x;
    
    
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
<div class ="oke">
 <si:scrollimage  ID ="st1" runat ="server" />
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate >
    
<div class ="osii">
<table >
<tr>
<td colspan ="2"></td><td> 
    </td><td><dt style ="margin-top : auto ;"><a class="basket " href ="checklist.aspx">
    <asp:Label ID="Labqty" runat="server" Width ="200px" Text ="0 item(s) { N 0.00}" ></asp:Label></a> </dt>
<br /></td>
</tr>
    <tr>
    <td colspan ="3">
    <img width ="330px" height ="340px" id ="Img1"  src ="<%=pstr %>" />
    </td> 
    <td>
    
    <%
    
    
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        String query = "SELECT TOP (4)itemphoto  FROM Tbl_image_description  where item_id=@item_id";

        SqlCommand Cmd = new SqlCommand(query, objConn);
        Cmd.Parameters.AddWithValue("@item_id", Convert.ToInt32(Request .QueryString ["id"]));
        objConn.Open();
        SqlDataReader dbread;

        dbread = Cmd.ExecuteReader();

        while (dbread.Read() == true) { 
            
        %>
        
        <a href="javascript:void(0)" onclick ="engimage('<%=   dbread["itemphoto"] %>')"><img src="<%=   dbread["itemphoto"] %>" border=1 width ="80px" height ="80px"/></a> 
        <br />
        <br />
       <%
        
        }
        dbread.Close();
        objConn.Close();       %>  
    
    
    
    </td>
    </tr> 
    <tr>
    <td colspan ="4" style ="text-indent :20px;">
  <p>  <%=desc  %>
    
    <br />
    <br />
  Unit Price:  N <%=uprice %></p>
    </td>
    </tr>
<tr>
<td></td><td>
    Quantity : <asp:TextBox ID="QtyLabel" Width ="60px" runat="server"></asp:TextBox></td><td><asp:ImageButton ID="Button1" runat="server" AlternateText = "add to cart" ImageUrl ="~/images/add.png" OnClick ="addtocart"  />
 </td><td></td>
</tr>
</table>  
<div class ="nv ">
</div>
    <asp:Label ID="ItemLabel" runat="server" Text="<%=itm %>"  Visible ="false" ></asp:Label>
<asp:Label ID="PriceLabel" runat="server" Text="<%=uprice %>" Visible ="false"></asp:Label>
<asp:Label ID="idLabel" runat="server" Text="<%=ide %>" Visible ="false"></asp:Label>
    <input id="hid" type="hidden" runat ="server"  />
</div>
<div >
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


