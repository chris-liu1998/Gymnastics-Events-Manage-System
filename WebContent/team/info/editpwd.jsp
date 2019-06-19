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
<script type="text/javascript">
function checkPasswords() {
        var pass1 = document.getElementById("newpwd");
        var pass2 = document.getElementById("repwd");
 
        if (pass2.value != pass1.value)
            pass2.setCustomValidity("两次输入的密码不匹配");
        else
            pass2.setCustomValidity("");
}
</script>
<jsp:include page="../low.jsp" />
<body>
<div class="right_cont">
<div class="title_right"><strong>密码信息管理</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>member?method=muppwd" method="post" name="form1">
<table class="table table-bordered">
	 <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">旧&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
     <td><input type="password" name="oldpwd" class="span3" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
     <td><input type="password" id="newpwd" name="newpwd" onchange="checkPasswords()" class="span3" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">确认密码：</td>
     <td><input type="password" id="repwd" name="repwd" onchange="checkPasswords()" class="span3" required/></td> 
     </tr>
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="确定" class="btn btn-info btn-small" style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
</html> 
