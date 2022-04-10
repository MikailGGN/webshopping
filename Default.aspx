<%@ Page Language="C#" CodeFile ="~/Default.aspx.cs" Inherits ="_Default"  %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Web.UI" %>
<%@ Register TagPrefix ="simg" Namespace ="System.Data.SqlClient" %>
<%@ Register TagPrefix="si" TagName="scrollimage"  Src="~/scroll.ascx"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat ="server" lang ="en-us"  >
    <title>
  nairatags.com | Online Shopping Services. 
</title>
<meta name="description" content="Online Shopping Services.  
      | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      low prices, premium service, quick Sales" />
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
 
 <link rel="stylesheet" type="text/css" href="cotentslider/jslider.css" />

<script type="text/javascript" src="cotentslider/jslider.js">

</script>
  <script runat="server" >
      void btn_search(object sender, EventArgs e)
      {

          SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
          SqlCommand scom = new SqlCommand("select * from Tbl_item  WHERE (item like '%" + this.Texts.Value + "%') and category_id =@category_id ", sconn);

          scom.Parameters.AddWithValue("@category_id", Select1.SelectedItem .Value );
          sconn.Open();
          SqlDataAdapter objAdapter = new SqlDataAdapter(scom);
          DataSet objDataSet = new DataSet();
          objAdapter.Fill(objDataSet);
          Session["abc"] = objDataSet;

          Response.Redirect("~/searchresult.aspx");


      }
  </script>  
    <style type ="text/css" >
        .hd
{width:220px; background-image : url(images/signin.png); background-repeat :no-repeat ; height :30px;  }
     .txtfield {
	border: 1px #9A9A9A solid;
	width: 150px;
	height: 16px;
 margin-left :0px;
}
.txtfield1{
	border: 1px #9A9A9A solid;
	width: 170px;
	height: 20px;
	}
.pop{ display: block;
	width: 10px;
	height: 10px; float :left ;
	cursor: pointer;
           background: url(images/homemade.jpg) no-repeat; background-position :center ;  clear: none ;
           }
    </style>
    <link href="pagestyle.css" rel="stylesheet" type="text/css" />
    <link href="flyout/flyout.css" rel="stylesheet" type="text/css" />
    <script src="flyout/flyout.js" type="text/javascript">

</script>

  <%-- <meta http-equiv="expires" content="-1"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/> 
   --%>
   
  <%-- <script language="JavaScript" type="text/javascript">
window.history.forward(0);
</script>--%>
</head>
<body class="body">
 
    <form id="form1" runat="server">
<div style =" margin-left :10%; margin-top :0px; height :933px; background-color :transparent ; width :1000px" >
<div class ="itop" >
<div class ="navi"><ul ><li><a href ="Default.aspx" >HOME</a></li><li><a href ="searchresult.aspx"> DEALS  </a> </li><li><a href ="selling.htm">SELL </a></li><li><a href ="storefinder.aspx"> STORE FINDER </a></li><li><a href="users/login.aspx">MY ACCOUNT </a></li></ul></div>
<div class ="holdlogo" >
    <img src="images/logo.png" />
</div>
<div class ="sbox ">
<dl style ="padding-top:10px; padding-left : 5px; margin-left :30px">
<asp:DropDownList  id="Select1"  CssClass ="txtfield1" runat ="server"  >
      </asp:DropDownList>  
     <input id="Texts" type="text" style ="width : 300px; height :16px" runat ="server"  />&nbsp;<input id="Button1"  type="image"  src="images/search.png" onserverclick ="btn_search"  runat ="server" align="top" />&nbsp;<br /></dl></div>
</div>
<div class ="homidi" >
<div class ="lefthd">
<!-- #INCLUDE FILE="cotentslider/paging.htm" -->
   </div> <div  class ="righthd ">
    <div style ="padding :15px 10px 5px 10px">
    <marquee width="80%" height="90%" DIRECTION="down" SCROLLDELAY="700" >
 "This post confirms my
ownership of the site and that this site adheres to Google AdSense
program policies and Terms and Conditions: ca-pub-0109300035263982"
</marquee>
    
    </div>

  </div>
