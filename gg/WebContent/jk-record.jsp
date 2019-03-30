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
	<title>我的捐助记录</title>
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

<div class="banner">
	<div class="titlePic1"><h1>我的捐款记录</h1></div>
</div><!--banner -->
	<%
		String record="select * from donation where DonorID='"+rs.getInt("UserID")+"'";
		ResultSet rs2 = db.select(record);
		while(rs2.next()){
		int orgID=rs2.getInt("RecipientID");
		String org="select UserName from organizer where UserID='"+orgID+"'";
		ResultSet rs3=db.select(org);
		rs3.next();
		//String amout="select Amount from donation where DonorID='"+rs.getInt("UserID")+"'";
		//ResultSet rs4=db.select(amout);
		//rs4.next();
	%>
      <div class="hdJuanzhuList" style="width:400px;"><ul>
        	<li class="hdJuanzhu">
        	  <div class="hdJuanzhuTime"><%=rs2.getString("Time") %></div><div class="hdJuanzhuName" style="width:200px"><%=rs3.getString("UserName") %></div><div class="hdJuanzhuMoney" style="margin-left:20px;"><%=rs2.getInt("Amount") %></div>
            </li></ul>
      </div>
      <%} %>
<%} %>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
