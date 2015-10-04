<% @ Page  language="c#" Inherits="PageAdmin.votes" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>投票结果</title>
</head>
<style type="text/css">
body{word-break:break-all;color:#333333;margin: 0 0 0 0;font-size:12px;line-height:20px;text-align:center;font-family:宋体,Arial;}
a:hover {color:#FF9900;text-decoration:none;}
ul,li,td{list-style-type:none;margin:0 0 0 0;padding:0 0 0 0;font-size:12px;}
a{color:#333333;text-decoration:none;}
a.detail{text-decoration:none;}
a:hover {color:#FF9900;text-decoration:none;}
.box{width:90%;border:1px solid #cccccc;margin-top:50px;margin-left:auto;margin-right:auto;Text-align:center;}
.box_1{font-weight:bold;font-size:13px;text-align:center;padding:10px 0 2px 0;}
.box_2{font-weight:normal;font-size:12px;height:25px;text-align:left;padding:0 0 0 10px;}
.box_3{font-weight:normal;font-size:12px;height:25px;text-align:left;padding:0 0 0 10px;}
.box_4{text-align:center}
.box_5{font-weight:bold;font-size:12px;height:25px;text-align:center;padding:10px 0 0 0;}
.votes_bar{height:10px;background-color:#ff0000};
.percent{font-family:Arial;}
.tdhead{color:#1D9D76;font-weight:bold;}
</style>
<div class="box">
<div class="box_1"><%=Tags_1%></div>
<div class="box_2"><b><%=Tags_2%></b><%=Vote_Title%></div>
<div class="box_3"><b><%=Tags_3%></b><%=Votes_Count%></div>
<div class="box_4">
<table border="0" width="95%" cellpadding="0" cellspacing="0" align="center">
<tr>
  <td width="30%" align="left" height="25px" class="tdhead"><%=Tags_4%></td>
  <td width="50%" align="left" class="tdhead"><%=Tags_5%></td>
  <td width="20%" align="left" class="tdhead"><%=Tags_6%></td>
</tr>
<asp:Repeater Id="D_1" runat="server">
<ItemTemplate>
<tr>
  <td width="30%" height="25px" align="left"><%#DataBinder.Eval(Container.DataItem,"question")%></td>
  <td width="50%" align="left"><img  src="/images/public/votebar.gif" vspace="4px" style="height:8px;width:<%#Get_Width(DataBinder.Eval(Container.DataItem,"votes").ToString(),2)%>px"> <span style="percent"><%#Get_Percent(DataBinder.Eval(Container.DataItem,"votes").ToString(),Votes_Count)%>%</span></td>
  <td width="20%" align="left"><%#DataBinder.Eval(Container.DataItem,"votes")%></td>
</tr>
</ItemTemplate>
</asp:Repeater>
</table>
</div>
</div>
<div class="box_5"><a href="javascript:window.close()">【Close】</a></div>
</body>
</html>










