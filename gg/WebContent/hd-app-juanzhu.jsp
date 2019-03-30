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
	<title>申请主办方资格</title>
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
    <div class="loginTitle">
      <h1>申请主办方资格</h1>
    </div>
  <div class="huodongContent">
    	<form action="servlet/registerZ" method="post">
    <%
		String sqlName="select * from organizer where UserName='"+request.getParameter("orgName")+"'";
		ResultSet rs1 = db.select(sqlName);  
	%>
        <div class="line">
            <div class="registerWord">主办方名称：(*)</div>
            <div class="loginFrame"><input type="text" size="30" width="200" height="30" value="<%=rs1.getString("UserName") %>" /></div>
        </div>
        <div class="line">
            <div class="registerWord">类型：(*)</div>
            <div class="loginFrame"><select name="Class">
        <option selected="selected">救助</option>
        <option>义工</option>
        <option>义卖/捐助</option>
        <option>讲座/沙龙</option>
        <option>志愿者市集</option>
        <option>其他</option>
      </select></div>
        </div>
        <div class="line">
            <div class="registerWord">联系电话：(*)</div>
            <div class="loginFrame"><input type="text" size="30" width="200" height="30" value="<%=rs1.getString("Tel") %>" /></div>
        </div>
        <div class="line">
            <div class="registerWord">地点：(*)</div>
          <div class="loginFrame"><select name="city" style="float:left;">
        <option selected="selected">北京</option>
        <option>上海</option>
        <option>重庆</option>
        <option>广州</option>
        <option>西安</option>
        <option>长沙</option>
        <option>杭州</option>
      </select> </div>
        </div>
        <div class="line2" style="clear:both;">
            <div class="registerWord">请提供有价值得资料：(*)</div>
            <div class="zhubanfangFrame">
              <textarea name="remark" cols="30" rows="6" ><%=rs1.getString("Remark") %></textarea>
            </div>
        </div>
        <div class="line2">
            <div class="registerWord">相关捐助链接：</div>
            <div class="zhubanfangFrame">
              <textarea name="link" cols="30" rows="6"></textarea>
            </div>
        </div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="确定" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div>
</div>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
