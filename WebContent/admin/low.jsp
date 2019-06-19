<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<%
    String path = request.getContextPath();

    Object username = session.getAttribute("user");
    if (username == null) {
        out.println("<script language='javascript'>");
        out.println("alert('登录超过或非法请求,请登录');window.top.location.href='"+path+"/login.jsp';");
        out.println("</script>");
    }

    String message = (String) request.getAttribute("message");
    if (message == null) {
        message = "";
    }
    if (!message.trim().equals("")) {
        out.println("<script language='javascript'>");
        out.println("alert('" + message + "');");
        out.println("</script>");
    }
    request.removeAttribute("message");
%>
