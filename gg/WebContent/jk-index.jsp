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
	<title>主办方列表</title>
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
 <%} %>
<div class="banner">
	<div class="titlePic1"><h1>主办方列表</h1></div>
    </div>
<!--banner -->
	<%
		String sqlName="select * from organizer";
		ResultSet rs1 = db.select(sqlName);  
		
	%>
	<%
		ResultSet rs0=null;
	  	String se="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
	  	rs0=db.select(se);
	  	rs0.next();
	 %>
    <div class="main" style="float:left">
    <%while(rs1.next()) {%>
    
    <%String sqlAmount="select * from donation where RecipientID='"+rs1.getInt("UserID")+"'";
      ResultSet rs2 = db.select(sqlAmount);
      int amount=0;
      while(rs2.next()&&(rs2.getInt("RecipientID")==rs1.getInt("UserID"))){
			amount+=rs2.getInt("Amount");}%>
			
   	  <div class="actLeft">
       	  <div class="actPhoto"><img src="<%=rs1.getString("UserCover") %>" /></div>
          <div class="actWord">
          	<div class="actTitle"><a href="http://site.douban.com/107208/"><%=rs1.getString("UserName") %></a>
       	    <a href="#"></a></div>
            <p class="actTime">捐款总额：<font color="#FF0000"><%=amount %></font>元</p>
           
            <p class="actAdress"><a href="jk-submit.jsp?userName=<%= rs1.getString("UserName")%>">>马上捐款</a></p>
          </div>
      </div><!--actLeft -->
      <%if(rs1.next()) {%>
      <%String sqlAmount1="select * from donation where RecipientID='"+rs1.getInt("UserID")+"'";
      ResultSet rs21 = db.select(sqlAmount1);
      int amount1=0;
      while(rs21.next()&&(rs21.getInt("RecipientID")==rs1.getInt("UserID"))){
			amount1+=rs21.getInt("Amount");}%>
	<div class="actRight">
    	<div class="actPhoto"><img src="<%=rs1.getString("UserCover") %>" /></div>
          <div class="actWord">
          	<div class="actTitle"><a href="http://www.bjep.org.cn/"><%=rs1.getString("UserName") %></a>
       	    <a href="#"></a></div>
            <p class="actTime">捐款总额：<font color="#FF0000"><%=amount1 %></font>元</p>
           
            <p class="actAdress"><a href="jk-submit.jsp?userName=<%= rs1.getString("UserName") %>">>马上捐款</a></p>
          </div>
          <%} %>
        </div><!--actRight -->
        <%} %>
    </div><!--main -->

<div class="bottom"></div>
	</div>
<!--body -->
  </body>
</html>
