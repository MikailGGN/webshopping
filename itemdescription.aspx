<%@ Page Language="C#" MasterPageFile="~/Masterbase.master" AutoEventWireup="true" CodeFile="itemdescription.aspx.cs" Inherits="itemdescription" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import  NameSpace="System.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script runat ="server" >
     
        int vid; //string queryvalue;
        string a, b;
        public imgloader1 imgval;
        protected void Page_Load(object sender, EventArgs e) {

            descr1();
            loadimg();

            a1.ServerClick += new EventHandler(iImg1);
            a2.ServerClick += new EventHandler(iImg2);
            a3.ServerClick += new EventHandler(iImg3);
            a4.ServerClick += new EventHandler(iImg4);
            a5.ServerClick += new EventHandler(iImg5);
            a6.ServerClick += new EventHandler(iImg6);
        }
        void loadimg() {
            descr2();
            
        Img1.Src ="images/glass.png";
        Img2.Src = "scrollable/images/img11.jpg";
        Img3.Src = "scrollable/images/img1.jpg";
    Img4.Src  = "scrollable/images/img5.jpg";
    Img5.Src  = "~/scrollable/images/img7.jpg";
    Img6.Src  = "~/scrollable/images/img12.jpg";

    if (Img1.Src == "") 
    {
        Img1.Visible = false;
    }
    if (Img2.Src == "")
    {
        Img2.Visible = false;
    }
    if (Img3.Src == "")
    {
        Img3.Visible = false;
    }
    if (Img4.Src == "")
    {
        Img4.Visible = false;
    }
    if (Img5.Src == "")
    {
        Img5.Visible = false;
    }
    if (Img6.Src == "")
    {
        Img6.Visible = false;
    }
        }
        void descr2()
        {


            vid = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //SqlDataAdapter objDA = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("select * from Tbl_image_description  where item_id = @item_id ", objConn);

            cmd.Parameters.AddWithValue("item_id", vid);
            
            objConn.Open();
            SqlDataReader dbread = cmd.ExecuteReader();
            while (dbread.Read() == true)
            {

                Img1.Src = Convert.ToString(dbread [0]);
                Img2.Src = Convert.ToString(dbread[1]);
                Img3.Src = Convert.ToString(dbread[2]);
                Img4.Src = Convert.ToString(dbread[3]);
                Img5.Src = Convert.ToString(dbread[4]);
                Img6.Src = Convert.ToString(dbread[5]);
            }
            objConn.Close();


        }
        void iImg1(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img1.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void iImg2(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img2.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void iImg3(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img3.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void iImg4(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img4.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void iImg5(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img5.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void iImg6(object sender, EventArgs e)
        {
            imgval = new imgloader1(Img6.Src.ToString());
            showimg.ImageUrl = imgval.Imgurl.ToString();
        }
        void descr1()
        {
           vid = Convert .ToInt32 (Request .QueryString ["id"]);
            SqlConnection iConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand icmd = new SqlCommand("select * from Tbl_item  where item_id = @item_id ", iConn);

            icmd.Parameters.AddWithValue("item_id", vid);
            iConn.Open();
            SqlDataReader dbread = icmd.ExecuteReader();
            while (dbread.Read() == true)
            {
                a = Convert.ToString(dbread["itemphoto"]);
                b = Convert.ToString(dbread["descriptn"]);
            }
            iConn.Close();
            showimg.ImageUrl = a;

        }
    </script>
    
    <style  type ="text/css" >
    .oke { width :100%; height :160px; background-color :Scrollbar ;}
    .otun{ width :600px; height :550px; background-color :Maroon ;}
    .osi{ width :180px; margin-left :610px; margin-top :-551px; border-left : solid 1px #333; height :550px;}
   

</style>
    <link href="scrollable/css/buttons.css" rel="stylesheet" type="text/css" />
<script src="scrollable/script/jquery.tools.min.js"></script> 
<link rel="stylesheet" type="text/css" href="scrollable/css/scrollable.css" /> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
<div class ="oke"> 

<a class="prevPage  left"></a> 
<div class="scrollable">	
	<div class="items"> 
		<!-- 1-4--> 
		<img src="scrollable/images/img1.jpg" /> 
		<img src="scrollable/images/img2.jpg" /> 
		<img src="scrollable/images/img3.jpg" /> 
		<img src="scrollable/images/img4.jpg" /> 
		
		<!-- 5-8 --> 
		<img src="scrollable/images/img5.jpg" /> 
		<img src="scrollable/images/img6.jpg" /> 
		<img src="scrollable/images/img7.jpg" /> 
		<img src="scrollable/images/img8.jpg" /> 
		
		<!-- 9-12 --> 
		<img src="scrollable/images/img9.jpg" /> 
		<img src="scrollable/images/img10.jpg" /> 
		<img src="scrollable/images/img11.jpg" /> 
		<img src="scrollable/images/img12.jpg" /> 
	</div> 
</div> 
<a class="nextPage right"></a> 

<script> 
	$(function()  { $("div.scrollable").scrollable({size: 4}); });
</script> 

</div>
<div class ="otun">
    
  <table>
    <tr>
    <td colspan ="4">
    <asp:Image ID ="showimg" Height ="310px" Width ="300px" runat ="server" />
     </td><td colspan ="4">
     <%=b %>
      </td>
    </tr>
    <tr>
    <td>
    <table ><tr><td>
    <a id="a1" runat ="server" >
    <img id="Img1" style ="height :80px; width :80px;" runat ="server" />
    </a></td>
    <td><a id="a2" runat ="server" >
    <img id="Img2" style ="height :80px; width :80px;"  runat ="server" />
    </a></td>
    <td><a id="a3" runat ="server" >
    <img id="Img3" runat ="server"  style ="height :80px; width :80px;" />
    </a></td>
    <td><a id="a4" runat ="server" >
    <img id="Img4" style ="height :80px; width :80px;"  runat ="server" />
    </a></td>
    <td><a id="a5" runat ="server" >
    <img id="Img5" style ="height :80px; width :80px;" runat ="server" />
    </a></td>
    <td><a id="a6" runat ="server" >
    <img id="Img6" style ="height :80px; width :80px;" runat ="server" />
    </a>
    </td></tr></table>
    </td>
    </tr>
    </table>
  
  
</div>
 <div class ="osi">
  </div></div> 
</asp:Content>

