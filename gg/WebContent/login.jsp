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
	<title>登录</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <div class="body">

<div class="top">
	<div class="top1"><a href="index.jsp">首页</a></div>
	<div class="top1"><a href="jk-index.jsp">在线捐助</a></div>
    <div class="top1"><a href="jk-record.jsp">捐助记录</a></div>
    <div class="top1"><a href="hd-index.jsp">同城公益活动</a></div>
    <div class="top1"><a href="login.jsp">登录</a></div>
    <div class="top1"><a href="back-login.jsp">管理员登录</a></div>
</div>

<div class="login">
    <div class="loginTitle"><img src="images/login_11.gif" /></div>
    <div class="loginContent">
    	<form id="form" name="form" method="post" action="servlet/login">
      
      <div class="line">
            <div class="loginWord">邮箱：</div>
            <div class="loginFrame"><input name="mail" type="text" class="input" id="textarea" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="loginWord">密码：</div>
            <div class="loginFrame"><input name="password" type="password" size="30" width="200" height="30"  />
        </div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="button" id="button" type="submit" value="登录" class="loginButton" />
            </div>
        </div>
        </div><!--content -->
        </form>
    </div>
    <div class="loginReg"><p>><a href="register.jsp">点击这里注册新账号</a></p></div>
</div>

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
