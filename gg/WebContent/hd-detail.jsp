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
    <div class="citySelect">
    <form action="" method="get">
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
	
		String UN=new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
		
		String sqlAct="SELECT * FROM activity where ActName='"+UN+"'";
		ResultSet rs1 = db.select(sqlAct);
		////
		
		/////
		rs1.next();
		System.out.println(rs1.getString("ActName"));
		////
		String sqlMember="select * from actMember where ActName='"+UN+"'";
		ResultSet rs2 = db.select(sqlMember); 
		int number=0;
		while(rs2.next()){ number++; }
	
		//ResultSet rs3=db.select(sqlMember);
	%>
	<div class="nav">
		<div class="myTitle"><%= rs1.getString("ActName")%></div>
    </div><!--nav -->
    <div class="main">
   		<div class="leader">
       	  <div class="leaderPhoto"><img src="<%= rs1.getString("Cover") %>" /></div>
            <div class="leaderDetail">
            	<div class="myTitle">活动宣传卡</div>
            	<div class="leaderWord"><font color="#999999">开始时间：</font><%=rs1.getString("StartTime") %></div>
                <div class="leaderWord"><font color="#999999">结束时间:</font> <%=rs1.getString("EndTime") %></div>
            	<div class="leaderWord"><font color="#999999">地点:</font><%=rs1.getString("Address") %></div>
                <div class="leaderWord"><font color="#999999">主办方：</font><%=rs1.getString("OrgName") %></div>
                <div class="leaderWord"><font color="#999999">类型:</font><%=rs1.getString("ActClass") %></div>
                
            </div>
            <div class="leaderIn">
            	<div class="leaderWord" style="font-size:14px"><a href="join.jsp?act=<%= UN%>">>我参加这个活动</a></div>
            	<div class="leaderWord"><font color="#999999"><%=number%>人参加</font></div>
            	<p></p>
            	<%
            	if(session.getAttribute("UserMail")!=null){
            	String qq="select * from organizer where UserMail ='"+session.getAttribute("UserMail")+"'";
            	ResultSet qq1= db.select(qq); 
            	if(qq1.next()){
   				String sst="select * from activity where OrgName ='"+qq1.getString("UserName")+"' and ActName='"+UN+"' ";
   				
				ResultSet tt=null;
				tt = db.select(sst);
				%>
				<% 
				if(tt.next())
				{ %>
            	<div class="leaderWord" style="font-size:14px"><a href="modifyA.jsp?act=<%= UN%>">>修改这个活动</a>
            	</div>
            	<%} %>
            	<%} %>
            	<%} %>
            </div>
        </div><!--leader -->
        <div class="detail">
        	<div class="detailTitle">活动简介</div>
            <div class="detailWord"><%=rs1.getString("Intro") %></div>
        </div><!--detail -->
        <div class="member">
        	<div class="detailTitle">参加活动的成员</div>
            <div class="memberList">
            <%
            	String sq="select * from actMember where ActName='"+UN+"'";
    			ResultSet rs3 = db.select(sq); 
            	while(rs3.next()) {
            	String sqlCover="select UserCover from users where UserName='"+rs3.getString("UserName")+"'";
            	ResultSet memberCover=db.select(sqlCover);
            	memberCover.next();
            	System.out.println("dddd");
            %>
              <div align="center"><a href="information.jsp?userName=<%=rs3.getString("UserName")%>"><img src="<%=memberCover.getString("UserCover")%>" border="0" /></a> </div>
              <div class="word zbfWord">
              <div align="center"><%=rs3.getString("UserName") %>></div>
              </div>
              <%} %>
          </div>
        </div><!--member -->
    </div><!--main -->
</div><!--leixing(left) -->

<div class="right">
	
 
</div><!--right -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
