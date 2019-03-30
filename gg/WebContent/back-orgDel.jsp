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
	<title>删除主办方</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body id="body">
    <jsp:useBean id="db" class="client.DB">
        <%
	        String UN=new String(request.getParameter("UserID").getBytes("ISO-8859-1"),"gb2312");
	        db.delete("delete from organizer where UserID='" +UN+ "'");
	        response.sendRedirect("back-index.jsp");
        %>
        </jsp:useBean>
    </body>
</html>