<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>确认捐款订单</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

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
    
</div>

<div class="login"> 

<%
	String UN=new String(request.getParameter("act").getBytes("ISO-8859-1"),"utf-8");
	//ResultSet rs1=null;
	//String sq="select * from organizer where UserName ='"+UN+"'";
	//rs1=db.select(sq);
	//rs1.next();	
%>
    <div class="loginTitle"><h1>参加活动</h1></div>
  <div class="huodongContent" style="height:400px;">
  <p style="font-size:16px;">您将参加：<%= UN%></p>

   	  <form id="form" name="form" action="servlet/join" method="post">
         <div class="line">
            <div class="registerWord">参加的活动：(*)</div>
            <div class="loginFrame"><input name="joinact" value=<%= UN%> type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">姓名(*)</div>
            <div class="loginFrame"><input name="name" type="text" size="30" width="200" height="30" /></div>
        </div>
        
        <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="立即参与" class="loginButton" style="width:200px;"/>
            </div>
        </div>
        
     
        
        
        
        
        
        </form>
    </div>
</div><%} %>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
