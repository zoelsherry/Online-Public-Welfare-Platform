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
	<title>主办方资格申请</title>
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
    <div class="loginTitle"><h1>主办方资格申请</h1></div>
    <div class="zhubanfangContent" style="height:900px;">
    	<form id="form" name="form" action="servlet/registerZ" method="post">
        <div class="line">
            <div class="registerWord">邮箱：(*)</div>
            <div class="loginFrame"><input name="Mail" value=<%= session.getAttribute("UserMail")%> type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">主办方名称：(*)</div>
            <div class="loginFrame"><input name="Name" type="text" size="30" width="200" height="30" /></div>
        </div>
        
        
        <div class="line">
            <div class="registerWord">主办方人数：</div>
            <div class="loginFrame">
              <input name="Number" type="text" size="30" width="200" height="30"  />
            </div>
        </div>
        <div class="line" style="height:100px;">
            <div class="registerWord">公益类型：(*)</div>
            <div class="loginFrame">
              	<div class="zbfCheckBox"><input name="Class" type="checkbox" value="自然" />自然</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="环保" />环保</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="动物" />动物</div>
                <div class="zbfCheckBox" style="clear:both;"><input name="Class" type="checkbox" value="儿童" />儿童</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="助老" />助老</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="助残" />助残</div>
                <div class="zbfCheckBox" style="clear:both;"><input name="Class" type="checkbox" value="文化" />文化</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="社会" />社会</div>
                <div class="zbfCheckBox"><input name="Class" type="checkbox" value="支教" />支教</div>
                <div class="zbfCheckBox" style="clear:both;"><input name="Class" type="checkbox" value="其他" />其他</div>
            </div>
        </div>
        <div class="line">
            <div class="registerWord">所在地区：(*)</div>
            <div class="loginFrame"><select name="City">
       <option selected="selected" value="北京">北京</option>
        <option value="上海">上海</option>
        <option value="重庆">重庆</option>
        <option value="广州">广州</option>
        <option value="西安">西安</option>
        <option value="长沙">长沙</option>
        <option value="杭州">杭州</option>
      </select></div>
        </div>
        <div class="line">
            <div class="registerWord">联系电话：(*)</div>
            <div class="loginFrame"><input name="Tel" type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">管理员姓名：(*)</div>
            <div class="loginFrame"><input name="AdminName" value=<%= rs.getString("UserName")%> type="text" size="30" width="200" height="30" /></div>
        </div>
        <div class="line">
            <div class="registerWord">主办方简介：(*)</div>
            <div class="zhubanfangFrame">
              <textarea name="Intro" cols="30" rows="6"  ></textarea>
            </div>
        </div>
        <div class="line">
        	<div class="registerWord">头像：</div>
            <div class="loginFrame"><input name="Cover" type="text" size="30" width="200" height="30" type="file" /></div>
		</div>
       <div class="line2" style="clear:both;">
            <div class="registerWord">请提供有价值得资料：</div>
            <div class="zhubanfangFrame">
              <textarea name="Remark" cols="30" rows="6"  ></textarea>
            </div>
        </div>
        <div class="line2">
            <div class="registerWord">相关捐助链接：</div>
            <div class="zhubanfangFrame">
              <textarea name="Link" cols="30" rows="6"  ></textarea>
            </div>
        </div>
        <div class="line" style="clear:both">
          <div align="center">
            <input name="input" type="submit" value="申请" class="loginButton" />
            </div>
        </div><!--content -->
        </form>
    </div>
    
</div>

<div class="bottom"></div>

</div><!--body -->
  </body>
  <%} %>
</html>
