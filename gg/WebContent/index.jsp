<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*" %> <!--                  kkjkjkjkj -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线捐助及同城公益活动平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	left:400px;
	top:124px;
	width:200px;
	height:200px;
	z-index:1;
	border:dashed 1px #CCCCCC;
}
#apDiv2 {
	position:absolute;
	left:650px;
	top:124px;
	width:200px;
	height:200px;
	z-index:2;
	border:dashed 1px #CCCCCC;
}
.indexImg{ height:180px; width:180px; margin-left:auto; margin-right:auto; margin-top:10px;}

-->
</style>
  </head>
  
  <body>
  <div class="body">
<jsp:useBean id="db" scope="page" class="client.DB" />
<div class="top">
	<div class="top1"><a href="index.jsp">首页</a></div>
	<div class="top1"><a href="jk-index.jsp">在线捐助</a></div>
    <div class="top1"><a href="jk-record.jsp">捐助记录</a></div>
    <div class="top1"><a href="hd-index.jsp">同城公益活动</a></div>
    <%
  		if(session.getAttribute("UserMail")==null){
  %>
  	<div class="top1"><a href="login.jsp">登录</a></div>
  	<%}else {
  		ResultSet rs=null;
  		String select="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
  		rs=db.select(select);
  		rs.next();		
  	%>
	<div class="top1"><a href="geren.jsp"><%=rs.getString("UserName") %>的账号</a></div>
    <div class="top1"><a href="quit.jsp">退出</a></div>
    <%} %>
</div>
<div id="apDiv1"><div class="indexImg"><a href="jk-index.jsp"><img src="images/web_03.jpg" border="0" /></a></div></div>
<div id="apDiv2"><div class="indexImg"><a href="hd-index.jsp"><img src="images/web_05.jpg" border="0" /></a></div></div>
</div>
  </body>
</html>
