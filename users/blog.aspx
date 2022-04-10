<%@ Page Language="C#" MasterPageFile="~/users/vpage.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="users_blog" Title="Untitled Page" %>
<%@ Import Namespace ="System.Data"%>
<%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script runat ="server" >
    int a;
    String title, desc, bodi;
    protected void Page_Load(object sender, EventArgs e)
    {
        sel_pge();
        alltopics();
    }
    void alltopics() {
    
    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

       String  query   = "select * from Tbl_pageinfo";
        
       SqlCommand Cmd = new SqlCommand(query, myConn);
        myConn.Open();
        SqlDataReader dbread;  
            
        dbread = Cmd.ExecuteReader();
            
            
        Tconts.DataSource = dbread;
        Tconts.DataBind();
        dbread.Close();
        myConn.Close();
    }
    void sel_pge() {
        
 SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand("select * from Tbl_pageinfo where pageid= @pageid", conn);
            
        if (Request.QueryString["article"] != null)
        {
            a = Convert.ToInt32(Request.QueryString["article"]);
            HidField1.Value = Convert.ToString(Request.QueryString["article"]);

           
            cmd.Parameters.AddWithValue("@pageid", a);
            conn.Open();

            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {

                while (rd.Read() == true)
                {
                    title = Convert.ToString(rd["pagename"]);
                    desc = Convert.ToString(rd["pagedesc"]);
                    bodi = Convert.ToString(rd["pagedata"]);

                }
            }

            conn.Close();
        }
        else {
            a = 2;



            cmd.Parameters.AddWithValue("@pageid", 2);
            conn.Open();

            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {

                while (rd.Read() == true)
                {
                    title = Convert.ToString(rd["pagename"]);
                    desc = Convert.ToString(rd["pagedesc"]);
                    bodi = Convert.ToString(rd["pagedata"]);

                }
            }

            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("insert into  Tbl_comment ( name, email, comment, pageid) values (@name,@email,@comment,@pageid)" , conn);

        cmd.Parameters.AddWithValue("@name", Textname.Text);
        cmd .Parameters .AddWithValue ("@email", Textemail .Text);
        cmd.Parameters.AddWithValue("@comment", Textcomment.Text);
        cmd.Parameters .AddWithValue ("@pageid",Convert .ToInt32 (HidField1 .Value ));

        conn.Open();

        if (cmd.ExecuteNonQuery() > 0)
        {
            Textemail.Text = "";
            Textname.Text = "";
            Textcomment.Text = "";
        }
        conn.Close();
    }
    </script>
 
 <meta name="description" content="Online Shopping Services.  
      | Clothing, Electronics, Jewelry, Beauty, Books, computers, Automotive, Furniture," />
<meta name="keywords" content="sell, online sales, purchase, online shopping, e-commerce in Nigeria
      cheap rate, exchange, goods,for sale, 
      request, buy online, trade, find, interswitch, 
      low prices, premium service, quick Sales" />
      
    <link href="../pagestyle.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../images/favicon.ico" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
<h3><%=title %></h3>
</div>


<div  class ="blogdoc ">
<h5>  <%=desc %></h5>
<br /><br />
<p>
<%=bodi %>
</p>
</div>

<div class ="blogtopic">
  <asp:Repeater ID="Tconts" runat="server" >
                    <HeaderTemplate >
                        <table  cellspacing="0" cellpadding="2" width="190px">
                            <tr bgcolor="#efefef">
                                <th align ="left" style ="padding :5px 8px 5px 0px; color :#45557a; " >
                                 &nbsp;Featured Topic(s) 
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <AlternatingItemTemplate>
                        <tr bgcolor="#fefefe" >
                            <td>
                                <a style ="color :#66b3d6; padding-bottom :3px;" href ="blog.aspx?article=<%#DataBinder.Eval(Container.DataItem,"pageid")%>">
                                <%#DataBinder.Eval(Container.DataItem, "pagename")%></a></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate >
                        <tr bgcolor="#fefefe">
                            <td>
                                <a  style ="color :#66b3d6; line-height :18px" href ="blog.aspx?article=<%#DataBinder.Eval(Container.DataItem,"pageid")%>">
                                <%#DataBinder.Eval(Container.DataItem, "pagename")%> </a>&nbsp;</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate >
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
</div> 
<div>
<ul class ="blogcomm">
<% 
    if (Request.QueryString["article"] != null)
    {
        HidField1.Value = Convert.ToString(Request.QueryString["article"]);
    }
    else {
   HidField1.Value = Convert .ToString (2);
    }
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        String query = "select Top(6) * from Tbl_comment where pageid =@pageid";

        SqlCommand Cmd = new SqlCommand(query, myConn);
        Cmd.Parameters.AddWithValue("@pageid", Convert.ToInt32(HidField1.Value));
        myConn.Open();
        SqlDataReader dbread;

        dbread = Cmd.ExecuteReader();
        while (dbread.Read() == true)
        {
%>

<li> <%= dbread["comment"]%> <br /> <pre><%=dbread ["name"] %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= dbread["email"] %> </pre></li>

 <% 
    }

        dbread.Close();
        myConn.Close();
    
     %>
</ul>
<br /> <br /> <br />

<table style ="margin-left :20px">
<tr><td colspan ="2"> <div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="www.nairatags.com/users/blog.aspx" send="true" width="450" show_faces="true" font="tahoma"></fb:like>
<br />
<a href="http://twitter.com/share" class="twitter-share-button" data-count="none" data-via="Mikhail54">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>



</td></tr>
<tr>
<td colspan ="2"> <h5>Add Comment</h5></td>
</tr>
<tr>
<td>Name:</td><td><asp:TextBox ID="Textname" runat="server" Width ="250px"></asp:TextBox> </td>
</tr>
<tr>
<td>Email:</td><td><asp:TextBox ID="Textemail" runat="server" Width ="250px"></asp:TextBox> </td>
</tr>
<tr>
<td>Comment:</td><td><asp:TextBox ID="Textcomment" runat="server" Rows ="4" TextMode ="MultiLine" Width ="250px"></asp:TextBox> </td>
</tr>
<tr>
<td>
    <asp:HiddenField ID="HidField1" runat="server" />
</td><td>
    <asp:Button ID="Button1" runat="server" Text="Send" onclick="Button1_Click" /></td></tr>
</table>
</div>

<%--
hanging div
<div style="position:absolute; 
 left:100px;
 top:100px; 
 width:100px;
 height:100px;
 background-color:#ffffff;
 overflow:auto;">
 <%=bodi %>
 </div>--%> 

</asp:Content>

