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
	<title>同城活动</title>
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
  	<div class="top1"><a href="login.jsp">登录</a></div>
  	<%}else {
  		ResultSet rs=null;
  		String select="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
  		rs=db.select(select);
  		rs.next();		
  	%>
	<div class="top1"><a href="geren.jsp"><%=rs.getString("UserName") %>的账号</a></div>
    <div class="top1"><a href="quit.jsp">退出</a></div>
    
     <%} %>
    <!--myTongcheng -->
 
	</div><!--myTongcheng -->



<div class="banner">
	<div class="titlePic"><a href="hd-index.jsp"><img src="images/tongcheng_03.gif" border="0" /></a></div>
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
	<div class="nav">
	<div class="lxWord word"><a href="hd-index.jsp">所有类型</a></div>
    <div class="lxWord word"><a href="hd-jiuzhu.jsp">救助</a></div>
    <div class="lxWord word"><a href="hd-yigong.jsp">义工</a></div>
    <div class="lxWord word"><a href="hd-yimai.jsp">义卖/捐助</a></div>
    <div class="lxWord word"><a href="hd-jiangzuo.jsp">讲座/沙龙</a></div>
    <div class="lxWord word"><a href="hd-volunteer.jsp">志愿者市集</a></div>
    <div class="lxWord word"><a href="hd-other.jsp">其他</a></div>
    </div><!--nav -->
    <%
		String sql="select * from activity";
		ResultSet rs0 = db.select(sql);
		///////////中途测试连接
	
%>
    <div class="main">
    <% while(rs0.next()) {%>
   	  <div class="actLeft">
       	  <div class="actPhoto"><a href="hd-detail.jsp?title=<%=rs0.getString("ActName")%>"><img src="<%=rs0.getString("Cover")%>" width="85" height="112" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="hd-detail.jsp?title=<%=rs0.getString("ActName")%>"><% out.print(rs0.getString("ActName")+" "); %></a></div>
            <p class="actTime"><% out.print(rs0.getString("StartTime")+" "); %>- <% out.print(rs0.getString("EndTime")); %></p>
            <p class="actAdress"><% out.print(rs0.getString("Address")+" "); %></p>
          </div>
      </div><!--actLeft -->
      <%if(rs0.next()) { %>
    	<div class="actRight">
        	<div class="actPhoto"><a href="hd-detail.jsp?title=<%=rs0.getString("ActName")%>"><img src="<%=rs0.getString("Cover")%>" width="85" height="112" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="hd-detail.jsp?title=<%=rs0.getString("ActName")%>"><% out.print(rs0.getString("ActName")+" "); %></a></div>
            <p class="actTime"><% out.print(rs0.getString("StartTime")+" "); %>- <% out.print(rs0.getString("EndTime")); %></p>
            <p class="actAdress"><% out.print(rs0.getString("Address")+" "); %></p>
          </div><%} %>
       </div><!-- -->

	<%}  %>
    </div><!--main -->
</div><!--leixing(left) -->

<div class="right">
	<!--myTongcheng -->
	<div class="myTongcheng">
	<div class="myPhoto"><img src="images/imgad.jpg" /></div>
	<div class="myTitle">我的同城公益活动</div>
	<!--myTongcheng -->
	<% 
	String sqlAct="SELECT * FROM actMember,activity where actMember.ActName=activity.ActName and UserMail='"+session.getAttribute("UserMail")+"'";
	ResultSet rs1 = db.select(sqlAct);  
	while(rs1.next()) {%>
        <p class="myAct"><a href="hd-detail.jsp?title=<%=rs1.getString("ActName")%>"><% out.print(rs1.getString("ActName")+" "); %></a></p>
        <%} %>
        <p align="right" class="myMore word"></p>
</div><!--myTongcheng -->

    <div class="zhubanfang">
    	<div class="myTitle">同城公益活动的主办方</div>
    	<%
			String sqlZ="select * from organizer";
			ResultSet rs2 = db.select(sqlZ);  
		%>
        <div class="zbf">
        <% while(rs2.next()) {%>
        	<div class="zbf1"><a href="zhubanfang-detail.jsp?title=<%=rs2.getString("UserName")%>"><img src="<%=rs2.getString("UserCover")%>" border="0" width="50" height="50" /></a>
       	    <div class="word zbfWord"><a href="zhubanfang-detail.jsp?title=<%=rs2.getString("UserName")%>"><%=rs2.getString("UserName")%></a></div></div>
       	    <%if(rs2.next()) {%>
            <div class="zbf2"><a href="zhubanfang-detail.jsp?title=<%=rs2.getString("UserName")%>"><img src="<%=rs2.getString("UserCover")%>" border="0" width="50" height="50" /></a>
       	  <div class="word zbfWord"><a href="zhubanfang-detail.jsp?title=<%=rs2.getString("UserName")%>"><%=rs2.getString("UserName")%></a></div></div>
       	  <%} 
		}%>
        </div>
        <p align="right" class="myMore word"></p>
    </div><!--zhubanfang -->
    <div class="app"><a href="zhubanfang-reg.jsp">>申请主办方</a></div>
</div><!--right -->

<div class="bottom"></div>
</div>
<!--body -->
  </body>
</html>
