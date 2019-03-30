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
	<title>活动详情</title>
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

<div class="banner">
	<div class="titlePic"><a href="hd-index.jsp"><img src="images/tongcheng_03.gif" width="144" height="36" border="0" /></a></div>
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

<div class="leixing">
	<%
		String title,orgName,actClass,startTime,endTime,address,intro,cover;
		String sqlAct="SELECT * FROM activity where ActName='"+request.getParameter("ActName")+"'";
		ResultSet rs1 = db.select(sqlAct);  
		String sqlMember="select * from actMember where ActName='"+request.getParameter("ActName")+"'";
		ResultSet rs2 = db.select(sqlMember); 
		int number=0;
		while(rs2.next()){ number++; }
		ResultSet rs3=db.select(sqlMember);
	%>
	<div class="nav">
		<div class="myTitle"><%=rs1.getString("ActName") %></div>
    </div><!--nav -->
    <div class="main">
   		<div class="leader">
       	  <div class="leaderPhoto"><img src="<%=rs1.getString("Cover") %>" /></div>
            <div class="leaderDetail">
            	<div class="myTitle">活动宣传卡</div>
            	<div class="leaderWord"><font color="#999999">开始时间：</font><%=rs1.getString("StarTime") %></div>
                <div class="leaderWord"><font color="#999999">结束时间:</font><%=rs1.getString("EndTime") %></div>
            	<div class="leaderWord"><font color="#999999">地点:</font><%=rs1.getString("Address") %></div>
                <div class="leaderWord"><font color="#999999">主办方：</font><%=rs1.getString("OrgName") %></div>
                <div class="leaderWord"><font color="#999999">类型:</font><%=rs1.getString("ActClass") %></div>
                
            </div>
            <div class="leaderIn">
            	<div class="leaderWord" style="font-size:14px"><a href="client/joinZ.java?actName=<%=rs1.getString("ActName")%>">>我参加这个活动</a></div>
            	<div class="leaderWord"><font color="#999999"><%=number%>人参加</font></div>
            </div>
        </div><!--leader -->
        <div class="detail">
        	<div class="detailTitle">活动简介</div>
            <div class="detailWord">
            <%=rs1.getString("Intro") %>
            </div>
        </div><!--detail -->
        <div class="member">
        	<div class="detailTitle">参加活动的成员</div>
            <div class="memberList">
            <%
            	while(rs2.next()) {
            	String sqlCover="select Cover from organizer where UserName='"+rs2.getString("UserName")+"'";
            	ResultSet memberCover=db.select(sqlCover);
            %>
            <div align="center"><a href="information.jsp?userName=<%=rs2.getString("UserName")%>"><img src="<%=memberCover%>" border="0" /></a> </div>
              <div class="word zbfWord">
              <div align="center"><%=rs2.getString("UserName") %>></div>
              </div>
            <%} %>
          </div>
        </div><!--member -->
    </div><!--main -->
</div><!--leixing(left) -->

<div class="right">
	
    <div class="myPhoto"><img src="images/p949615082.jpg" /></div>
    	<div class="app"><a href="hd-rectify.jsp?ActName=<%=rs1.getString("ActName")%>">>修改活动信息</a></div>
</div><!--right -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
