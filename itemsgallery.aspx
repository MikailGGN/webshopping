<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="itemsgallery.aspx.cs" Inherits="itemsgallery"   %>
<%@ Import NameSpace="System.Web" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <title>
  nairatags.com | Online Shopping Services. 
</title>
<meta name="description" content="Online Shopping Services.  
      | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      low prices, premium service, quick Sales" />

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
            height: 325px;
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
    String desc, uprice, itm, pstr;
        protected void Page_Load(object sender, EventArgs e){
       
          
            
            if (!IsPostBack ){ 
           
                intPageSize.Text = "28";
                intCurrIndex.Text = "0";
               
                
                    DaBind();
               
              createtable();
            }
           
            aditem();
           

        } 
        


    private void  DaBind(){

        
           SqlConnection objConn = new  SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           SqlDataAdapter objDA;
         if (Request.QueryString["sc"] != null) {

               int cat = Convert.ToInt32(Request.QueryString["c"]);
               int scat = Convert.ToInt32(Request.QueryString["sc"]);
               objDA = new SqlDataAdapter();
               SqlCommand objcmd = new SqlCommand("sp_select_sup_category", objConn);
               objcmd.CommandType = CommandType.StoredProcedure;
               objcmd.Parameters.AddWithValue("@category_id", cat);
               objcmd.Parameters.AddWithValue("@s_category_id", scat);
               objDA.SelectCommand = objcmd; 
              
           }
           else  if (Request .QueryString ["c"]!= null )
           {
               int cat = Convert.ToInt32 (Request.QueryString["c"]);
               objDA = new SqlDataAdapter();
               SqlCommand objcmd = new SqlCommand("Sp_select_by_category", objConn);
               objcmd.CommandType = CommandType.StoredProcedure;
             objcmd.Parameters.AddWithValue("@category_id", cat); 
               objDA.SelectCommand = objcmd;
           
           }
           else
           {
               objDA = new SqlDataAdapter("exec allitems", objConn);
           }
           DataSet objDS = new DataSet();
            

            if (!IsPostBack ){
                objDA.Fill(objDS);
                intRecordCount.Text = Convert .ToString (objDS.Tables[0].Rows.Count);
                objDS.Clear();

                objDS = new DataSet();
            }

            objDA.Fill(objDS, Convert.ToInt32(intCurrIndex.Text), Convert.ToInt32(intPageSize.Text), "Tbl_item");

            ItemsList.DataSource = objDS;
            ItemsList.DataBind();
        objConn.Close();
        PrintStatus();
    }

    public void ShowFirst(object sender, EventArgs e)
    { 
    
        intCurrIndex.Text = "0";
        DaBind();
   
         }


    public void ShowPrevious(object sender, EventArgs e)
    {
        intCurrIndex.Text = Convert .ToString ( Convert .ToInt64 (intCurrIndex.Text) - Convert .ToInt64(intPageSize.Text));
        if (Convert .ToInt64(intCurrIndex.Text) < 0 ){
            intCurrIndex.Text = "0";
        }
        DaBind();
    }

    public void ShowNext(object sender, EventArgs e)
    {
        if ( Convert.ToInt64  (intCurrIndex.Text) + 1 < Convert.ToInt64(intRecordCount.Text)){
            intCurrIndex.Text = Convert.ToString(Convert.ToInt64 (intCurrIndex.Text) + Convert.ToInt64(intPageSize.Text));
}
        DaBind();
    }

    public void ShowLast(object sender, EventArgs e)
    {
        long  tmpInt;

        tmpInt = (Convert.ToInt64 (intRecordCount.Text)) % (Convert.ToInt64 (intPageSize.Text));
        if (tmpInt > 0){
            intCurrIndex.Text = Convert.ToString(Convert.ToInt64(intRecordCount.Text) - tmpInt);
        }
        else{
            intCurrIndex.Text = Convert.ToString (Convert.ToInt64 (intRecordCount.Text) - Convert.ToInt64 (intPageSize.Text));
        }
        DaBind();
    }

    private void PrintStatus(){
        lblStatus.Text = " Items:<b>" + intRecordCount.Text;
        lblStatus.Text += "</b> - Page :<b> ";
        lblStatus.Text += Convert.ToString(Convert.ToInt64(Convert.ToInt64(intCurrIndex.Text) / Convert.ToInt64(intPageSize.Text) + 1));
        lblStatus.Text += "</b> of <b>";

        if (( Convert .ToInt64 (intRecordCount.Text) % Convert.ToInt64 (intPageSize.Text)) > 0 ){
            lblStatus.Text += Convert .ToString (Convert .ToInt64 ( Convert .ToInt64 (intRecordCount.Text) / Convert .ToInt64 (intPageSize.Text) + 1));
        }
        else {
            lblStatus.Text += Convert .ToString (Convert .ToInt64 (intRecordCount.Text) / Convert .ToInt64(intPageSize.Text));
        }
        lblStatus.Text += "</b>";
    }

    void Item_Command(Object sender, DataListCommandEventArgs e)
    {

        // Set the SelectedIndex property to select an item in the DataList.
        dt = (DataTable)(Session["Cart"]);
        ItemsList.SelectedIndex = e.Item.ItemIndex;
        DaBind();


        // Populate the table with sample values.
        //for (int i = 0; i < 9; i++)
        //{
       

         int i = dt.Rows.Count;
        
        
        bool pqty = false ;
        String product = ((TextBox)ItemsList.SelectedItem.FindControl("ItemLabel")).Text; ;
        foreach (DataRow r in dt.Rows )
        {
            if (Convert.ToString (r[1]) == product)
            {

                r[2] = Convert.ToInt32(r[2]) + Convert.ToInt32(((TextBox)ItemsList.SelectedItem.FindControl("QtyLabel")).Text);
                r[3] = Convert.ToDouble(r[3]) + Convert.ToDouble(((TextBox)ItemsList.SelectedItem.FindControl("PriceLabel")).Text);
                pqty = true;
                break;
            }
        }
        
dr = dt.NewRow();
        if (!pqty == true)
        {
            dr[0] = i + 1;
            dr[1] = ((TextBox)ItemsList.SelectedItem.FindControl("ItemLabel")).Text;
            dr[2] = Convert.ToInt32(((TextBox)ItemsList.SelectedItem.FindControl("QtyLabel")).Text);
            dr[3] = Convert.ToDouble(((TextBox)ItemsList.SelectedItem.FindControl("PriceLabel")).Text);
            dr[4] = Convert.ToInt32(((TextBox)ItemsList.SelectedItem.FindControl("idLabel")).Text);
            dt.Rows.Add(dr);
          
        }
        Session["Cart"] = dt; 
           


        //dr.AcceptChanges();
        Dlcart.DataSource = dt;
        Dlcart.DataBind();
        // Rebind the data source to the DataList to refresh the control.
        DaBind();

    }

    void addtocart(object sender, EventArgs e)
    {
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
Image1 .ImageUrl  = Convert.ToString(rdr["itemphoto"]);
                desc = Convert.ToString(rdr["descriptn"]);
                itm = Convert.ToString(rdr["item"]);
                uprice = Convert.ToString(rdr["unitprice"]);
                ItemLabel.Text = Convert.ToString(rdr["item"]);
                PriceLabel.Text = Convert.ToString(rdr["unitprice"]);
                idLabel.Text = Convert.ToString(rdr["item_id"]);
            }
            rdr.Close();
            iConn.Close();


            
            light.Style.Add(HtmlTextWriterStyle.Display, "block");
           
            
        }
        
    }
    void closediv(object sender, EventArgs e) {
        light.Style.Add(HtmlTextWriterStyle.Display, "none");
        DaBind();
       // Response.Redirect("itemsgallery.aspx");
    }
    void chkout(object sender, EventArgs e)
    {

        Response.Redirect("~/checklist.aspx");

    }
