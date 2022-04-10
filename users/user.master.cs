using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class users_user : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


         if (Session["roleid"] != null )
         {
             int roleid = (int)(Session["roleid"]);
             if (roleid == 3)
             {
                 lmenu.Style.Add(HtmlTextWriterStyle.Display, "none");
             }
             
         }
     
    }
}
