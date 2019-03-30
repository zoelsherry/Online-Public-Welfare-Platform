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
	<title>主办方详情</title>
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

<div class="leixing" style="height:1000px;">
	<%
		String sqlZ="select * from organizer";
		ResultSet rs1 = db.select(sqlZ);
		rs1.next();
		
		String UN=new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
		//
		System.out.println("UN");
		//
		ResultSet rs4=null;
		String sq="select * from organizer where UserName ='"+UN+"'";
		rs4=db.select(sq);
		rs4.next();	
		
		String sqlMember="select * from donation where RecipientID='"+rs4.getString("UserID")+"'";
		ResultSet rs2 = db.select(sqlMember); 
		int number=0;
		while(rs2.next()){ number++; }
	%>
    <div class="main">
   		<div class="leader">
       	  <div class="leaderPhoto"><img src="<%=rs4.getString("UserCover") %>" /></div>
<div class="leaderDetail">
            	<div class="leaderWord"><font color="#999999">主办方名称：</font><%=rs4.getString("UserName") %></div>
                <div class="leaderWord"><font color="#999999">主办方人数:</font><%=rs4.getInt("Number") %></div>
                <div class="leaderWord"><font color="#999999">公益类型:</font><%=rs4.getString("Class") %></div>
            	<div class="leaderWord"><font color="#999999">所在地区:</font><%=rs4.getString("City") %></div>
                <div class="leaderWord"><font color="#999999">电话：</font><%=rs4.getString("Tel") %></div>
                <div class="leaderWord"><font color="#999999">管理员姓名:</font><%=rs4.getString("AdminName") %></div>
                
            </div>
            <div class="leaderIn">
            	<div class="leaderWord" style="font-size:14px"><a href="jk-submit.jsp?userName=<%=rs4.getString("UserName") %>">>马上捐助</a></div>
            	<div class="leaderWord"><font color="#999999"><%=number %>人捐助</font></div>
            </div>
        </div><!--leader -->
        <div class="detail">
        	<div class="detailTitle">主办方简介</div>
            <div class="detailWord"><%=rs4.getString("Intro") %> </div>
        </div><!--detail -->
        <div class="member">
        	<div class="detailTitle">官方链接</div>
           	<div style=" margin-top:10px;"><a href="<%=rs4.getString("Remark") %></a>"><%=rs4.getString("Remark") %></a></div>
        </div><!--member -->
        
        <p></p>
         
        <p></p>
         
        
    </div><!--main -->
</div><!--leixing(left) -->

<div class="right">

    <div class="myPhoto">
    <%
    String sst="select * from organizer where UserMail ='"+session.getAttribute("UserMail")+"' and UserName='"+UN+"' ";
	ResultSet tt = db.select(sst);
	%>
	<% 
	if(tt.next())
	{ 
	%>
    <div><a href="hd-create.jsp?orgName=<%=rs4.getString("UserName") %>">+发起一个活动</a></div>
    <p></p>
   
    <div><a href="hd-app-juanzhu.jsp?orgName=<%=rs4.getString("UserName") %>"></a></div></div>
    <%}%>
    <div class="zhubanfang">
   	  <div class="myTitle">捐助记录</div>
   	  		<%	String donor="SELECT * FROM donation where RecipientID='"+rs4.getString("UserID")+"'";
				ResultSet rs3 = db.select(donor);  
				if(rs3.next())
				{
			%>
      <div class="hdJuanzhuList"><ul>
      		<div>时间______姓名______金额</div>
        	<li class="hdJuanzhu"><div class="hdJuanzhuTime"><%=rs3.getString("Time") %></div>
        	<div class="hdJuanzhuName"><%=rs3.getString("DonorName") %></div>
        	<div class="hdJuanzhuMoney"><%=rs3.getString("Amount") %></div>
            </li></ul>
      </div>
      <%} %>
        
    </div><!--zhubanfang -->
    <p align="right" class="myMore word"></p>
    
    <div class="zhubanfang">
   	  <div class="myTitle">发起过的活动记录</div>
   	  		<%
				String act="SELECT * FROM activity where OrgName='"+rs4.getString("UserName")+"'";
				ResultSet rs5 = db.select(act); 
		if(rs5.next()){
			
			%>
      <div class="hdJuanzhuList"><ul>
      <div>起始时间  终止时间</div>
       	<li class="hdJuanzhu"><div class="hdJuanzhuTime"><%=rs5.getString("StartTime") %></div><div class="hdJuanzhuTime"><%=rs5.getString("EndTime") %></div>
       	<div class="hdName word">活动名称<a href="hd-detail.jsp?actName=<%=rs5.getString("ActName") %>"><%=rs5.getString("ActName") %></a></div>
       	</li>
        </ul>
      </div>
      <%} %>
        
    </div><!--zhubanfang -->
    <p align="right" class="myMore word"></p>
</div><!--right -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