</script>
 
 <link href="mainstyle.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
<div class ="oke">
<div class ="unfil ">
 <si:scrollimage  ID ="st1" runat ="server" /></div>
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate >
    
<div class ="osii">
<div style ="margin-top : auto ; margin-right :10px; margin-left :500px;"><a class="basket " href ="checklist.aspx">
    <asp:Label ID="Labqty" runat="server" Width ="200px" Text ="0 item(s) { N 0.00}" ></asp:Label></a> </div>
<br />
<div style ="azimuth :left ">
<asp:DataList id="ItemsList"
           BorderColor="black"
           CellPadding="0"
           CellSpacing="10"
           RepeatDirection="Vertical"
           RepeatLayout="Table"
           RepeatColumns="4"
   OnItemCommand ="Item_Command" 
           runat="server">

         <HeaderStyle CssClass ="dhd">
         </HeaderStyle>

        

         <HeaderTemplate>

         </HeaderTemplate>
         <ItemStyle CssClass ="flot"></ItemStyle >

         <ItemTemplate>
         
         <br />
         <a href="itemsgallery.aspx?c=<%#DataBinder.Eval(Container.DataItem,"category_id")%>&id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>" >
<asp:Image id="ProductImage" AlternateText="Product picture"  Height ="180px" Width ="160px"
                 ImageUrl='<%# DataBinder.Eval(Container.DataItem, "itemphoto") %>'
                 runat="server"/></a>
                 <br />
          <a href ="variance.aspx?uni=<%# DataBinder.Eval(Container.DataItem, "item") %>&Pli=<%# DataBinder.Eval(Container.DataItem, "s_category_id") %>">
           <%# DataBinder.Eval(Container.DataItem, "item") %> 
           </a>
            <br />