<%-- /*<dt style =" padding-top :20px; padding-left :150px;"> <img src ="images/e-shopping.png" alt="e-shop"   /></dt>--%>
 </div>
<div class ="maincot"> 
<div class ="mbg ">
    <div>
    <dl class="dropdown">
   <dt ><a  href ="itemsgallery.aspx"> All Categories</a></dt>
    
    </dl>
    <dl class="dropdown">
    <dt id="one-ddheader" class="upperdd" onmouseover="ddMenu('one',1)" onmouseout="ddMenu('one',-1)" ><a  href ="itemsgallery.aspx?c=1" > Automotive and Industry</a></dt>
    <dd id="one-ddcontent" onmouseover="cancelHide('one')" onmouseout="ddMenu('one',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=1&sc=1" class="underline">Parts & Accessories</a></li>
        <li><a href="itemsgallery.aspx?c=1&sc=2" class="underline">Cars & Trucks</a></li>
        <li><a href="itemsgallery.aspx?c=1&sc=3" class="underline">Motorcycles</a></li>
      </ul>
    </dd>
  </dl>
   <dl class="dropdown">
    <dt id="two-ddheader" class="upperdd" onmouseover="ddMenu('two',1)" onmouseout="ddMenu('two',-1)"><a  href ="itemsgallery.aspx?c=2" > Beauty</a> </dt>
    <dd id="two-ddcontent" onmouseover="cancelHide('two')" onmouseout="ddMenu('two',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=2&sc=4" class="underline">Bath & Body</a></li>
        <li><a href="itemsgallery.aspx?c=2&sc=5" class="underline">Diet & Nutrition</a></li>
        <li><a href="itemsgallery.aspx?c=2&sc=6" class="underline">Fagrances</a></li>
        <li><a href="itemsgallery.aspx?c=2&sc=7" class="underline">Make Up</a></li>
     
      </ul>
    </dd>
  </dl>
   <dl class="dropdown">
    <dt id="three-ddheader" class="upperdd" onmouseover="ddMenu('three',1)" onmouseout="ddMenu('three',-1)"><a  href ="itemsgallery.aspx?c=3" > Clothing</a> </dt>
    <dd id="three-ddcontent" onmouseover="cancelHide('three')" onmouseout="ddMenu('three',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=3&sc=8" class="underline">Men's Clothing</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=9" class="underline">Men's Shoes</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=10" class="underline">Men's Accessories</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=11" class="underline">Women's Clothing</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=12" class="underline">Women's Handbags</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=13" class="underline">Women's Shoes</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=14" class="underline">Fabrics</a></li>
        <li><a href="itemsgallery.aspx?c=3&sc=15" class="underline">Babies</a></li>
      </ul>
    </dd>
  </dl>
  <dl class="dropdown">
    <dt id="four-ddheader" class="upperdd" onmouseover="ddMenu('four',1)" onmouseout="ddMenu('four',-1)"><a  href ="itemsgallery.aspx?c=4" >Jewelry</a> </dt>
    <dd id="four-ddcontent" onmouseover="cancelHide('four')" onmouseout="ddMenu('four',-1)">
      <ul>
        
        <li><a href="itemsgallery.aspx?c=4&sc=16" class="underline">Necklace</a></li>
        <li><a href="itemsgallery.aspx?c=4&sc=17" class="underline">Men's Wristwatches</a></li>
        <li><a href="itemsgallery.aspx?c=4&sc=18" class="underline">Women's Wristwatches</a></li>
        <li><a href="itemsgallery.aspx?c=4&sc=19" class="underline">Rings & Bracelets</a></li>
      </ul>
    </dd>
  </dl>
 
  <dl class="dropdown">
    <dt id="five-ddheader" class="upperdd" onmouseover="ddMenu('five',1)" onmouseout="ddMenu('five',-1)"><a  href ="itemsgallery.aspx?c=5" > Furniture  and Decor </a> </dt>
    <dd id="five-ddcontent" onmouseover="cancelHide('five')" onmouseout="ddMenu('five',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=5&sc=20" >Office</a></li>
        <li><a href="itemsgallery.aspx?c=5&sc=21">Bedroom</a></li>
      </ul>
    </dd>
  </dl>
   <dl class="dropdown">
    <dt id="six-ddheader" class="upperdd" onmouseover="ddMenu('six',1)" onmouseout="ddMenu('six',-1)"><a  href ="itemsgallery.aspx?c=6" > Electronics and Accessories </a> </dt>
    <dd id="six-ddcontent" onmouseover="cancelHide('six')" onmouseout="ddMenu('six',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=6&sc=22" >Ipods & MP3 Player</a></li>
        <li><a href="itemsgallery.aspx?c=6&sc=23">TV & Video </a></li>
        <li><a href="itemsgallery.aspx?c=6&sc=24">GPS </a></li>
        <li><a href="itemsgallery.aspx?c=6&sc=25">Portable Video </a></li>
        <li><a href="itemsgallery.aspx?c=6&sc=26">Home Theatre </a></li>
        
      </ul>
    </dd>
  </dl>
  <dl class="dropdown">
    <dt id="seven-ddheader" class="upperdd" onmouseover="ddMenu('seven',1)" onmouseout="ddMenu('seven',-1)"><a  href ="itemsgallery.aspx?c=8" > Books </a> </dt>
    <dd id="seven-ddcontent" onmouseover="cancelHide('seven')" onmouseout="ddMenu('seven',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=8&sc=27" >Children Books</a></li>
        <li><a href="itemsgallery.aspx?c=8&sc=28">Fiction </a></li>
        <li><a href="itemsgallery.aspx?c=8&sc=29">Non Fiction</a></li>
        <li><a href="itemsgallery.aspx?c=8&sc=30">Magazines </a></li>
        
        
      </ul>
    </dd>
  </dl>
  <dl class="dropdown">
    <dt id="eight-ddheader" onmouseover="ddMenu('eight',1)" onmouseout="ddMenu('eight',-1)"><a  href ="itemsgallery.aspx?c=9" > Computer and Accessories </a> </dt>
    <dd id="eight-ddcontent" onmouseover="cancelHide('eight')" onmouseout="ddMenu('eight',-1)">
      <ul>
        <li><a href="itemsgallery.aspx?c=9&sc=31" >Desktops</a></li>
        <li><a href="itemsgallery.aspx?c=9&sc=32">Notebooks</a></li>
        <li><a href="itemsgallery.aspx?c=9&sc=33">Tablets</a></li>
        <li><a href="itemsgallery.aspx?c=9&sc=34">Scanners & Printers </a></li>
         <li><a href="itemsgallery.aspx?c=9&sc=35">Software </a></li>
        
      </ul>
    </dd>
  </dl>
    </div>
</div>
<div class ="mnbg">
<br />

&nbsp;&nbsp; 
<%--<asp:DropDownList  id="Select1"  CssClass ="txtfield1" runat ="server"  >
      </asp:DropDownList>  
     <input id="Texts" type="text" style ="width : 300px; height :16px" runat ="server"  />&nbsp;<input id="Button1"  type="image"  src="images/search.png" onserverclick ="btn_search"  runat ="server" align="top" />&nbsp;<br />--%>
    <br />

<div class ="mnbg2 ">
<p style=" padding-top :15px;padding-left :10px;">Transparent means of buying and selling items online. <br />
Users can list their for sale item(s), buy or shop for their needs with ease.
<br /><b><a>More..</a></b></p>

</div>
<div class ="mnbg3 " >

<p style ="padding-top :15px; padding-left :10px;">We accept payment with interswitch debit cards, users can verify payments and items purchased. </p>

</div>
<div class ="mnbg4 " >
<p style ="padding-top :15px; padding-left :10px;">
Interact freely with your buyer or seller. Learn more about the services available, in order to make the best deals. <br />
</p>
</div>

<div class ="rt"> 

 <br />
  <%--    <table  width ="223px" cellpadding ="0" cellspacing ="2px" >
<tr><td colspan ="2">
     <div class ="hd" ></div>
</td> </tr> 
<tr><td>Email</td><td>
 <input id="Textuser" type="text" runat ="server"  class ="txtfield"  size="23" />
</td></tr>
<tr><td>Password</td><td>
    <input id="Textpass" type="password" runat ="server"  class ="txtfield"  size="23" />
  </td></tr>
  <tr>
  <td colspan ="2">
  <asp:Button ID="Button2" runat="server" Text="Login" onclick="Button2_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<a href ="users/recovery.aspx">Forgot Password </a> 
      
  </td>
  </tr> 
 </table>
    <br />
    <asp:HiddenField ID="HidField" runat="server" />--%>
  
<br />
    <br />
    <br />
    
    <dt class="rtwing">
 <a  href="users/accountinfo.aspx" style ="text-decoration :none; display:block ;width: 18px;height: 18px;float: left ; background-image : url(images/techbtn.png); background-repeat :no-repeat ;  padding-left :30px; padding-top :5px; color :#058;">&nbsp;Register&nbsp;/&nbsp;Join</a>
<br /><br />
<a href="users/login.aspx" style =" text-decoration :none; display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/key.png); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;Sign&nbsp;in</a>
<br /><br />
<a href ="#" style =" text-decoration :none; display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/iconforum.png); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;Discussion&nbsp;Forum</a>
<br /><br />
<a href="selling.htm" style="text-decoration :none;display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/seller.png); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;How&nbsp;to&nbsp;Sell</a>
<br /><br />
<a href="Feedback.aspx"  style ="text-decoration :none;display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/mail.png); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;Feedback</a>
<br /><br />
<a href="itemrequest.aspx"  style =" text-decoration :none; display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/cartt.gif); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;Request&nbsp;for&nbsp;an&nbsp;item</a>
<br /><br />
<a href ="#" style ="text-decoration :none;display: block  ;width: 18px;height: 18px;float: left ; background-image : url(images/mail.png); background-repeat :no-repeat ;  padding-left :30px;padding-top :5px;color :#058;" >&nbsp;Customer&nbsp;Support</a>
    
        </dt>
    <asp:HiddenField ID="HidField2" runat="server" />

</div>
</div>
<div class ="unfil">

<si:scrollimage  ID ="st1" runat ="server" />
</div>
</div>
 <div class ="bt">
    <hr style ="padding-left :10px;font-size:0.2px; line-height :0.3px; height :0.3px ; color :#efefef; background-color :#efefef;width :940px; padding-right :10px;" />

<table  style =" margin-left :350px;">
<tr><td>
<ul style =" padding-top :10px;display :block">

<li><a>Users&nbsp;Safety</a></li>
<li><a href="users/accountinfo.aspx">Registrations</a></li>
<li><a href ="terms.htm" >Terms</a></li>
<li><a>Wish&nbsp;List</a></li>
<li></li>
</ul> </td><td >
<ul style =" padding-top :10px;display :block">

<li><a href ="searchresult.aspx" >Deal&nbsp;Finder</a></li>
<li><a href ="storefinder.aspx">Store&nbsp;Finder</a></li>
<li><a href ="sellerandcomments.aspx" >Blog</a></li>
<li><a href ="contact.aspx" >Contact&nbsp;Us</a></li>
<li></li>
</ul>
</td>
<td>


<dt >

<a href ="#" style =" text-decoration :none; display: block  ;width: 5px;height: 18px;float:left; background-image : url(images/twitter.png); background-repeat :no-repeat ;  padding-left :10px;padding-top :5px;color :#058; padding-bottom :20px;"> </a>

<a href ="#" style =" text-decoration :none; display: block  ;width: 5px;height: 18px;float:left ; background-image : url(images/facebook.png); background-repeat :no-repeat ;  padding-left :2px;padding-top :5px;color :#058; ">&nbsp;</a>
</dt> 
</td></tr>
</table>
<hr style ="padding-left :10px;font-size:0.2px; line-height :0.3px; height :0.3px ; color :#efefef; width :940px; padding-right :10px; background-color :#efefef;"  />
&nbsp;&nbsp;&nbsp;&nbsp;&copy <script type="text/javascript">document.write((new Date()).getFullYear());</script> A3MG Enterprises
</div>


</div>

</form>

</body>
</html>
