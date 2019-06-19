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
<div class="title_right"><strong>赛事管理</strong></div>
<div style="width:900px;">
<form action="<%=basePath %>sport?method=list" method="post" name="form1" >
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
         <th>赛事状态</th>
         <th width="160" nowrap="nowrap">操作</th>
       </tr>
	  <c:forEach items="${DATAS}" var="t" varStatus="st">
       <tr align="center">
         <td>${st.index+1}</td>
         <td>${t.name}</td>
         <td>${t.status}</td>
         <td>
         	<a href="<%=basePath%>sport?method=toupdate&id=${t.id}">编辑</a> 
         	<a onclick="return confirm('确定要删除吗？');" href="<%=basePath%>sport?method=del&id=${t.id}">删除</a>
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