<a href ="variance.aspx?uni=<%# DataBinder.Eval(Container.DataItem, "item") %>&Plit=<%# DataBinder.Eval(Container.DataItem, "unitprice") %>">
             N <%# DataBinder.Eval(Container.DataItem, "unitprice","{0:0,000}") %>

</a> <br />
                   
         </ItemTemplate>
        <SelectedItemStyle  CssClass ="flot"/>
       <SelectedItemTemplate >
        <br />
         <a href="itemsgallery.aspx?id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>#" >
<asp:Image id="ProductImage" AlternateText="Product picture"  Height ="180px" Width ="160px"
                 ImageUrl='<%# DataBinder.Eval(Container.DataItem, "itemphoto") %>'
                 runat="server"/></a>
                 <br />
          <a href ="variance.aspx?uni='<%# DataBinder.Eval(Container.DataItem, "item") %>'&Pli=<%# DataBinder.Eval(Container.DataItem, "s_category_id") %>">
           <%# DataBinder.Eval(Container.DataItem, "item") %> 
           </a>
            <br />
<a href ="variance.aspx?uni=<%# DataBinder.Eval(Container.DataItem, "item") %>&Pli=<%# DataBinder.Eval(Container.DataItem, "unitprice") %>">
             N <%# DataBinder.Eval(Container.DataItem, "unitprice","{0:0,000}") %>

</a> <br /></SelectedItemTemplate>  

      </asp:DataList>
 </div>
<div class ="nv ">
<ul >
<li>
<a href="itemsgallery.aspx#this" 
ID="hrefFirst" onserverclick="ShowFirst" 
runat="server" style ="border :1px dotted #efefef; width: 18px;height: 18px;float: left ; background-image : url(images/Backward_over.gif); background-repeat :no-repeat ;  padding-right :2px; padding-top :5px"></a>
</li><li>
<a href="itemsgallery.aspx#this" 
ID="hrefPrevious"
onserverclick="ShowPrevious" 
runat="server" style ="border :1px dotted #efefef;width: 18px;height: 18px;float: left ; background-image : url(images/Backward.gif); background-repeat :no-repeat ;  padding-right  :2px;padding-top :5px"></a>
</li><li>
<a href="itemsgallery.aspx#this" 
ID="hrefNext"
onserverclick="ShowNext" class ="arr"
runat="server" style ="border :1px dotted #efefef; width: 18px;height: 18px;float: left ; background-image : url(images/Forward.gif); background-repeat :no-repeat ;  padding-left :2px;padding-top :5px;"></a>
</li><li>
<a href="itemsgallery.aspx#this" 
ID="hrefLast" onserverclick="ShowLast" 
runat="server" style =" border :1px dotted #efefef; display: inline   ;width: 18px;height: 18px;float: left ; background-image : url(images/Forward_over.gif); background-repeat :no-repeat ;  padding-left :2px;padding-top :5px"></a>
</li>
<li>
<a class ="retmt ">
<asp:label ID="lblStatus" Runat="server"  /> 
</a></li></ul></div>
 <asp:Label ID="ItemLabel" runat="server"   Visible ="false" ></asp:Label>
<asp:Label ID="PriceLabel" runat="server"  Visible ="false"></asp:Label>
<asp:Label ID="idLabel" runat="server" Visible ="false"></asp:Label>
<asp:label ID="intCurrIndex" Visible="False" Runat="server" />
<asp:label ID="intPageSize" Visible="False" Runat="server" />
<asp:label ID="intRecordCount" Visible="False" Runat="server" /> 
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

 <div id="light" class="white_content" runat ="server" >
        &nbsp;<a href="javascript:void(0)" runat ="server" onserverclick ="closediv" class ="pop ">  </a>
        <br />
        <table style ="width :50%; height :35%" ><tr>
        <td>
           <asp:Image ID="Image1" runat="server" Height ="200px" Width ="200px" />
           
             <br />
              <%=itm  %>
             </td><td style ="text-align :10px; width :500px" colspan ="2">
          <p style ="margin-top :20px; margin-left :10px; line-height :20px;">  <%=desc  %>
            <br />
            <br />
           N <%=uprice %></p>
             </td>
             </tr>
             <tr>
<td></td><td align ="right" style ="width :500px">
    Quantity&nbsp;:&nbsp<asp:TextBox ID="QtyLabel" Width ="60px" runat="server"></asp:TextBox></td><td><asp:ImageButton ID="Button1" runat="server" AlternateText = "add to csrt" ImageUrl ="~/images/add.png" OnClick ="addtocart"  />
 </td><td></td>
</tr></table>
        </div> 
       
</ContentTemplate>
        
       </asp:UpdatePanel>    
</asp:Content>


