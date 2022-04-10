<%@ Page Language="C#" MasterPageFile="~/users/vpage.master" AutoEventWireup="true" CodeFile="recovery.aspx.cs" Inherits="users_recovery" Title="Untitled Page" %>
<%@ PreviousPageType VirtualPath ="~/users/login.aspx"  %>
<%@ Import Namespace ="System.Data" %>
<%@ Import  NameSpace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace ="System.Net.Mail" %>
<%@ Import Namespace ="System.Text" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type ="text/css" >
     .txtfield {
	border: 1px #9A9A9A solid;
	width: 210px;
	height: 16px; 

}
.lbl{  font : tahoma 8px #000;
       padding-left :20px;
    
      }
</style>
<link href="../pagestyle.css" rel="stylesheet" type="text/css" />
<script runat ="server" >

    String ps;
  

    protected void Page_Load(object sender, EventArgs e)
    {

        //Textuser.Text = PreviousPage.usertext;
        
        //if (Textuser != null)
        //{

        //}
    }
    void getemail()
    {


        SqlConnection vconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand vcom = new SqlCommand("select password from Tbl_user where email=@email ", vconn);
        vcom.Parameters.AddWithValue("@email", Textuser.Text);
        vconn.Open();
        SqlDataReader rd = vcom.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read() == true)
            {

                ps = Convert.ToString(rd["password"]);

            }
        }
        else
        {
            diverr.InnerHtml = "<p> Unknown credentials, contact the customer service for Help.</p>";
        }
        vconn.Close();


    }
   
        


    
    protected void Button1_Click(object sender, EventArgs e)
    {
        //getemail();
        //System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        //message.To.Add(Textuser.Text);
        //message.Subject = "Your Password";
        //message.From = new System.Net.Mail.MailAddress("customerservice@nairatags.com");
        //message.Body = "Hello " + "\n" + " " +
        //    " " + "ps" + "\n\n" + "Thank you";
        //message.IsBodyHtml = true;

        //System.Net.Mail.SmtpClient smtp = new SmtpClient("mail.nairatags.com");
        //smtp.Credentials = new System .Net .NetworkCredential ("customerservice", "adisa01");
        //smtp.EnableSsl = true;
        //smtp.Send(message);
        //if (smtp = DeliveryNotificationOptions.OnSuccess)
        //{

        //    MessageBox .Show ("Your mail has been delivered");
        //}
        //else
        //{
        //    MessageBox.Show("Your mail is still pending ");

        //}
  
       //create the mail message 
        MailMessage mail = new MailMessage(); 
 
        //set the addresses 
        mail.From = new MailAddress("customercare@nairatags.com"); 
        mail.To.Add("mhkgasby@yahoo.com"); 
        
        //set the content 
        mail.Subject = "This is an email"; 
        mail.Body = "This is from system.net.mail using C sharp with smtp authentication."; 
        //send the message 
         SmtpClient smtp = new SmtpClient("mail.nairatags.com"); 
          
         NetworkCredential Credentials = new NetworkCredential("customercare@nairatags.com", "adisa01"); 
         smtp.Credentials = Credentials;
         smtp.Send(mail); 
         lblMessage.Text = "Mail Sent"; 
    
    }
</script>
<%--<link href ="../mainstyle.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style =" margin-top :100px; margin-left :200px; padding-top :10px; border : solid 1.5px #efefef; height :120px; width :600px; background : url(../images/glass.png) repeat-x;">
 
<center >
<table><tr><td align ="right" >
  <label class ="lbl"  > Email :</label></td><td> <asp:TextBox ID="Textuser" runat="server" CssClass ="txtfield "></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="Textuser" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
  </td></tr> 
   <tr><td> 
      </td><td align ="right" >click send to get your password  <asp:Button ID="Button1" runat="server" Text="Send" 
               onclick="Button1_Click" /></td></tr>
               <tr><td >
                   <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                   <asp:HiddenField ID="HidField" runat="server" />
               </td><td></td></tr>
               </table>
               <div id ="diverr" runat ="server" ></div>
    </center>
</div>

</asp:Content>

