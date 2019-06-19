<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
</head>
<body>
<jsp:include page="../low.jsp" />
<div class="right_cont">
<div class="title_right"><strong>新增参赛人员</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>member?method=add" method="post" name="form1">
<table class="table table-bordered">
      <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">姓名：</td>
     <td><input type="text" name="realname" class="span3" maxlength="18" required/></td> 
     </tr>
      <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">性别：</td>
     <td>
     	<select name="sex" style="width:214px;height:25px;padding:3px 0;">
     		<option value="男">男</option>
     		<option value="女">女</option>
     	</select>
     </td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">年龄：</td>
     <td><input type="text" name="age" class="span3" maxlength="18" pattern="[1-9][0-9]" title="真实年龄" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">联系电话：</td>
     <td><input type="text" name="phone" class="span3" maxlength="18" pattern="[0-9]{11}" title="11位手机号码" required/></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2">
     	<input type="submit" value="确定" class="btn btn-info btn-small" style="width:80px;" /></td>
     </tr>
</table> 
</form>
   </div>  
 </div>  
</body>
 
