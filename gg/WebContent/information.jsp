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
	<title>同城成员</title>
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
    
</div>

<div class="login">
    <div class="loginTitle">
    <%String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");%>
      <h1><a href="#"><%=userName %></a>的个人信息</h1>
    </div>
    <div class="registerContent">
    	<form action="" method="post">
    <%
		String sql="SELECT * FROM users where UserName='"+userName+"'";
		ResultSet rs1 = db.select(sql);  
		rs1.next();
	%>
        <div style="height:60px; width:100px; margin-bottom:20px; padding-left:24px; float:left; border-bottom:solid 1px #CCCCCC;">
            <img src="<%=rs1.getString("UserCover") %>" />
        </div>
        <div class="line" style="clear:both;">
            <div class="registerWord">邮箱：</div>
            <div class="loginFrame"><%=rs1.getString("UserMail") %></div>
        </div>
         <div class="line">
            <div class="registerWord">性别：</div>
            <div class="loginFrame"><%=rs1.getString("Sex") %></div>
        </div>
        <div class="line">
            <div class="registerWord">手机号：</div>
            <div class="loginFrame"><%=rs1.getString("Tel") %></div>
        </div>
        <div class="line">
            <div class="registerWord">居住城市：</div>
            <div class="loginFrame"><%=rs1.getString("City") %> </div>
        </div>
        <div class="line" style="clear:both">
        </div><!--content -->
        </form>
    </div>
    <div class="right">
	
    
        <div class="member" style="width:400px;">
        <div class="detailTitle" style="width:200px;">参加的活动</div>
        	<%
				String act="SELECT * FROM actMember where UserName='"+userName+"'";
				ResultSet rs4 = db.select(act);  
			%>
           <div class="memberList" style="height:100px;">
           <%	while(rs4.next()) { 
            	String sqlCover="select * from activity where ActName='"+rs4.getString("ActName")+"'";
            	ResultSet zhubanfangCover=db.select(sqlCover);
            	zhubanfangCover.next();
            %>
             <div align="center"><a href="hd-detail.jsp?title=<%=rs4.getString("ActName")%>"><img src="<%=zhubanfangCover.getString("Cover") %>" border="0" height="50" width="50" /></a> </div>
              <div class="word zbfWord">
                <div align="center" style="height:28px;overflow:hidden"><%=rs4.getString("ActName") %></div>
              </div>
          </div>
          <%} %>
          <div style="clear:both"></div>
        </div><!--member -->
</div><!--right -->
</div>
<%} %>
<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
