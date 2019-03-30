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
	<title>我的同城</title>
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
  		ResultSet rs0=null;
  		String select="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
  		rs0=db.select(select);
  		rs0.next();		
  	%>
	<div class="top1"><a href="geren.jsp"><%=rs0.getString("UserName") %>的账号</a></div>
    <div class="top1"><a href="quit.jsp">退出</a></div>
    <!--  -->
    
    
</div>

<div class="banner">
	<div class="titlePic"><a href="hd-mine.jsp"><img src="images/huodong2_07.gif" border="0" /></a></div>
    <div class="citySelect"><form action="" method="get">
      <select name="city">
        <option selected="selected">北京</option>
        <option>上海</option>
        <option>重庆</option>
        <option>广州</option>
        <option>西安</option>
        <option>长沙</option>
        <option>杭州</option>
      </select>
    </form></div>
    <div class="titleRight">
    	<div class="title1 word"><a href="hd-index.jsp">同城活动</a></div>
    	<div class="title1 word"><a href="hd-mine.jsp">我的同城</a></div></div>
</div><!--banner -->
<%
	String sql="SELECT * FROM actMember,activity where actMember.ActName=activity.ActName and UserMail='"+session.getAttribute("UserMail")+"'";
	ResultSet rs = db.select(sql);  
%>
<div class="leixing">
<% while(rs.next()) {%>
	<div class="nav">
		<div class="myTitle">我参加的所有活动</div>
    </div><!--nav -->
    <div class="main">
   	  <div class="actLeft">
       	  <div class="actPhoto"><a href="hd-detail.jsp?title=<%=rs.getString("ActName")%>"><img src="<%=rs.getString("Cover")%>" width="85" height="112" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="hd-detail.jsp?title=<%=rs.getString("ActName")%>"><% out.print(rs.getString("ActName")+" "); %></a></div>
            <p class="actTime"><% out.print(rs.getString("StartTime")+" "); %>- <% out.print(rs.getString("EndTime")); %></p>
            <p class="actAdress"><% out.print(rs.getString("Address")+" "); %></p>
          </div>
      </div><!--actLeft -->
      <%if(rs.next()) { %>
    	<div class="actRight">
        	<div class="actPhoto"><a href="hd-detail.jsp?title=<%=rs.getString("ActName")%>"><img src="<%=rs.getString("Cover")%>" width="85" height="112" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="hd-detail.jsp?title=<%=rs.getString("ActName")%>"><% out.print(rs.getString("ActName")+" "); %></a></div>
            <p class="actTime"><% out.print(rs.getString("StartTime")+" "); %>- <% out.print(rs.getString("EndTime")); %></p>
            <p class="actAdress"><% out.print(rs.getString("Address")+" "); %></p>
          </div><%} %>
       </div><!-- -->
      
          <p align="right" class="myMore word"></p>
    </div><!--main -->
    <%}  %>
</div><!--leixing(left) -->

<div class="right">
	
    <div class="myPhoto"><img src="images/imgad.jpg" /></div>
    	
    <div class="zhubanfang">
    <%
		String sql1="SELECT * FROM followZ,users where followZ.UserName=users.UserName and UserMail='"+session.getAttribute("UserMail")+"'";
		ResultSet rs1 = db.select(sql1);  
	%>

        
        <p align="right" class="myMore word"></p>
    </div><!--zhubanfang -->
    
    <div class="app"><a href="zhubanfang-reg.jsp">>申请主办方</a></div>
</div><!--right -->

<%} %>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
