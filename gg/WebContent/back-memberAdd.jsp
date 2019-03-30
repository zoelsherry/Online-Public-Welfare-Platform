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
	<title>添加新会员</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
    <div class="body">

<div class="top">
	<div class="top1"><a href="back-index.jsp">后台管理主页</a></div>
    <div class="top1"><a href="#">退出登录</a></div>
</div>

<div class="login">
    <div class="loginTitle">
      <h1>添加新会员</h1>
    </div>
    <div class="huodongContent" style="height:400px; padding-top:10px;">
    	<form id="form" name="form" action="servlet/memberAdd" method="post">
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
            <div class="loginFrame"><input name="tel" type="text" size="30" width="200" height="30" /></div>
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
            <input name="button" id="button" type="submit" value="添加" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    	</div>
<!--left -->
  <!--middle -->
</div>
<!--login -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
