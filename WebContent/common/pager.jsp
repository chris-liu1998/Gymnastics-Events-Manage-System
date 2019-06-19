<%@ page language="java" contentType="text/html;charset=utf-8" %>
<tr align="center">
  <td nowrap="nowrap" colspan="12">
    <input type="hidden" name="pageCount" value="<%= session.getAttribute("pageCount").toString()%>" />
 	<input type="hidden" name="page" value="<%=session.getAttribute("pageNo").toString()%>" />
	<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
	<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
	 共<%=session.getAttribute("count").toString()%>条记录,共计<%=session.getAttribute("pageCount").toString()%>页,当前第<%=session.getAttribute("pageNo").toString()%>页&nbsp;&nbsp;&nbsp;
	<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
	<a href="#" onClick="last2()">尾页</a>
 	第<input name="busjump" type="text" class="span1" />页 <a href="#" onClick="bjump2()">转到</a>&nbsp;&nbsp;&nbsp; 
  </td>
</tr>