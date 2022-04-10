<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="variance.aspx.cs" Inherits="variance" Title="nairatags | online marketplace, e-commerce in Nigeria"  %>
<%@ Import NameSpace="System" %>
<%@ Import NameSpace="System.Web" %>
<%@ Import NameSpace="Microsoft.VisualBasic" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scrollimage.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<meta name="description" content="Online Shopping Services.  
  Buy and Sell Goods Online | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      competitive prices, premium service, quick Sales" />


<script src ="demo/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src ="demo/menu.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href ="demo/style.css" />
<script runat="server"> 
    
    
    DataTable dt ;
    DataRow dr;
        protected void Page_Load(object sender, EventArgs e){
       
            if (!IsPostBack ){ 
           
                intPageSize.Text = "9";
                intCurrIndex.Text = "0";
               DaBind();
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

    private void  DaBind(){
        
        
        
            
        
           SqlConnection objConn = new  SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           
           SqlDataAdapter objDA = new  SqlDataAdapter();
           SqlCommand cmd;

           if (Request.QueryString["Plit"] != null)
           {
           
             
               cmd = new SqlCommand("spsuborprice", objConn);
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.AddWithValue("@unitprice", Convert.ToDecimal(Request.QueryString["Plit"]));
               cmd.Parameters.AddWithValue("@item",  Convert.ToString(Request.QueryString["uni"]));
               objDA.SelectCommand = cmd;
           }
           else if (Request.QueryString["Pli"] != null)
           {

               cmd = new SqlCommand("spsubcategoryanditem", objConn);
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.AddWithValue("@s_category_id", Convert.ToInt32(Request.QueryString["Pli"]));
               cmd.Parameters.AddWithValue("@item", Convert.ToString(Request.QueryString["uni"]));
           objDA.SelectCommand = cmd;
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

        dList.DataSource = objDS;
        dList.DataBind();
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

    private void PrintStatus()
    {
        lblStatus.Text = " Items:<b>" + intRecordCount.Text;
         lblStatus.Text += "</b> - Page :<b> ";
        lblStatus.Text += Convert.ToString(Convert.ToInt64(Convert.ToInt64(intCurrIndex.Text) / Convert.ToInt64(intPageSize.Text) + 1));
        lblStatus.Text += "</b> of <b>";

        if ((Convert.ToInt64(intRecordCount.Text) % Convert.ToInt64(intPageSize.Text)) > 0)
        {
            lblStatus.Text += Convert.ToString(Convert.ToInt64(Convert.ToInt64(intRecordCount.Text) / Convert.ToInt64(intPageSize.Text) + 1));
        }
        else
        {
            lblStatus.Text += Convert.ToString(Convert.ToInt64(intRecordCount.Text) / Convert.ToInt64(intPageSize.Text));
        }
        lblStatus.Text += "</b>";
    }
    void requested() {
    
    //req.
        int a = Convert.ToInt32(Request.QueryString["Pli"]);
        String b = Convert.ToString(Request.QueryString["uni"]);    
        
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           
            SqlDataAdapter obDA = new  SqlDataAdapter();
        
        
        SqlCommand cmd=new SqlCommand ("exec spvariance", myConn);
        cmd.Parameters.AddWithValue("@item", b);
        cmd.Parameters.AddWithValue("@s_category_id", a);

        obDA.SelectCommand = cmd;
           DataSet myDS = new DataSet();

           if (!IsPostBack)
           {
               obDA.Fill(myDS);
               intRecordCount.Text = Convert.ToString(myDS.Tables[0].Rows.Count);
               myDS.Clear();

               myDS = new DataSet();
           }

           obDA.Fill(myDS, Convert.ToInt32(intCurrIndex.Text), Convert.ToInt32(intPageSize.Text), "Tbl_item");

           dList.DataSource = myDS;
           dList.DataBind();
           myConn.Close();
           PrintStatus();
    
    }

    void Item_Command(Object sender, DataListCommandEventArgs e)
    {

        // Set the SelectedIndex property to select an item in the DataList.
      dt = (DataTable)(Session["Cart"]); 
        dList.SelectedIndex = e.Item.ItemIndex;
        DaBind();

        
        // Populate the table with sample values.
        //for (int i = 0; i < 9; i++)
        //{
        int i = dt.Rows.Count;
        
        
        bool pqty = false ;
        String product =((TextBox)dList.SelectedItem.FindControl("ItemLabel")).Text;;
        foreach (DataRow r in dt.Rows )
        {
            if (Convert.ToString (r[1]) == product)
            {

                r[2] = Convert.ToInt32(r[2]) + Convert.ToInt32(((TextBox)dList.SelectedItem.FindControl("QtyLabel")).Text);
                r[3] = Convert.ToDouble (r[3]) + Convert.ToDouble (((TextBox)dList.SelectedItem.FindControl("PriceLabel")).Text);
                pqty = true;
                break;
            }
        }
        
dr = dt.NewRow();
        if (!pqty == true)
        {
            dr[0] = i + 1;
            dr[1] = ((TextBox)dList.SelectedItem.FindControl("ItemLabel")).Text;
            dr[2] = Convert.ToInt32(((TextBox)dList.SelectedItem.FindControl("QtyLabel")).Text);
            dr[3] = Convert.ToDouble(((TextBox)dList.SelectedItem.FindControl("PriceLabel")).Text);
            dr[4] = Convert.ToInt32(((TextBox)dList.SelectedItem.FindControl("idLabel")).Text);
            dt.Rows.Add(dr);
          
        }
        Session["Cart"] = dt; 
        

            //dr.AcceptChanges();
            Dlcart.DataSource = dt;
            Dlcart.DataBind();
        // Rebind the data source to the DataList to refresh the control.
        DaBind();
       int  itemz = 0;
       double prc=0;
        foreach (DataRow  row in dt.Rows )
        {


            itemz = itemz + ((int)row["Quantity"]);
            prc = prc + ((double)row["Price"]);
            
        }
        string uze=Convert.ToString(prc);
       String  k =string .Format ("{0:n}",prc);
        Session["itemz"] = itemz;
        Session["prc"] = prc;
        Labqty.Text = Convert.ToString(itemz) + " item(s) { N " + k  + "}";
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
<div class ="unfil ">
<si:scrollimage  ID ="st1" runat ="server" />
</div>
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >
<div class ="osi">


<dl>
<div class ="nv ">
<ul >
<li>
<a href="variance.aspx#this" 
ID="A1" onserverclick="ShowFirst" 
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Backward_over.gif); background-repeat :no-repeat ; border :1px dotted #efefef;  padding-right  :20px; padding-top :5px"></a>
</li><li>
<a href="variance.aspx#this" 
ID="A2"
onserverclick="ShowPrevious" 
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Backward.gif); background-repeat :no-repeat ; border :1px dotted #efefef;  padding-right :20px;padding-top :5px"></a>
</li><li>
<a href="variance.aspx#this" 
ID="A3"
onserverclick="ShowNext" class ="arr"
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Forward.gif); background-repeat :no-repeat ;  padding-left :20px; border :1px dotted #efefef; padding-top  :5px;"></a>
</li><li>
<a href="variance.aspx#this" 
ID="A4" onserverclick="ShowLast" 
runat="server" style ="display: inline   ;width: 18px;height: 18px;float: left ; background-image : url(images/Forward_over.gif); background-repeat :no-repeat ;  padding-left :20px;border :1px dotted #efefef; padding-top :5px"></a>
</li>
<li>
<a class ="retmt ">
<asp:label ID="Label1" Runat="server"  /> 
</a></li></ul></div>

<asp:label ID="Label2" 
Visible="False"
Runat="server" />
<asp:label ID="Label3" 
Visible="False"
Runat="server" />
<asp:label ID="Label4"
 Visible="False" Runat="server" /> 
</dl>


<dl>
<asp:DataList ID="dList" Runat="server" Width ="540px" RepeatDirection="Vertical" OnItemCommand ="Item_Command" >


<SelectedItemStyle> </SelectedItemStyle > 
        
<HeaderTemplate >

</HeaderTemplate>
<ItemTemplate>
<tr><td style ="width :120px">
<a href ="description.aspx?id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>">
 <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("itemphoto") %>' Height="120px" Width="120px" alt='<%#DataBinder.Eval(Container.DataItem, "item")%>'/>
  </a>   </td> <td>                              
 <%#DataBinder.Eval(Container.DataItem, "item")%>
 <br />
<%#DataBinder.Eval(Container.DataItem, "descriptn")%>
<br />
N <%# DataBinder.Eval(Container.DataItem, "unitprice","{0:0,000}") %>
<br />
<br />
<asp:ImageButton ID="Button1" runat="server" CommandName ="select" AlternateText = "add to csrt" ImageUrl ="~/images/add.png"  />
 
</td></tr>
 
</ItemTemplate> 

<SelectedItemTemplate>

         <tr><td style ="width :120px">
<a href ="description.aspx?id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>">
 <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("itemphoto") %>' Height="120px" Width="120px" alt='<%#DataBinder.Eval(Container.DataItem, "item")%>'/>
  </a>   </td> <td>                              
 <%#DataBinder.Eval(Container.DataItem, "item")%>
 <br />
<%#DataBinder.Eval(Container.DataItem, "descriptn")%>
<br />
N <%# DataBinder.Eval(Container.DataItem, "unitprice","{0:0,000}") %>
<br />
<br />
        <asp:ImageButton ID="Button1" runat="server" CommandName ="select" AlternateText = "add to csrt" ImageUrl ="~/images/add.png"  />
 
<br />
<asp:TextBox ID="idLabel" 
                 Text='<%# DataBinder.Eval(Container.DataItem, "item_id") %>' 
                 runat="server" Visible ="false" ></asp:TextBox> 

            <br />
 <asp:TextBox ID="ItemLabel" 
                 Text='<%# DataBinder.Eval(Container.DataItem, "item") %>' 
                 runat="server" Visible ="false" ></asp:TextBox> 

            <br />

      
            <asp:TextBox id="QtyLabel" 
                 Text="1" 
                 runat="server" Visible ="false" ></asp:TextBox> 

            <br />
    
           
            <asp:TextBox id="PriceLabel" 
                 Text='<%# DataBinder.Eval(Container.DataItem, "unitprice") %>' 
                 runat="server" Visible ="false" ></asp:TextBox>
</td></tr>  
           

         </SelectedItemTemplate>


<FooterTemplate>
</table>
</FooterTemplate>

</asp:DataList>
</dl> 
<dl>
<div class ="nv ">
<ul >
<li>
<a href="variance.aspx#this" 
ID="hrefFirst" onserverclick="ShowFirst" 
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Backward_over.gif); background-repeat :no-repeat ; border :1px dotted #efefef;  padding-right  :20px; padding-top :5px"></a>
</li><li>
<a href="variance.aspx#this" 
ID="hrefPrevious"
onserverclick="ShowPrevious" 
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Backward.gif); background-repeat :no-repeat ; border :1px dotted #efefef;  padding-right :20px;padding-top :5px"></a>
</li><li>
<a href="variance.aspx#this" 
ID="hrefNext"
onserverclick="ShowNext" class ="arr"
runat="server" style ="width: 18px;height: 18px;float: left ; background-image : url(images/Forward.gif); background-repeat :no-repeat ;  padding-left :20px; border :1px dotted #efefef; padding-top  :5px;"></a>
</li><li>
<a href="variance.aspx#this" 
ID="hrefLast" onserverclick="ShowLast" 
runat="server" style ="display: inline   ;width: 18px;height: 18px;float: left ; background-image : url(images/Forward_over.gif); background-repeat :no-repeat ;  padding-left :20px;border :1px dotted #efefef; padding-top :5px"></a>
</li>
<li>
<a class ="retmt ">
<asp:label ID="lblStatus" Runat="server"  /> 
</a></li></ul></div>

<asp:label ID="intCurrIndex" 
Visible="False"
Runat="server" />
<asp:label ID="intPageSize" 
Visible="False"
Runat="server" />
<asp:label ID="intRecordCount"
 Visible="False" Runat="server" /> 
</dl>
 
</div>
<div class ="otun">
<div>
<table  style ="width :199px" ><tr><td>
<dl>
<dt style ="margin-top : auto ;"><a class="basket " href ="checklist.aspx" >
    <asp:Label ID="Labqty" runat="server" Width ="190px" Text ="0 item(s) { N 0.00}" ></asp:Label></a></dt>
</dl></div><br /></td></tr><tr><td>
<div>
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
  </div>    </td></tr></table>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
 