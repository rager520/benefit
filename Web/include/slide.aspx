<% @ Page  language="c#" Inherits="PageAdmin.slide" %>
var Image=new Array();
var Pics="<%=Pics%>";
var Links="<%=Links%>";
var Titles="<%=Titles%>";
var Alts="<%=Alts%>";
var Apic<%=CurrentId%>=Pics.split('|');
var ALink<%=CurrentId%>=Links.split('|');
var ATitle<%=CurrentId%>=Titles.split('|');
var AAlts<%=CurrentId%>=Alts.split('|');
var text_height=<%=Text_Height%>;
var Total_Item=Apic<%=CurrentId%>.length;
var SlideHtml;
for(i=0;i<Total_Item;i++)
  {
   Image.src = Apic<%=CurrentId%>[i]; 
  }

<asp:PlaceHolder id="P1" runat="server" Visible="false">
function LoadSlideBox_<%=CurrentId%>()
{
var text_mtop = 0;
var text_lm = 0;
var textmargin = text_mtop+"|"+text_lm;
var textcolor = "0x000000|0xff0000";
var text_align= 'center'; 
var text_size = 12;
var Border_Alpha;
if(<%=Border_Width%>=="0")
 {
  Border_Alpha=0;
 }
else
 {
  Border_Alpha=100;
 }
var borderStyle="<%=Border_Width%>|<%=Border_Color%>|"+Border_Alpha;

var interval_time=2;
var focus_width=<%=Width%>;
var focus_height=<%=Height%>;
var text_height=<%=Text_Height%>;
var swf_height = focus_height+text_height+text_mtop; 
var text_align="center";
Links=escape(Links);
SlideHtml='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">';
SlideHtml+='<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="/include/focus/focus.swf"> <param name="quality" value="high"><param name="bgcolor" value="#ffffff">';
SlideHtml+='<param name="menu" value="false"><param name=wmode value="transparent">';
SlideHtml+='<param name="FlashVars" value="pics='+Pics+'&links='+Links+'&texts='+Titles+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+interval_time+'">';
SlideHtml+='<embed src="/include/focus/focus.swf"  wmode="transparent"  FlashVars="pics='+Pics+'&links='+Links+'&texts='+Titles+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+interval_time+'" menu="false" bgcolor="#ffffff" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
SlideHtml+='</object>';
document.write("<div  class='slide_box'>"+SlideHtml+"</div>");
}
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server" Visible="false">
 var speed_<%=CurrentId%>=3500;
 var slide_currentitem_<%=CurrentId%>=0; 
 var Title="",Link="";
 var slide_Time_<%=CurrentId%>;
function LoadSlideBox_<%=CurrentId%>()
{
SlideHtml='<a href="#" id="slide_link_<%=CurrentId%>" target="<%=Target%>"><img class="slide_image" style="display:block;filter:revealTrans(duration=1,transition=20);display:none;border:<%=Border_Width%>px solid <%=Border_Color%>;width:<%=Width%>px;height:<%=Height%>px"  name="slide_pic_<%=CurrentId%>" id="slide_pic_<%=CurrentId%>"></a>';
SlideHtml+='<ul  class="slide_item" style="display:<%=Show_Slide_Num%>">';
for(i=0;i<Total_Item;i++)
  {
    SlideHtml+='<li id="slide_num_<%=CurrentId%>_'+i+'" onclick="Change_Num_<%=CurrentId%>('+i+')">'+(i+1)+'</li>';
  }
SlideHtml+='</ul>';
document.write("<div id='slide_box_<%=CurrentId%>' class='slide_box' style='width:<%=Width%>px;height:<%=Height%>px'>"+SlideHtml+"</div><div style='width:<%=Width%>px;text-align:center;display:none' id='slide_title_<%=CurrentId%>'></div>");
document.images["slide_pic_<%=CurrentId%>"].src=Apic<%=CurrentId%>[0];
document.images["slide_pic_<%=CurrentId%>"].style.display="inline";


Title="<a href='"+ALink<%=CurrentId%>[0]+"' class='slide_title' target='<%=Target%>' title=\""+AAlts<%=CurrentId%>[0]+"\">"+ATitle<%=CurrentId%>[0]+"</a>";
document.getElementById("slide_link_<%=CurrentId%>").href=ALink<%=CurrentId%>[0];
if(text_height!="0")
 {
  document.getElementById("slide_title_<%=CurrentId%>").style.display="";
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;
 }


document.getElementById("slide_num_<%=CurrentId%>_0").className="current";
slide_Time_<%=CurrentId%>=setInterval(nextAd_<%=CurrentId%>,speed_<%=CurrentId%>);
document.getElementById("slide_box_<%=CurrentId%>").onmouseover=function() {clearInterval(slide_Time_<%=CurrentId%>)}
document.getElementById("slide_box_<%=CurrentId%>").onmouseout=function() {slide_Time_<%=CurrentId%>=setInterval(nextAd_<%=CurrentId%>,speed_<%=CurrentId%>)}

}

function setTransition_<%=CurrentId%>()
{
  if (document.all)
   {
     document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.Transition=23;
     document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.apply();
   }
}


function playTransition_<%=CurrentId%>()
{
  if(document.all)
  document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.play()
}


function Control_Num_<%=CurrentId%>(Currentnum)
 {
  for(i=0;i<Apic<%=CurrentId%>.length;i++)
  {
   document.getElementById("slide_num_<%=CurrentId%>_"+i).className="";
  }
  document.getElementById("slide_num_<%=CurrentId%>_"+Currentnum).className="current";
 }

function Change_Num_<%=CurrentId%>(Currentnum)
 {
  for(i=0;i<Total_Item;i++)
  {
   document.getElementById("slide_num_<%=CurrentId%>_"+i).className="";
  }
  document.getElementById("slide_num_<%=CurrentId%>_"+Currentnum).className="current";
  slide_currentitem_<%=CurrentId%>=Currentnum;
  ShowFocus_<%=CurrentId%>(Currentnum);
 }

function nextAd_<%=CurrentId%>()
{
  if(Apic<%=CurrentId%>.length<=1)
   {
     clearInterval(slide_Time_<%=CurrentId%>);
     return;
   }

  if(slide_currentitem_<%=CurrentId%><Apic<%=CurrentId%>.length-1)
    {
      slide_currentitem_<%=CurrentId%>++;
    }
  else 
   {
     slide_currentitem_<%=CurrentId%>=0;
   }
 ShowFocus_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>);
}


function ShowFocus_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>)
 {
  if(ATitle<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
   {
     if(ALink<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
      {
       Title="<a href='"+ALink<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]+"' class='slide_title' target='<%=Target%>' title=\""+AAlts<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]+"\">"+ATitle<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]+"</a>";
      }
     else
      {
       Title=ATitle<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]; 
      }
   }
  else
   {
       Title=""; 
   }

  if(ALink<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
   {
      Link=ALink<%=CurrentId%>[slide_currentitem_<%=CurrentId%>];
   }
  else
   {
      Link="#";
   }

  document.getElementById("slide_link_<%=CurrentId%>").href=Link;
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;

  setTransition_<%=CurrentId%>();
  document.images["slide_pic_<%=CurrentId%>"].src=Apic<%=CurrentId%>[slide_currentitem_<%=CurrentId%>];
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;
  playTransition_<%=CurrentId%>();
  Control_Num_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>);
 }
</asp:PlaceHolder>
LoadSlideBox_<%=CurrentId%>();