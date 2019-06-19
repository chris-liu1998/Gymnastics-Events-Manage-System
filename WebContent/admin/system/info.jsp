<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	Object username=session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		 
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>个人信息管理</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>admin?method=updateinfo" method="post" name="form1">
<c:set var="t" value="${DATA}"/>
<table class="table table-bordered">
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">姓名：</td>
     <td><input type="text" name="realname" class="span4" value="${t.realname}" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">联系电话：</td>
     <td><input type="text" name="phone" class="span4" value="${t.phone }" pattern="[0-9]{11}" title="11位手机号码" required /></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="确定" class="btn btn-info btn-small" style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>