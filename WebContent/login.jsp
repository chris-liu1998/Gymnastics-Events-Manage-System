<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %> 
<div class="main">
 <div class="narea"><div style="margin-top: 10px;">
	<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020"> 
</div></div>
<div class="rmain">        
<div class="tom"><div class="totitle"><span> </span></div></div>  
<div class="rlist">  
<FORM name="loginform" method="post" action="<%=basePath %>login"> 
   <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
	  <tbody>
	     <tr class="tr1">
			<td class="rltitle daslist" colspan="2" style="text-align: center;font-size:19px;font-weight: bold;padding-bottom: 20px;">用户登录</td> 
         </tr>
	     <tr class="tr1">
			<td class="rldatee daslist">登录帐号：</td>
            <td class="rltitle dotlist"><input type="text" style="width:250px;height:25px;" name="username" required /></td> 
         </tr> 
         <tr class="tr1">
			<td class="rldatee daslist">登录密码：</td>
            <td class="rltitle dotlist"><input type="password" style="width:250px;height:25px;" name="password" required /></td> 
         </tr> 
         <tr class="tr1">
			<td class="rldatee daslist">登录角色：</td>
            <td class="rltitle dotlist">
            	<select name="role" style="width:250px;height:25px;padding:3px 0;">
            		<option value="team">代表队</option>
            		<option value="judge">裁判组</option>
            		<option value="admin">系统管理员</option>
            	</select>
            </td> 
         </tr> 
         
         <tr class="tr1">
            <td class="rldatee daslist"></td>
			<td class="rltitle daslist"><input type="submit" value="登录" style="width:100px;" />
			</td>
         </tr>
      </tbody>
</table> 
</FORM> 
</div>
</div> 
</div>
<%@ include file="iframe/foot.jsp"%>