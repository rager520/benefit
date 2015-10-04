<% @ Page language="c#" Inherits="PageAdmin.search"%>
<% @ Register TagPrefix="aspcn" TagName="uc_top" src="~/incs/web_top.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_banner" src="~/incs/banner.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_bottom" src="~/incs/web_bottom.ascx" %>
<aspcn:uc_top    runat="server" />
<aspcn:uc_banner  runat="server" id="default" thetype="default"/>
<div class="lanmu_box" id="sublanmu_box">
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_2%> &gt; <%=Tags_1%></li>
<li class="uc_lanmu_site_2"><%=Tags_1%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<script src="/js/search.js" language="javascript"></script>
<asp:PlaceHolder id="Holder1" runat="server" Visible="false">
<p>
<%=Tags_3%> <input type="text" size="30" Maxlength="50" id="Search_Keycode" class="tb" Value="<%=S_keyWord.Replace("\"","\"")%>">&nbsp;<input type="button" Value="search"  onclick="k_search('<%=P_Language%>',1)" class="bt">
</p>
<br><%=Page_Tag1%><%=RecordCount%><%=Page_Tag2%>&nbsp;
<asp:DataList id="DL_1" RepeatDirection="Horizontal" border="0" RepeatLayout="table" width="99%" runat="server" HorizontalAlign="center" cellspacing="5" cellpadding="0">
<ItemTemplate>
<ul class="product_style_1"  title="<%#DataBinder.Eval(Container.DataItem,"sort1")%> <%#Get_Type2(DataBinder.Eval(Container.DataItem,"sort2").ToString())%>">
<li><a href="<%#Get_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),"productinfo")%>" target="_blank"><img src="<%#Get_Upload(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>"   class="product_style_1_image"  style="height:100px" border="0"></a></li>
<li><a href="<%#Get_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),"productinfo")%>" target="_blank"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%></a></li>
</ul>
</ItemTemplate>
</asp:DataList>
</asp:PlaceHolder>

<asp:PlaceHolder id="Holder2" runat="server" Visible="false">
<p>
<%=Tags_3%> <input type="text" size="30" Maxlength="50" id="Search_Keycode" class="textbox" Value="<%=S_keyWord.Replace("\"","\"")%>">&nbsp;<input type="button" Value="search"  onclick="k_search('<%=P_Language%>',2)" class="bt">
</p>
<br><%=Page_Tag1%><%=RecordCount%><%=Page_Tag2%>&nbsp;
<asp:Repeater id="DL_2"  runat="server">
  <ItemTemplate>
    <ul class="article_style_3" title="<%#DataBinder.Eval(Container.DataItem,"sort1")%> <%#Get_Type2(DataBinder.Eval(Container.DataItem,"sort2").ToString())%>">
     <li class="article_style_3_title"><a href="<%#Get_Url(DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),"articleinfo")%>" target="_blank"><span  style="font-weight:bold;font-size:12px;"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%></span></a><span class="article_style_3_date"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></span></li>
     <li class="article_style_3_box_2" style="margin-left:0">
      <img src="<%#Get_Upload(DataBinder.Eval(Container.DataItem,"thumbnail").ToString())%>" border="0" height="100px"  style="float:left;margin:0 10px 5px 0"><%#DataBinder.Eval(Container.DataItem,"introduction")%>...</li>
      </li>
     <li class="clear"></li>
    </ul>
     </ItemTemplate>
</asp:Repeater>
</asp:PlaceHolder>
<asp:Label id="TS_CN" runat="server" visible="false" Text="对不起，没有符合条件的记录，请更换关键词重新搜索！" />
<asp:Label id="TS_EN" runat="server" visible="false" Text="Sorry, no matching records, please replace the keywords New Search!" />

<asp:PlaceHolder id="Holder3" runat="server" Visible="false"/>
<div class="uc_lanmu_page" style="display:<%=Page_Show%>">
<%=Page_Tag1%><%=RecordCount%><%=Page_Tag2%>&nbsp;
<%=Page_Tag3%><%=CurrentPage%>/<%=PageCount%>&nbsp;
<a id="P_First" href="javascript:Get_PageUrl(1)"><%=F_Name%></a>&nbsp;
<a id="P_Prev"  href="javascript:Get_PageUrl(<%=CurrentPage-1%>)"><%=P_Name%></a>&nbsp;
<a id="P_Next"  href="javascript:Get_PageUrl(<%=CurrentPage+1%>)"><%=N_Name%></a>&nbsp;
<a id="P_Last"  href="javascript:Get_PageUrl(<%=PageCount%>)"><%=L_Name%></a>&nbsp;
<%=Page_Tag4%>
<select id="P_Page" onchange="Get_PageUrl(this.options[this.selectedIndex].value)">
<%
 for(int i=1;i<=PageCount;i++)
  {
%>
  <option value="<%=i%>"><%=i%></option>
<%
  }
%>
</select><%=Page_Tag5%>
</div>
<script language="javascript">
Go_Page(<%=PageCount%>,<%=CurrentPage%>);
function Get_PageUrl(Page)
 {
   var Url=location.href.toLowerCase();
   if(Url.indexOf("page=")<0)
    {
     Url+="&page=0";
    }
  Url=Url.replace(/page=([0-9]+)/,"page="+Page)
  location.href=Url;
 }
</script>
</div>
</div>
</div>
<aspcn:uc_bottom   id="uc_bottom" runat="server" />