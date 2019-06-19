<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="Pragma" content="no-cache">    
<meta http-equiv="Cache-Control" content="no-cache">    
<meta http-equiv="Expires" content="0">   
<link rel="stylesheet" href="<%=basePath%>images/style.css?v=0310" media="all" id="base">

<script language="javascript" src="<%=basePath%>images/jquery-1.7.1.min.js"></script> 
<script>
window.onerror=function(){return true;} 
</script> 
<style type="text/css">
.nav table th  .nav2List a,
.nav table th  .nav2List a:active, 
.nav table th  .nav2List a:visited { font-size:14px;padding:0 11px;  }
.header-link { right:20px; }
.header-link .setlang, 
.header-link .setlang:active,
.header-link .setlang:visited { width:50px; }
</style>
<script>
$(function(){
  var adli= $('.ad-thumbs-list');
if (adli.length==1){
  var adw=$('.ad-thumbs-list img').length*86;
$('.ad-thumbs-list').width(adw);
}  
});
</script>
</head>
<body>
	
<div class="body"> 
<div class="headerWrap">
  <div class="header">
      <h1>体操赛事信息管理系统</h1>
  </div>
</div>
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
%>