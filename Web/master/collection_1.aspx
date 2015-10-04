﻿<% @ Page Language="C#" Inherits="PageAdmin.collection_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="collection_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>采集规则管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25  align="left"><b>采集规则管理</b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="DL_1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
          OnItemDataBound="PageAdmin_Data_Bound"    OnDeleteCommand="PageAdmin_Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=25% class=white height=25px>名称</td>
                  <td align=center width=15% class=white>类型</td>
                  <td align=center width=15% class=white>创建时间</td>
                  <td align=center width=10% class=white>序号</td>
                  <td align=center width=35% class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=25%  class=tdstyle>
                    <asp:TextBox  id="Tb_name" maxlength="45"  size="30" Text='<%#DataBinder.Eval(Container.DataItem,"c_name")%>' runat="server" /></td>

                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"c_tablename")%></td>
                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td align=center width=10%  class=tdstyle>
                    <asp:TextBox Id="Tb_xuhao" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size="5" MaxLength="5"/>
                   </td>

                  <td align=center width=35% class=tdstyle>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_table" Text='<%#DataBinder.Eval(Container.DataItem,"c_table")%>' runat="server" visible="false"/>
                   <a href="collection_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&table=<%#DataBinder.Eval(Container.DataItem,"c_table")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"c_name").ToString())%>">采集规则</a>
                   <a href="collection_4.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&table=<%#DataBinder.Eval(Container.DataItem,"c_table")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"c_name").ToString())%>">采集配置</a>
                   <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
         </asp:DataList>
       </td>
    </tr>
   </table>
    <br>
  <div align="center"><asp:Button text="修改" Onclick="PageAdmin_Data_Update"  CssClass="button" runat="server" /></div>
  </td>
  <tr>
 </table>
<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td  colspan=3 height=25><b>增加采集规则</b></td>
    </tr>
      <tr>
        <td  height=25 align="left">采集名称：<asp:TextBox      id="Add_Name"    maxlength="45"  size=20  runat="server" />
                     采集类型：<asp:DropDownList id="Add_Table" runat="server">
                      <asp:ListItem Value="information">文章采集</asp:ListItem>
                      <asp:ListItem Value="product">产品采集</asp:ListItem>
                    </asp:DropDownList>
                      序号：<asp:TextBox       id="Add_xuhao"  Text="0" maxlength=5 size=5 runat="server" />
                      <asp:button  CssClass="button"  Text="增加" runat="server" OnClick="PageAdmin_Data_Add" />
        </td>
    </tr>
   </table>
</td>
</tr>
</table>
<br>
<asp:Label id="LblErr" runat="server" />

</form>

</td>
</tr>
</table>
</center>
</body>
</html>  



