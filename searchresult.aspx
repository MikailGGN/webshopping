<%@ Page Language="C#" MasterPageFile="~/Page.master"  AutoEventWireup="true" CodeFile="searchresult.aspx.cs" Inherits="searchresult" Title=" nairatags.com | Buy and Sell Goods Online." %>

<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<meta name="description" content="Online Shopping Services.  
  Buy and Sell Goods Online | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell,buy online, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      competitive prices, premium service, quick Sales" />
    


<link href="pagestyle.css" rel="stylesheet" type="text/css" />
<style type ="text/css" >
    div.nv{width:860px; font :8pt Tahoma #b9d6dc ;  margin-left :0px;/* background :transparent url(images/banner.png) repeat-x; */ background-color :#efefef; height :28px; line-height :25px;}
div.nv ul {width:98%; list-style: none; }
div.nv li {display: inline; padding-right:30px;  height :10px;}
     .flot{ clear :both; }
     .retmt{ padding-left :20px;height: 18px;float: both ; }
     
     .txtfield1{
	border: 1px #9A9A9A solid;
	width: 170px;
	height: 20px;
	}      
        
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<div >
<table ><tr ><td>
<asp:DropDownList  id="Select1"  CssClass ="txtfield1" runat ="server"  >
      </asp:DropDownList>  
     <input id="Texts" type="text" style ="width : 300px; height :16px" runat ="server"  />&nbsp;<input id="Button1" type="image"  src="images/search.png" onserverclick ="btn_search"  runat ="server" align="top"sss />
</td><td></td></tr></table>
</div>--%>
<div style ="height :auto; background-color:White ; padding-left :20px; padding-right:20px; margin-left :50px;  " >

<asp:DataList id="ItemsList" 
           BorderColor="black"
           CellPadding="0"
           CellSpacing="10"
           RepeatDirection="Vertical"
           RepeatLayout="Table"
           RepeatColumns="5"
  
           runat="server">

         <HeaderStyle CssClass ="dhd">
         </HeaderStyle>

        

         <HeaderTemplate>

           
         </HeaderTemplate>
         <ItemStyle CssClass ="flot"></ItemStyle >

         <ItemTemplate>
         
         <br />
         <a href="searchresult.aspx?c=<%#DataBinder.Eval(Container.DataItem,"category_id")%>&id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>" >
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
         <a href="searchresult.aspx?id=<%#DataBinder.Eval(Container.DataItem,"item_id")%>#"  >
<asp:Image id="ProductImage"   Height ="180px" Width ="160px"
                 ImageUrl='<%# DataBinder.Eval(Container.DataItem, "itemphoto") %>'
                 runat="server"  /></a>
                 <br />
          <a href ="variance.aspx?uni=<%# DataBinder.Eval(Container.DataItem, "item") %>&Pli=<%# DataBinder.Eval(Container.DataItem, "s_category_id") %>">
           <%# DataBinder.Eval(Container.DataItem, "item") %> 
           </a>
            <br />
<a href ="variance.aspx?uni=<%# DataBinder.Eval(Container.DataItem, "item") %>&Pli=<%# DataBinder.Eval(Container.DataItem, "unitprice") %>">
             N <%# DataBinder.Eval(Container.DataItem, "unitprice","{0:0,000}") %>

</a> <br /></SelectedItemTemplate>  

      </asp:DataList>
<div class ="nv ">
<ul >
<li>
<a href="searchresult.aspx#this" 
ID="hrefFirst" onserverclick="ShowFirst" 
runat="server" style ="border :1px dotted #efefef; width: 18px;height: 18px;float: left ; background-image : url(images/Backward_over.gif); background-repeat :no-repeat ;  padding-right :20px; padding-top :5px"></a>
</li><li>
<a href="searchresult.aspx#this" 
ID="hrefPrevious"
onserverclick="ShowPrevious" 
runat="server" style ="border :1px dotted #efefef;width: 18px;height: 18px;float: left ; background-image : url(images/Backward.gif); background-repeat :no-repeat ;  padding-right  :20px;padding-top :5px"></a>
</li><li>
<a href="searchresult.aspx#this" 
ID="hrefNext"
onserverclick="ShowNext" class ="arr"
runat="server" style ="border :1px dotted #efefef; width: 18px;height: 18px;float: left ; background-image : url(images/Forward.gif); background-repeat :no-repeat ;  padding-left :20px;padding-top :5px;"></a>
</li><li>
<a href="searchresult.aspx#this" 
ID="hrefLast" onserverclick="ShowLast" 
runat="server" style =" border :1px dotted #efefef; display: inline   ;width: 18px;height: 18px;float: left ; background-image : url(images/Forward_over.gif); background-repeat :no-repeat ;  padding-left :20px;padding-top :5px"></a>
</li>
<li>
<a class ="retmt ">
<asp:label ID="lblStatus" Runat="server"  /> 
</a></li></ul></div>

<asp:label ID="intCurrIndex" Visible="False" Runat="server" />
<asp:label ID="intPageSize" Visible="False" Runat="server" />
<asp:label ID="intRecordCount" Visible="False" Runat="server" /> 
</div>
<br />
<br />
</asp:Content>

