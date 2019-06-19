<%@ page language="java"  contentType="text/html;charset=utf-8"%> 
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
<body>
<jsp:include page="../low.jsp" />
<div class="right_cont">
<div class="title_right"><strong>我的参赛</strong></div>
<div style="width:900px;">
<form action="<%=basePath %>extend_event?method=list" method="post" name="form1" >
搜索关键字：<input type="text" name="keyword" class="span3" value="${keyword}" />
<input type="submit" value="查询" class="btn btn-info btn-small" style="width:120px;" />
</form>
   </div>  
<div style="width:100%;margin:auto;">
<form action="" method="post" name="form3">	
<table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <th>序号</th>
         <th>赛事名称</th>
         <th>运动项目</th>
         <th>队员姓名</th>
         <th>队员编号</th>
         <th>参赛时间</th>
         <th>参赛地点</th>
         <th>报名状态</th>
         <th width="160" nowrap="nowrap">操作</th>
       </tr>
	  <c:forEach items="${DATAS}" var="t" varStatus="st">
       <tr align="center">
         <td>${st.index+1}</td>
         <td>${t.sportName}</td>
         <td>${t.eventName}</td>
         <td>${t.mname}</td>
         <td>${t.mnum}</td>
         <td>${t.eventCtime}</td>
         <td>${t.eventAddress}</td>
         <td>${t.status}</td>
         <td>
         	<c:if test="${t.status == '已通过' && t.eventScore == null}">
         	等待成绩
         	</c:if>
         	<c:if test="${t.eventScore != null}">
         	<a href="<%=basePath%>score?method=mview&id=${t.id}">成绩查看</a>&nbsp;
         	<a href="<%=basePath%>score?method=msort&eventId=${t.eventId}">成绩排名</a>
         	</c:if>
         	<c:if test="${t.status == '待审核'}">
         	<a onclick="return confirm('确定要取消吗？');" href="<%=basePath%>extend_event?method=del&id=${t.id}">取消报名</a>
         	</c:if>
         </td>
       </tr>
       </c:forEach>
     </tbody>
   </table>
   </form>
   </div>  
 </div>  
</body>
</html>
