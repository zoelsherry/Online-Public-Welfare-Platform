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
	<title>修改活动信息</title>
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
    <div class="loginTitle"><h1>修改活动信息</h1></div>
  <div class="huodongContent">
    	<form action="servlet/actRectify" method="post">
    	<%
		String title,orgName,actClass,startTime,endTime,address,intro,cover;
		String sqlAct="SELECT * FROM activity where ActName='"+request.getParameter("title")+"'";
		ResultSet rs1 = db.select(sqlAct);  
		String sqlMember="select * from actMember where ActName='"+request.getParameter("title")+"'";
		ResultSet rs2 = db.select(sqlMember); 
		int number=0;
		while(rs2.next()){ number++; }
		ResultSet rs3=db.select(sqlMember);
	%>
        <div class="line">
            <div class="registerWord">标题：</div>
            <div class="loginFrame"><input type="text" size="30" width="200" height="30" value="<%=rs1.getString("ActName") %>" /></div>
        </div>
        <div class="line">
            <div class="registerWord">类型：</div>
            <div class="loginFrame"><select name="leixing" height="30">
        <option selected="selected">救助</option>
        <option>义工</option>
        <option>义卖/捐助</option>
        <option>讲座/沙龙</option>
        <option>志愿者市集</option>
        <option>其他</option>
      </select></div>
        </div>
        <div class="line">
            <div class="registerWord">开始时间：</div>
            <div class="loginFrame"><input type="text" size="30" width="200" height="30" value="<%=rs1.getString("StartTime") %>" /></div>
        </div>
        <div class="line">
            <div class="registerWord">结束时间：(*)</div>
            <div class="loginFrame"><input type="text" size="30" width="200" height="30" value="<%=rs1.getString("EndTime") %>" /></div>
        </div>
        <div class="line">
            <div class="registerWord">地点：</div>
          <div class="loginFrame"><input type="text" size="20" width="100" height="30" style="margin-left:10px;" value="<%=rs1.getString("Address") %>" />
   		  </div>
        </div>
        <div class="line" style="clear:both;">
            <div class="registerWord">内容描述：</div>
            <div class="zhubanfangFrame">
              <textarea cols="30" rows="6" width="200" ><%=rs1.getString("Intro") %></textarea>
            </div>
        </div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="button" type="submit" value="确定" class="loginButton" />
            <input name="button" type="submit" value="删除" class="loginButton" style="margin-left:20px;" />
            </div>
        </div><!--content -->
        </form>
    </div>
</div>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
