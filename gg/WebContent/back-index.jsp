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
	<title>后台管理主页</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <div class="body">
<jsp:useBean id="db" scope="page" class="client.DB" />
<div class="top">
	<div class="top1"><a href="back-index.jsp">后台管理主页</a></div>
	   <div class="top1"><a href="login.jsp">普通用户登录</a></div>

   <%if(session.getAttribute("UserName")==null){ 
   %>
	   <div class="top1"><a href="back-login.jsp">管理员登录</a></div>
	   
	   
</div>
 
  <%}else {%>
  	     <div class="top1"><a href="quitA.jsp">退出</a></div>
	  
  
  
<div class="banner">
	<div class="titlePic1"><h1>后台管理主页</h1></div>
    </div>
<!--banner -->
   
<div class="login">

    
    	<div class="backLeft">
        	<h3 class="backLine">用户管理</h3>
            <div class="backList">
            	<div class="backLi" style="height:40px;"><a href="back-memberAdd.jsp">+添加新用户</a></div>
            	<div class="backLi">
            	<%
					String sql="SELECT * FROM users";
					ResultSet user = db.select(sql);  
					while(user.next()){
				%>
                	<div class="name word"><a href="information.jsp?userName=<%=user.getString("UserName") %>"><%=user.getString("UserName") %></a></div>
                  <div><a href="back-memberDel.jsp?UserID=<%=user.getString("UserID") %>">删除</a></div>
                  <%} %>
                </div>
       	  </div>
            </div>
        <!--left -->
        <div class="backMiddle">
        	<h3 class="backLine">主办方管理</h3>
            <div class="backList">
            	<div class="backLi" style="height:40px;"></div>
            	<div class="backLi">
            	<%
					String sql2="SELECT * FROM organizer";
					ResultSet org = db.select(sql2);  
					while(org.next()){
				%>
                    <div class="name word"><a href="back-zbfDetail.html"><%=org.getString("UserName") %></a></div>
                    <div><a href="back-orgDel.jsp?UserID=<%=org.getString("UserID")%>">删除</a></div>
                <%} %>
                </div>
                </div>
           
        </div><!--middle -->
        <%String UN=(String)session.getAttribute("UserName") ;System.out.println(UN);
        String sqq="SELECT * FROM admin where Role='super' and UserName ='"+UN+"'";
		ResultSet  ww= db.select(sqq); 
        %>
        <%if(ww.next()){
        		%>
        <div class="backRight">
        	<h3 class="backLine">管理员管理</h3>
        
        	
     
        	
            <div class="backList" style="border:none;">
           	  <div class="backLi" style="height:40px;"><a href="back-managerAdd.jsp">+添加新管理员</a></div>
           	  <%
					String sql3="SELECT UserName FROM admin";
					ResultSet admin = db.select(sql3);  
					while(admin.next()){
				%>
              <div class="name"><%=admin.getString("UserName") %></div>
                    <div><a href="back-adminDel.jsp?UserName=<%=admin.getString("UserName") %>">删除</a></div>
                <%} %>
            </div>
           
        </div><!--right -->
    		 <%} %>  
        
    </div>    
    <!--login -->
   <%} %>
<div class="bottom"></div>

</div> <!--body -->
  </body>
</html>
