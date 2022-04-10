using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_OnInit(object sender, EventArgs e)
    {

        Response.ClearHeaders();

        Response.AppendHeader("Cache-Control", "no-cache");// ''HTTP 1.1
        Response.AppendHeader("Cache-Control", "private");// '' HTTP 1.1
        Response.AppendHeader("Cache-Control", "no-store"); // '' HTTP 1.1
        Response.AppendHeader("Cache-Control", "must-revalidate"); //'' HTTP 1.1
        Response.AppendHeader("Cache-Control", "max-stale=0"); // '' HTTP 1.1 
        Response.AppendHeader("Cache-Control", "post-check=0"); // '' HTTP 1.1 
        Response.AppendHeader("Cache-Control", "pre-check=0"); // '' HTTP 1.1 
        Response.AppendHeader("Pragma", "no-cache"); // '' HTTP 1.1 
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
