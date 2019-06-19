<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
</HEAD>
<body>
<div class="left">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">

	<div>
		<span>个人信息管理</span>
		<a href="<%=basePath %>admin?method=info" target="MainFrame">个人信息管理</a>   
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div> 
	<div>
		<span>参赛账号管理</span>
		<a href="<%=basePath %>team?method=list" target="MainFrame">参赛账号列表</a>  
		<a href="<%=basePath %>admin/team/add.jsp" target="MainFrame">新增参赛账号</a>  
	</div> 
	<div>
		<span>参赛人员管理</span>
		<a href="<%=basePath %>member?method=list" target="MainFrame">参赛人员列表</a>  
	</div> 
	<div>
		<span>赛事管理</span>
		<a href="<%=basePath %>sport?method=list" target="MainFrame">赛事列表</a>  
		<a href="<%=basePath %>admin/sport/add.jsp" target="MainFrame">新增赛事</a>  
	</div> 
	<div>
		<span>运动项目管理</span>
		<a href="<%=basePath %>event?method=list" target="MainFrame">运动项目列表</a>  
		<a href="<%=basePath %>event?method=toadd" target="MainFrame">新增运动项目</a>  
	</div> 
	<div>
		<span>参赛报名管理</span>
		<a href="<%=basePath %>extend_event?method=adminlist" target="MainFrame">参赛报名列表</a>  
	</div> 
	<div>
		<span>成绩排名管理</span>
		<a href="<%=basePath %>score?method=adminsort" target="MainFrame">成绩排名列表</a>  
	</div> 
</div>
     </div>
</body>

</html>
