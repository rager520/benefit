<% @ Page  language="c#" Inherits="PageAdmin.votebar"%>
function LoadVoteBox_<%=Id%>()
{
var Title="<%=Vote_Title%>";
var Content="<%=Content%>";
var CheckType="<%=Style%>";
if(CheckType=="0")
 {
  CheckType="radio";
 }
else
 {
  CheckType="CheckBox";
 }
var AContent=Content.split('|');
var Item,votebox_str;
VoteBoxHtml="<ul>";
VoteBoxHtml+="<form name='voteform_<%=Id%>'  id='voteform_<%=Id%>' method='post' action='/include/votes.aspx'  onsubmit='return vote_check_<%=Id%>()'>";
VoteBoxHtml+="<li class='vote_title'>"+Title+"</li>";
for(var i=0;i<AContent.length;i++)
 {
   if(AContent[i].indexOf(",")>=0)
   {
    Item=AContent[i].substring(0,AContent[i].indexOf(","));
   }
   else
   {
    Item=AContent[i];
   }
  VoteBoxHtml+="<li class='vote_item'><input type='"+CheckType+"' name='voteitem' value='"+i+"'>";
  VoteBoxHtml+=Item;
  VoteBoxHtml+="</li>";
 }

VoteBoxHtml+="<li class='vote_item_1'><input type='image'  src='<%=Tags_2%>'>&nbsp;&nbsp;&nbsp;&nbsp;";
VoteBoxHtml+="<a href='/include/votes.aspx?id=<%=Id%>' target='vote'><img src='<%=Tags_3%>' border='0'></a><input type='hidden' name='id' value='<%=Id%>'><input type='hidden' name='vote' value='yes'></li>";
VoteBoxHtml+="</form>";
VoteBoxHtml+="</ul>";
document.write("<div class='vote_box'>"+VoteBoxHtml+"</div>");
}
LoadVoteBox_<%=Id%>();
function vote_check_<%=Id%>()
 {
   document.voteform_<%=Id%>.action="/include/votes.aspx";
   document.voteform_<%=Id%>.target="voteview";
   for(var i=0;i<document.voteform_<%=Id%>.voteitem.length;i++)
    {
      if(document.voteform_<%=Id%>.voteitem[i].checked)
       {
         return true;
       }
    }
  alert("<%=Tags_1%>");
  return false;
 }




















