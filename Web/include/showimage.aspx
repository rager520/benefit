<% @ Page language="c#" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图片预览</title>
<LINK href="/css/style.css" type=text/css rel=stylesheet>
<script language="javascript">
function resizeImages() 
{ 
var areaImages = document.getElementById("newsContent").getElementsByTagName("img"); 
var areaImagesCount = areaImages.length; 
var w = 0; 
for(var i=0;i<areaImagesCount;i++) { 
if(areaImages[i].width>1000){ 
w = areaImages[i].width ; 
areaImages[i].width = 1000 ; 
} 
} 
} 

</script>
</head>
<body topmargin=0 leftmargin=0 onload="resizeImages()">
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center>
 <tr>
  <td height=20></td>
 </tr>
 <tr>
  <td height=1 bgcolor=#cccccc></td>
 </tr>
 <tr>
  <td height=5></td>
 </tr>
 <tr>
  <td align=center id="newsContent"><img src="<%=Request.QueryString["src"]%>" border=0></td>
 </tr>
 <tr>
  <td height=5></td>
 </tr>
 <tr>
  <td height=1 bgcolor=#cccccc></td>
 </tr>
 <tr>
  <td height=5></td>
 </tr>
 <tr>
  <td height=25 align=right><img src="/images/public/close.gif" border=0 onclick="window.close()" style="cursor:hand">&nbsp;&nbsp;</td>
 </tr>
 <tr>
  <td height=20></td>
 </tr>
</table> 
</body>
</html>