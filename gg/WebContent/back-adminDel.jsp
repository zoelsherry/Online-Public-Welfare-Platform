<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>删除管理员</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body id="body">
    <jsp:useBean id="db" class="client.DB">
        <%
	        String UN=new String(request.getParameter("UserName").getBytes("ISO-8859-1"),"utf-8");
	        db.delete("delete from admin where UserName='" +UN+ "'");
	        response.sendRedirect("back-index.jsp");
        %>
        </jsp:useBean>
    </body>
</html>