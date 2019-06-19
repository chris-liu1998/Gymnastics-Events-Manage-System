<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
</head>

<body>
<jsp:include page="../low.jsp" />
<div class="right_cont">
<div class="title_right"><strong>新增运动项目</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>event?method=add" method="post" name="form1">
<table class="table table-bordered">
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">赛事：</td>
     <td>
     	<input type="hidden" name="sport" value="${sport.id}"/>
     	<input type="text" disabled class="span3" maxlength="30" value="${sport.name}"/>
     </td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">运动项目名称：</td>
     <td><input type="text" name="name" class="span3" maxlength="30" required/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">报名开始时间：</td>
     <td><input type="text" name="stime" class="span3" maxlength="20" required/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">报名截止时间：</td>
     <td><input type="text" name="etime" class="span3" maxlength="20" required/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛时间：</td>
     <td><input type="text" name="ctime" class="span3" maxlength="20" required/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛地点：</td>
     <td><input type="text" name="address" class="span3" maxlength="50" required/></td> 
     </tr>
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">成绩单位：</td>
     <td><input type="text" name="unit" class="span3" maxlength="10" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">成绩排序方式：</td>
     <td>
     	<select name="usort" style="width:214px;height:25px;padding:3px 0;">
            		<option value="desc">成绩分数越高,排名越前</option>
            		<option value="asc">成绩分数越低,排名越前</option>
            	</select>
     </td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="确定" class="btn btn-info btn-small" style="width:80px;" /></td>
     </tr>
</table> 
</form>
   </div>  
 </div>  
</body>
 
