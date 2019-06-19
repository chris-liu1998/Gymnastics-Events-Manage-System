<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
 
<META http-equiv=Content-Type content="text/html; charset=utf-8">
 
</HEAD>
<jsp:include page="low.jsp" />
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="<%=basePath %>team/iframe/top.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="240, *">
<FRAME name=menu src="<%=basePath %>team/iframe/left.jsp" frameBorder=0 noResize>
<FRAME name=MainFrame src="<%=basePath %>team?method=minfo" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
