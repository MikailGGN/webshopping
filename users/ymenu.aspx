<%--<table width="100%" border="0" cellpadding="0"  align="left" cellspacing="0" onMouseover="borderize_on(event)" onMouseout="borderize_off(event)">
<tr>
  <td class="menulines"><a href=""> </a></td>
</tr>
<tr>
  <td class="menulines"><a href= "mypage.aspx" >Blog Pages </a></td>
</tr>
<tr><td  class="menulines"><a href="#"> Chat Room </a> </td></tr>
<tr><td class="menulines"><a href= "#">Consumers Request </a> </td>
</tr>
<tr><td class="menulines"><a href="#">Quick Mail </a></td></tr>

</table>--%>
 
<style>
    .menulines
    {
       /* border: 1px solid #45557a;*/
        background-image: url(../images/info2.png); background-repeat :repeat-x;
        width: 100%;
        height: 15px;
        font-family: tahoma #3C617F;
        font-size: 12px;
        font-weight: bold;
        padding: 5px 8px;
    }
    .menulines a
    {
        text-decoration: none;
        color: #3C617F;
    }
     .menulines a:active, .menulines a:hover
    {
        text-decoration: blink;
        color: #3C617F;
       /* background-color :White ;*/
        width: 100%;
        height: 15px;
        padding: 5px 8px;
    }
    .menulines ul{ list-style :none;}
    .menulines ul li{ display : inline  ;}
    .menulines dd{ overflow :hidden ; position :absolute ; /*opacity:0;*/ display :none ;}
    .menulines dd ul{list-style :none;}
    .menulines dd ul li{display :block ;}
</style>

<script language="JavaScript1.2" type ="text/javascript" >

function borderize(what,color){
what.style.borderColor=color
}

function borderize_on(e){
if (document.all)
source3=event.srcElement
else if (document.getElementById)
source3=e.target
if (source3.className=="menulines"){
borderize(source3,"#45557a")
}
else{
while(source3.tagName!="TABLE"){
source3=document.getElementById? source3.parentNode : source3.parentElement
if (source3.className=="menulines")
borderize(source3,"#45557a")
}
}
}

function borderize_off(e){
if (document.all)
source4=event.srcElement
else if (document.getElementById)
source4=e.target
if (source4.className=="menulines")
borderize(source4,"#3C617F")
else{
while(source4.tagName!="TABLE"){
source4=document.getElementById? source4.parentNode : source4.parentElement
if (source4.className=="menulines")
borderize(source4,"#3C617F")
}
}
}

</script>
<%--<div>
        <ul >
       
          <li class="menulines"><a href="#"><span>Stock</span></a>
                <dd>
                  <ul>
                  <li><a href="initial.aspx"><span>Stock View </span></a></li>
                    <li><a href="productinfo.aspx" ><span> products</span></a>
                        <dd>
                          <ul>
                            <li><a href="mytransactions.aspx"><span> Transaction</span></a></li>
                            
                          </ul>
                        </dd>
                    </li>
                    <li><a href="mypage.aspx" ><span>Create page</span></a>
                        
                    </li>
                    
                   
                  </ul>
                </dd>
          </li>
          
          <li class="menulines" ><a href="#"><span>Logout</span></a></li>
         
          
        </ul>
      </div>--%>
      <div>
      <ul style ="list-style :none">
      <li class="menulines"><a href= "mypage.aspx" > <span>  Blog Pages </span></a></li>
<li  class="menulines"><a href="#"> <span> Chat Room </span></a> </li>
<li class="menulines"><a href= "#"> <span> Consumers Request </span></a> </li>
<li class="menulines"><a href="#"><span>Quick Mail </span></a></li>

      </ul></div>