<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
 
<div class="header">
<div class="logo">管理后台</div>
<div class="header-right"><a href="<%=basePath%>/admin/index.jsp" target="_top">返回首页</a>
<i class="icon-off icon-white"></i> <a onclick="return confirm('确定要退出吗？');" href="<%=basePath %>admin?method=adminexit" target="_top">注销退出</a> 
</div>
</div>