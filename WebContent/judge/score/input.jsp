<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
</head>

<body>
<jsp:include page="../low.jsp" />
<div class="right_cont">
<div class="title_right"><strong>成绩录入</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>score?method=input" method="post" name="form1">
<c:set var="t" value="${DATA}"/>
<table class="table table-bordered">
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">赛事名称：</td>
     <td><input type="text" disabled value="${t.sportName }" class="span3"/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">运动项目：</td>
     <td><input type="text" disabled value="${t.eventName }" class="span3"/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛人：</td>
     <td><input type="text" disabled value="${t.mname }" class="span3"/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛编号：</td>
     <td><input type="text" disabled value="${t.mnum }" class="span3"/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛时间：</td>
     <td><input type="text" disabled value="${t.eventCtime }" class="span3"/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">成绩：</td>
     <td><input type="text" name="score" value="${t.eventScore }" required class="span3"/>&nbsp;${t.eventUnit}</td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2">
     	<input type="hidden" name="id" value="${t.id }"/>
     	<input type="submit" value="确定" class="btn btn-info btn-small" style="width:80px;" />
     	</td>
     </tr>
</table> 
</form>
   </div>  
 </div>  
</body>
 
