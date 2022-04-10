<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blinky.aspx.cs" Inherits="users_blinky" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type ="text/javascript" >
function blink(elId){
  var html = '';
  if(document.all){
    html += 'var bl = document.all.' + elId + ';';
  }
  else if(document.getElementById){
    html += 'var bl = document.getElementById("' + elId + '");';
  }
  html += 'bl.style.visibility = ' + 'bl.style.visibility == "hidden" ? "visible" : "hidden"';
  if(document.all || document.getElementById){
    setInterval(html, 100);
  }
}
function init(){
  blink('Text');
}
onload=init;
</script>

<div id="Text">
  <blink>
    Hello blinky!
  </blink>
</div>
    </div>
    </form>
</body>
</html>
