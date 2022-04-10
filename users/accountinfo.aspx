<%@ Page Language="C#" MasterPageFile="~/users/vpage.master" AutoEventWireup="true" CodeFile="accountinfo.aspx.cs" Inherits="accountinfo" Title="Nairatags.com" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../pagestyle.css" rel="stylesheet" type="text/css" />
<style type ="text/css" >
.toppa{ background : transparent url(../images/banner.png) repeat-x; height : 35px; width :102%; }
.toxx{ border :2px solid #efefef; height :320px; width :99%; font :12px tahoma #67686b; padding-left :10px; padding-right:10px ;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class ="maincot">

<div class="accinfos">
    <div class ="toppa"></div>
    <div class ="toxx">
    <br />
    <br />
    <p>
    Make our website your website<br />
    Open an account to advertise your goods on our website.<br /> Our website allows user display goods in various categories like clothing, Automotives and industry, jewelry, beauty, furniture and decor.
    We provide an option of delivery to your customer as an add value to our services.
    <br />
    <br />
    However, we provide our vendors with two type membership accounts; <br />
    
    Classic and Premium Sellers
    </p>
    <br />
    <br />
    
    <div>
     <div style =" margin-left:10px; width :350px;/* border :2px solid #000;*/ height :80px;font-size :11px; color :#084189;">
     <h4>Classic Sellers</h4><br />
     <ul>
     <li>Free registration.</li>
     <li>Instant goods display.</li>
     <li>Reliable Cash transfer on goods delivery.</li>
     <li>Listing 8% of the unit price of the item for a period of two months.</li>
     </ul>
     <br />
         <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl ="~/images/signup.png" /> 
     </div>
    <div style ="margin-left :390px; /* border : 2px solid #000;*/ width :320px; height :80px; margin-top :-82px; font-size :11px; color :#475f7d;"  >
        <h4 >Premium Sellers</h4>
        <ul>
        <li>Unique store display</li>
        <li>Unlimited items</li>
        <li>Sales Transaction log</li>
        <li>Blog Services</li>
        <li>List 100 items at the rate of N5000 for two months period.</li>
        
        </ul>
        <br />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl ="~/images/signup2.png"  />
    </div>
    </div>
    </div>
</div>

</div>



</asp:Content>

