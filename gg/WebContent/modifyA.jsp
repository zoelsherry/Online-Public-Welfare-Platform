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
	<title>修改发布的同城活动</title>
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
<%	String UN=new String(request.getParameter("act").getBytes("ISO-8859-1"),"utf-8");
	String se="select * from activity where ActName ='"+UN+"'";
	ResultSet cc=null;
	cc=db.select(se);
	cc.next();
	%>
<div class="login">
    <div class="loginTitle"><h1>修改发布的同城活动</h1></div>
  	<div class="huodongContent" style="height:900px;">
    	<form id="form" name="form" method="post" action="servlet/modifyAct">
    	<div class="line">
    	 <div class="registerWord">主办方：(*)</div>
    	<div class="loginFrame"><input name="orgName"  type="text" value=<%= cc.getString("OrgName")%> size="30" width="200" height="30"/></div>
    	</div>
        <div class="line">
            <div class="registerWord">标题：(*)</div>
            <div class="loginFrame"><input name="actName" type="text" value=<%= cc.getString("ActName")%> size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">类型：(*)</div>
            <div class="loginFrame"><select name="class">
        <option selected="selected">救助</option>
        <option>义工</option>
        <option>义卖/捐助</option>
        <option>讲座/沙龙</option>
        <option>志愿者市集</option>
        <option>其他</option>
      </select></div>
        </div>
        <div class="line">
            <div class="registerWord">开始时间：(*)</div>
            <div class="loginFrame"><input name="startTime" type="text" value=<%= cc.getString("StartTime")%> size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">结束时间：(*)</div>
            <div class="loginFrame"><input name="endTime" type="text" value=<%= cc.getString("EndTime")%> size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">地点：(*)</div>
            <div class="loginFrame"><input name="address" type="text" value=<%= cc.getString("Address")%> size="30" width="200" height="30" /></div>
        </div>
       
       <div class="line">
        	<div class="registerWord">头像：</div>
            <div class="loginFrame"><input name="cover" type="text" value=<%= cc.getString("Cover")%> size="30" width="200" height="30" type="file" /></div>
		</div>
		
        <div class="line" style="clear:both;">
            <div class="registerWord">内容描述：(*)</div>
            <div class="zhubanfangFrame">
              <textarea name="intro" cols="30" rows="6" ></textarea>
           </div>
        </div>
        
        
        
       <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="确定修改" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div>
</div>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
