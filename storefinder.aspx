<%@ Page Language="C#" MasterPageFile="~/Page.master" AutoEventWireup="true" CodeFile="storefinder.aspx.cs" Inherits="storefinder" Title="nairatags.com | Online Shopping Services. "  EnableEventValidation ="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="pagestyle.css" rel="stylesheet" type="text/css" />
    
     <style type="text/css">        
      .txtfield {
	border: 1px #9A9A9A solid;
	width: 230px;
	height: 16px;
 margin-left :0px;
}
.txtfield1{
	border: 2px #9A9A9A solid;
	width: 230px;
	height: 20px;
	} 
	.th
      {
      background:transparent url(images/banner.png) repeat-x;
        /*-color:#eef4fa;*/
        border-top:solid 1px #9dbbcc;
        border-bottom:solid 1px #9dbbcc;
      }
      .itemSeparator { border-right: 0.5px solid #ccc }
      .groupSeparator
      {
        height: 0.5px;
        background-color: #efefef;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >
<div class ="maincot">
<div class ="nbg">

<br />
<br />
<p style ="margin-left :4px">
If you choose to purchase your item from a particular store, the select option below helps you to navigate your store of choice.
  </p>
  <br />
  <br />
   <p style ="margin-left :4px">
   However, you can enter the product or a description in the search box to find a suitable deal.
   </p> 
   <br />
  <asp:DropDownList ID="DDLstore" runat="server" CssClass ="txtfield1" OnSelectedIndexChanged ="DDLstore_SelectedIndexChanged" AutoPostBack ="true" >
    </asp:DropDownList>
    <asp:HiddenField ID="Hidd1" runat="server" />
<br />
<br />
    <asp:TextBox ID="Textsearch" runat="server" CssClass ="txtfield" ></asp:TextBox>
        <asp:ImageButton  ID="Btnchk" runat="server" Text="checkout"  
        ImageUrl ="~/images/search.png" onclick="Btnchk_Click" />
        <br />
        <asp:Label ID="Message"
        ForeColor="Red"          
        runat="server"/>

</div>
<div class ="nbgx">
<div class ="mnbgx" >


    <p>
    Find your dealers and place an order. 
    
    </p>
    
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="tdealers" PageSize ="3"  >
    <Fields>
          <asp:NextPreviousPagerField ButtonType="Image"
            ShowFirstPageButton="true"
            ShowNextPageButton="false"
            ShowPreviousPageButton="false"
            FirstPageImageUrl="~/images/Backward.gif" />
          <asp:NumericPagerField ButtonCount="10" />
          <asp:NextPreviousPagerField ButtonType="Image"
            ShowLastPageButton="true"
            ShowNextPageButton="false"
            ShowPreviousPageButton="false"
            LastPageImageUrl="~/images/Forward.gif" />
        </Fields>

    </asp:DataPager>   
    
    <asp:ListView ID="tdealers" GroupItemCount="1" runat="server" OnItemCommand ="Item_Command"
   DataKeyNames ="item_id">
  
    
    <LayoutTemplate>
          <table cellpadding="2" width="640px" id="tbl1" runat="server">
            <tr>
              <th colspan="5">DEALERS LIST</th>
            </tr>
            <tr runat="server" id="groupPlaceholder"></tr>
          </table>
        </LayoutTemplate>
        <GroupTemplate>
          <tr runat="server" id="tr1">
            <td runat="server" id="itemPlaceholder"></td>
          </tr>
        </GroupTemplate>
        <GroupSeparatorTemplate>
          <tr id="Tr1" runat="server">
            <td colspan="5">
	            <div class="groupSeparator"><hr></div>
	          </td>
          </tr>
        </GroupSeparatorTemplate>
        <ItemTemplate>
          <td id="Td1" align="center" runat="server">
              <asp:CheckBox ID="CheckBox1" runat="server"   />
          </td><td>
          <b> <asp:Label ID="Labelv" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "vendor")%>'></asp:Label>
         </b><br />
           <%#DataBinder.Eval(Container.DataItem, "vendor_address")%>
           <br />
            <%#DataBinder.Eval(Container.DataItem, "vendor_city")%>
           <br />
        <a href =" mailto:'<%#DataBinder.Eval(Container.DataItem, "vendor_email")%>'"><%#DataBinder.Eval(Container.DataItem, "vendor_email")%></a>
           <br />
             </td><td>
            <asp:Image ID="ProductImage" runat="server"
              ImageUrl='<%# DataBinder.Eval(Container.DataItem, "itemphoto") %>' Width ="140px" Height ="140px" />
              <br />
              </td> <td>
            <b>Price: N</b> <%# Eval("unitprice", "{0:n}")%> <br />
            <asp:HyperLink ID="ProductLink" runat="server" 
              Text='<%# Eval("item") %>' 
              NavigateUrl='<%# "item-description.aspx?id=" + Eval("item_id") %>' />
             <br />
  <b>Available Quantity:</b> <%# Eval("in_stock")%> <br />
  <br />
 <asp:ImageButton ID="Button1" runat="server" CommandName ="AddToList" Text = "order" CommandArgument='<%#Eval("item")  %>' ImageUrl="~/images/buynow.png"  />


          </td>
        </ItemTemplate>
        <ItemSeparatorTemplate>
          <td id="Td2" class="itemSeparator" runat="server">&nbsp;</td>
        </ItemSeparatorTemplate>
        
    </asp:ListView>

</div>
</div>
</div>
</ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

