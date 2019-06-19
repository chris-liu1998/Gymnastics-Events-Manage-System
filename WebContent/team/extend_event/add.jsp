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
<div class="title_right"><strong>参赛报名</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>extend_event?method=add" method="post" name="form1" onsubmit="return check()">
<table class="table table-bordered">
	 	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">赛事：</td>
     <td>
     	<input type="hidden" name="sport" value="${sport.id}"/>
     	<input type="text" disabled class="span3" maxlength="30" value="${sport.name}"/>
     </td> 
     </tr>
	 	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">运动项目：</td>
     <td>
     	<select name="event" id="event" style="width:214px;height:25px;padding:3px 0;">
          <option value="">请选择</option>
     	<c:forEach items="${DATAS}" var="t" varStatus="st">
          		<option value="${t.id}" stime="${t.stime }" etime="${t.etime }">${t.name}</option>
        </c:forEach>
        </select>
     </td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">报名开始时间：</td>
     <td>
     	<input type="hidden" name="sport" value="${sport.id}"/>
     	<input type="text" disabled id="stime" class="span3" maxlength="30" value="请选择项目"/>
     </td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">报名截止时间：</td>
     <td>
     	<input type="hidden" name="sport" value="${sport.id}"/>
     	<input type="text" disabled  id="etime" class="span3" maxlength="30" value="请选择项目"/>
     </td> 
     </tr>
	 	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">参赛人员：</td>
     <td>
     	<select name="mid" id="mid" style="width:214px;height:25px;padding:3px 0;">
          <option value="">请选择</option>
     	<c:forEach items="${MBRS}" var="t" varStatus="st">
          		<option value="${t.id}">${t.realname}</option>
        </c:forEach>
        </select>
     </td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="报名" class="btn btn-info btn-small" style="width:80px;" /></td>
     </tr>
</table> 
</form>
   </div>  
 </div>  
</body>
<script>
$(function(){
	$('#event').change(function(){
		var op = $(this).find("option:selected");
		var stime = op.attr('stime');
		var etime = op.attr('etime');
		$('#stime').val(stime);
		$('#etime').val(etime);
	});
});

function comparex(b) {
	var time = $('#' + b).val();
	var nowt = new Date();
	var end = new Date(time.replace("-", "/").replace("-", "/"));
	return end >= nowt;
}

function check() {
	var eid = $('#event').val();
	if (eid == null || eid == '') {
		alert('请选择运动项目');
		return false;
	}
	var mid = $('#mid').val();
	if (mid == null || mid == '') {
		alert('请选择参赛人员');
		return false;
	}

	if (comparex('stime')) {
		alert('还未开始报名');
		return false;
	}
	if (!comparex('etime')) {
		alert('报名已截至');
		return false;
	}
}
</script>
 
