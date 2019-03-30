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
	<title>注册</title>
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
</div>

<div class="login">
    <div class="loginTitle"><img src="images/regist_11.gif" /></div>
  <div class="huodongContent">
    	<form id="form" name="form" method="post" action="servlet/register">
        <div class="line">
            <div class="registerWord">邮箱：(*)</div>
            <div class="loginFrame"><input name="mail" type="text" size="30" width="200" height="30" /></div>
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
            <div class="registerWord">昵称：(*)</div>
            <div class="loginFrame"><input name="name" type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">性别：(*)</div>
            <div class="loginFrame"><select name="sex">
        <option selected="selected">男</option>
        <option>女</option></select>
        </div>
        </div>
        <div class="line">
            <div class="registerWord">手机号：</div>
            <div class="loginFrame"><input name="phone" type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">居住城市：(*)</div>
            <div class="loginFrame"><select name="city">
        <option selected="selected" value="北京">北京</option>
        <option value="上海">上海</option>
        <option value="重庆">重庆</option>
        <option value="广州">广州</option>
        <option value="西安">西安</option>
        <option value="长沙">长沙</option>
        <option value="杭州">杭州</option>
      </select></div>
        </div>
        <div class="line">
        	<div class="registerWord">头像：</div>
            <div class="loginFrame"><input name="cover" type="text" size="30" width="200" height="30" type="file" /></div>
		</div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="button" id="button" type="submit" value="注册" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div>
</div>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
