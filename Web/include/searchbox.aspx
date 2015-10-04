<% @ Page  language="c#"  Inherits="PageAdmin.searchbox" %>
function LoadSearchBox_<%=Id%>()
{
var SearchHtml="";
<asp:PlaceHolder id="P1" runat="server"  visible="false">
SearchHtml+="<p class='searchbox_item'><input  id='searchkey_<%=Id%>' type='text' class='searchbox_textbox'>";
SearchHtml+="<a href='javascript:searchbox_1_<%=Id%>()'><img alt='' align='absMiddle' border='0' src='<%=Tags_3%>'></a></p>";
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server"  visible="false">
SearchHtml+="<p class='searchbox_item'><input  id='searchkey_<%=Id%>' type='text' class='searchbox_textbox'>";
SearchHtml+="<a href='javascript:searchbox_2_<%=Id%>()'><img alt='' align='absMiddle' border='0' src='<%=Tags_3%>'></a></p>";
</asp:PlaceHolder>

<asp:PlaceHolder id="P3" runat="server"  visible="false">
SearchHtml+="<p class='searchbox_item'><input id='sboxradio1_<%=Id%>' name='sboxradio_<%=Id%>' type='radio'  checked><%=Tags_1%>&nbsp;&nbsp;<input  name='sboxradio_<%=Id%>' id='sboxradio2_<%=Id%>' type='radio' /><%=Tags_2%>&nbsp;&nbsp;</p>";
SearchHtml+="<p class='searchbox_item'><input   type='text'  id='searchkey_<%=Id%>' class='searchbox_textbox' >";
SearchHtml+="<a  href='javascript:searchbox_3_<%=Id%>()'><img alt='' align='absMiddle' border='0' src='<%=Tags_3%>'></a></p>";
</asp:PlaceHolder>
document.write("<div class='searchbox'>"+SearchHtml+"</div>");
}
LoadSearchBox_<%=Id%>();
function searchbox_1_<%=Id%>()
 {
  
  var Language="<%=P_Language%>";
  var Js1,Js2;
  if(Language=="en")
   {
      Js1="Please enter your search product name or type keywords!";
      Js2="Keyword must be greater than 2 characters!";
   }
  else
   {
      Js1="请输入要搜索的产品名称或型号关键字!";
      Js2="关键字必须大于2个字符!";
   }

  var Keycode=escape(document.getElementById("searchkey_<%=Id%>").value);
  var Target="<%=Target%>";
   if(Keycode=="")
    { 
     alert(Js1);
      document.getElementById("searchkey_<%=Id%>").focus();
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
       alert(Js2);
       document.getElementById("searchkey_<%=Id%>").focus();
       return;
      }
     else
     {
        if(Target==1)
          {
            window.open("/include/search.aspx?keycode="+Keycode+"&type=1&language="+Language, "search"); 
          }
        else
          {
            location.href="/include/search.aspx?keycode="+Keycode+"&type=1&language="+Language;
          }
     }
    }
 }

function searchbox_2_<%=Id%>()
 {

  var Language="<%=P_Language%>";
  var Js1,Js2;
  if(Language=="en")
   {
      Js1="Please enter your search to the title of the article or profile keyword!";
      Js2="Keyword must be greater than 2 characters!";
   }
  else
   {
      Js1="请输入要搜索的文章标题或简介关键字!";
      Js2="关键字必须大于2个字符!";
   }


  var Keycode=escape(document.getElementById("searchkey_<%=Id%>").value);
  var Target="<%=Target%>";
   if(Keycode=="")
    {
     alert(Js1);
      document.getElementById("searchkey_<%=Id%>").focus();
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
     alert(Js2);
      document.getElementById("searchkey_<%=Id%>").focus();
     return;
      }
     else
     {
       if(Target==1)
          {
            window.open("/include/search.aspx?keycode="+Keycode+"&type=2&language="+Language, "search"); 
          }
        else
          {
            location.href="/include/search.aspx?keycode="+Keycode+"&type=2&language="+Language;
          }
     }
    }
 }

function searchbox_3_<%=Id%>()
 {
   var Obj=document.getElementById("sboxradio1_<%=Id%>");
   if(Obj.checked)
    {
     searchbox_1_<%=Id%>();
    }
   else
    {
     searchbox_2_<%=Id%>();
    }
 }
function Trim(str) 
 { 
  var Astr=str.split('');
  var str1="";
  for(i=0;i<Astr.length;i++)
   {
    str1+=Astr[i].replace(" ","");
   }
  return str1;
 }


