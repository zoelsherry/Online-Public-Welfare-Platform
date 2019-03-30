<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>管理员登录</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <div class="body">

<div class="top">
	<div class="top1"><a href="back-index.jsp">后台管理主页</a></div>
    <div class="top1"><a href="back-login.jsp">管理员登录</a></div>
    <div class="top1"><a href="login.jsp">普通用户登录</a></div>
</div>

<div class="login">
    <div class="loginTitle"><h1>管理员登录</h1></div>
    <div class="loginContent">
    	<form id="form" name="form" action="servlet/backLogin" method="post">
      <div class="line">
            <div class="loginWord">用户名：</div>
            <div class="loginFrame"><input name="userName" type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="loginWord">密码：</div>
            <div class="loginFrame"><input name="password" type="password" size="30" width="200" height="30"  />
        </div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="登录" class="loginButton" />
            </div>
        </div>
        </div><!--content -->
        </form>
    </div>
</div>

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
