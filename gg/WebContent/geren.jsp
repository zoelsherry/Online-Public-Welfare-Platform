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
	<title>修改个人信息</title>
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
  	<div class="top1"><a href="login.jsp">登陆</a></div>
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

<div class="login">
  <%
  		ResultSet rs=null;
  		
  		if(session.getAttribute("UserMail")==null)
  			out.println("请先登录或者注册！");
  		else
  		{
  			String select="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
  			rs=db.select(select);
  			rs.next();		
   %>
    <div class="loginTitle"><h1>修改个人信息</h1></div>
    <div class="registerContent" style="height:380px;">
    	<form id="form" name="form" method="post" action="servlet/modify">
        <div class="line">
            <div class="registerWord">邮箱：</div>
            <div class="loginFrame"><input name="mail" type="text" value="<%=rs.getString("UserMail")%>" size="30" width="200" height="30" />
          </div>
        </div>
        <div class="line">
            <div class="registerWord">原密码：</div>
            <div class="loginFrame"><input name="oldPass" type="password" value="<%=rs.getString("Password")%>" size="30" width="200" height="30"  />
          </div>
        </div>
        <div class="line">
            <div class="registerWord">新密码：</div>
            <div class="loginFrame"><input name="password" type="password" value="" size="30" width="200" height="30"  />
          </div>
        </div>
    <div class="line">
            <div class="registerWord">确认密码：</div>
            <div class="loginFrame"><input name="passConfirm" type="password" value="" size="30" width="200" height="30"  />
        </div></div>
        <div class="line">
            <div class="registerWord">昵称：</div>
            <div class="loginFrame"><input name="name" type="text" value="<%=rs.getString("UserName")%>" size="30" width="200" height="30" />
          </div>
        </div>
        <div class="line">
            <div class="registerWord">手机号：</div>
            <div class="loginFrame"><input name="phone" type="text" value="<%=rs.getString("Tel")%>" size="30" width="200" height="30" />
          </div>
        </div>
        <div class="line">
            <div class="registerWord">居住城市：</div>
            <div class="loginFrame"><select name="city">
        <option value="北京" <%="北京".equals(rs.getString("City"))?"selected":"" %> selected="selected">北京</option>
        <option value="上海" <%="上海".equals(rs.getString("City"))?"selected":"" %>>上海</option>
        <option value="重庆" <%="重庆".equals(rs.getString("City"))?"selected":"" %>>重庆</option>
        <option value="广州" <%="广州".equals(rs.getString("City"))?"selected":"" %>>广州</option>
        <option value="西安" <%="西安".equals(rs.getString("City"))?"selected":"" %>>西安</option>
        <option value="长沙" <%="长沙".equals(rs.getString("City"))?"selected":"" %>>长沙</option>
        <option value="杭州" <%="杭州".equals(rs.getString("City"))?"selected":"" %>>杭州</option>
      </select></div>
        </div>
        <div class="line">
        	<div class="registerWord">头像：</div>
            <div class="loginFrame"><input name="cover" type="text" value="<%=rs.getString("UserCover")%>" size="30" width="200" height="30" type="file" /></div>
		</div>
     
        <div class="line" style="clear:both">
          <div align="center">
            <input name="button" type="submit" value="确认修改" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div><%} %>
</div>

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
