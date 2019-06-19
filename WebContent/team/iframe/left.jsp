<%@ page language="java" import="java.util.*,com.model.Team" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../low.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
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
		<a href="<%=basePath %>team?method=minfo" target="MainFrame">个人信息管理</a> 
		<a href="<%=basePath %>team/info/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div> 
	<div>
		<span>参赛队员管理</span>
		<a href="<%=basePath %>member?method=mlist" target="MainFrame">参赛队员列表</a> 
		<a href="<%=basePath %>team/member/add.jsp" target="MainFrame">新增参赛队员</a> 
	</div>
	<div>
		<span>参赛信息管理</span>
		<a href="<%=basePath %>extend_event?method=toadd" target="MainFrame">参赛报名</a> 
		<a href="<%=basePath %>extend_event?method=list" target="MainFrame">已报名参赛</a> 
	</div>
	<div>
        <span>成绩管理</span>
        <a href="<%=basePath %>score?method=teamsort" target="MainFrame">成绩查询</a>  
    </div> 
</div>
     </div>
</body>

</html>
