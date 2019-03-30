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
	<title>添加新管理员</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <div class="top">
	<div class="top1"><a href="back-index.jsp">后台管理主页</a></div>
    <div class="top1"><a href="quit.jsp">退出登录</a></div>
</div>
<jsp:useBean id="db" scope="page" class="client.DB" />
<div class="login">
    <div class="loginTitle">
      <h1>添加新管理员</h1>
    </div>
<div class="huodongContent" style="padding-top:10px; height:240px;">
    	<form id="form" name="form" action="servlet/magagerAdd" method="post">
        <div class="line">
            <div class="registerWord">用户名：(*)</div>
            <div class="loginFrame"><input name="userName" type="text" size="30" width="200" height="30" /></div>
        </div>
        
        <div class="line">
            <div class="registerWord">密码：(*)</div>
            <div class="loginFrame"><input name="password" type="password" size="30" width="200" height="30"  /></div>
        </div>
        <div class="line">
            <div class="registerWord">确认密码：(*)</div>
            <div class="loginFrame"><input name="passConfirm" type="password" size="30" width="200" height="30"  />
        </div></div>
        <div class="line">
            <div class="registerWord">Role：</div>
            <div class="loginFrame"><input name="role" value="common" type="text" size="30" width="200" height="30" /></div>
        </div>
        
        <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="添加" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div>
<!--login -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
