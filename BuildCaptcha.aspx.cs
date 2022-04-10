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
using System.Drawing;
public partial class BuildCaptcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap objBMP = new Bitmap(150,26);


   Graphics objGraphics = Graphics.FromImage(objBMP);


    objGraphics.Clear(Color.SkyBlue);
  

      objGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.ClearTypeGridFit   ;

 //' Configure font to use for textComic Sans MS


    Font objFont = new Font("Century Schoolbook", 14, FontStyle.Regular    , GraphicsUnit.Pixel    );


   string randomStr = "";


   char[] myArray = new char[10];


 int x;


  //That is to create the random # and add it to our string


  Random autoRand = new Random();


   for (x = 0; x < 9; x++)


   {


   myArray[x] = System.Convert.ToChar(autoRand.Next(65,90));


   randomStr += (myArray[x].ToString());


   }


 


  //This is to add the string to session, to be compared later


  Session.Add("RandomStr", randomStr);


   


  //' Write out the text


   objGraphics.DrawString(randomStr, objFont, Brushes.DimGray  , 5, 3);


  


  //' Set the content type and return the image


   Response.ContentType = "image/GIF";


 objBMP.Save(Response.OutputStream, System .Drawing.Imaging .ImageFormat .Gif );


   objFont.Dispose();


   objGraphics.Dispose();


   objBMP.Dispose();

    }
}
