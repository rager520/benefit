﻿<% @ Page Language="C#" Inherits="PageAdmin.lanmu_template_introduct" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义内容模块设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">内容设置</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">自定义样式</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前模块</b>：<%=Request.QueryString["lanmu1"]%> &gt; <%=Request.QueryString["template"]%></td>
 </tr>
</table>

<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td width=80px><b>内容编辑</b></td>
  <td><asp:TextBox  id="Content"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Normal" runat="server"/>
  </td>
 </tr>
<tr>
  <td>模块布局</td>
  <td>
<asp:RadioButton id="Layout_1" GroupName="site" runat="server" Title="一个模块一行" />整行
<asp:RadioButton id="Layout_2" GroupName="site" runat="server" Title="多个模块同行显示时，可以选择靠左" />靠左
<asp:RadioButton id="Layout_3" GroupName="site" runat="server" Title="如果是同行中最右边的模块，务必选择靠右，以保证各种浏览器正常显示"/>靠右 (说明：模块布局只有选择靠左时,模块宽度定义有才效)</td>
 </tr>
<tr>
  <td>模块宽度</td>
  <td><asp:TextBox id="Template_Width" runat="server"  size="3" maxlength="3"/>%(百分比)

 <asp:RequiredFieldValidator   ControlToValidate="Template_Width" display="Dynamic" type="integer"  runat="server">
模块宽度百分比不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Template_Width" display="Dynamic" type="integer" MinimumValue="10" MaximumValue="100" runat="server">
请输入10—100之间的数字</asp:RangeValidator>
</td>
 </tr>
<tr title="相对上一个模块的位置，选择'是'则从新的一行开始显示">
  <td>换行显示</td>
  <td><asp:RadioButton id="Wrap_1" GroupName="wrap" runat="server"  />否
  <asp:RadioButton id="Wrap_2" GroupName="wrap" runat="server" />是
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td width=80px>默认模块标志</td>
  <td><asp:RadioButton id="RB_Show" GroupName="Hide" runat="server" />显示&nbsp;&nbsp;<asp:RadioButton id="RB_Hide" GroupName="Hide" runat="server" />隐藏</td>
 </tr>
<tr>
  <td>目标地址</td>
  <td><asp:TextBox id="Url" runat="server"  size="60" maxlength="100"/></td>
 </tr>
<tr>
  <td>模块风格</td>
  <td><asp:DropDownList  id="D_Style"  DataTextField="name" DataValueField="id" Runat="server" /></td>
</tr>
<tr>
  <td>自定义头信息</td>
  <td align="left"><asp:TextBox  id="HeadContent"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor Tb_Id="HeadContent" Fck_Height="250" Fck_Style="Basic"  runat="server" />
</td>
 </tr>
</table>
</div>

<br>
<div align=center>
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_1_template.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"])%>'">
</div>

</td>
</tr>
</table>
<br>
<span style="color:#ff0000">注意：</span>粘贴js代码时请切换到源代码模式。
</form>
</td>
</tr>
</table>
</center>
</body>
<script language="javascript">
var C_Tab="<%=Request.QueryString["tab"]%>";
if(C_Tab!="")
 {
   showtab(C_Tab,0);
 }   
</script>
</html>  




