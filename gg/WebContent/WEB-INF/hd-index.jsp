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
	<div class="titlePic"><a href="hd-index.html"><img src="images/tongcheng_03.gif" border="0" /></a></div>
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
    	<div class="title1 word"><a href="hd-index.html">同城活动</a></div>
    	<div class="title1 word"><a href="hd-mine.html">我的同城</a></div></div>
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
    <div class="main">
   	  <div class="actLeft">
       	  <div class="actPhoto"><img src="images/e439627.jpg" width="85" height="112" border="0" /></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">爱心传递 “京哈高速解救下来的520只狗狗物资紧急求助</a></div>
            <p class="actTime">2011年4月16日 周六 11:00 - 2011年5月15日 周日 17:30</p>
            <p class="actAdress">北京 海淀区 北清路皇后店北站</p>
          </div>
      </div><!--actLeft -->
    	<div class="actRight">
        	<div class="actPhoto"><a href="#"><img src="images/e438354.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">骑车行，北京－长沙</a></div>
            <p class="actTime">2011年4月22日 周五 07:00 - 2011年5月10日 周二 17:00</p>
            <p class="actAdress">北京 东城区 前门零里程碑</p>
          </div>
        </div><!--actRight -->
        <div class="actLeft">
       	  <div class="actPhoto"><img src="images/e437958.jpg" width="85" height="63" /></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">纪念玉树地震一周年，为灾区学校建设"阳光图书馆"</a></div>
            <p class="actTime">2011年4月8日 周五 10:00 -  2011年4月20日 周三 22:00</p>
            <p class="actAdress">北京 崇文区 雨枫书馆（新世界女子百货2F）</p>
          </div>
      </div>
    	<div class="actRight">
        	<div class="actPhoto"><a href="#"><img src="images/e423136.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">通州救助流浪猫狗的程阿姨和田阿姨</a></div>
            <p class="actTime">2011年4月3日 周日 19:00 - 2011年5月2日 周一 19:00</p>
            <p class="actAdress">北京 通州区 大营村（田阿姨）于家务（程阿姨）</p>
          </div>
       </div><!-- -->
       <div class="actLeft">
       	  <div class="actPhoto"><a href="#"><img src="images/e410270.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">计算机组2011年志愿者招募</a></div>
            <p class="actTime">2011年4月1日 周五 14:00 - 2011年4月30日 周六 20:00</p>
            <p class="actAdress">北京 东城区 阳光志愿者</p>
          </div>
      </div>
    	<div class="actRight">
        	<div class="actPhoto"><a href="#"><img src="images/e432367.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">“One Piece,One World”废纸重生计划【Need U】</a></div>
            <p class="actTime">2011年4月4日 周一 17:00 - 2011年5月1日 周日 00:00</p>
            <p class="actAdress">北京 环保无界限</p>
          </div>
       </div><!-- -->
       <div class="actLeft">
       	  <div class="actPhoto"><a href="#"><img src="images/e438907.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">岗位112号：iMART创意市集志愿者 </a></div>
            <p class="actTime">2011年4月14日 周四 23:00 - 2011年4月20日 周三 07:00</p>
            <p class="actAdress">北京 通州区 运河公园</p>
          </div>
      </div>
    	<div class="actRight">
        	<div class="actPhoto"><a href="#"><img src="images/e427933.jpg" border="0" /></a></div>
          <div class="actWord">
          	<div class="actTitle"><a href="#">【长期活动】“从心开始，给力2011”大型在线心理咨询</a></div>
            <p class="actTime">2011年3月28日 周一 10:00 - 2011年4月26日 周二 22:00</p>
            <p class="actAdress">北京 朝阳区 安立路68号亚运村飘亮阳光广场C2-2502室</p>
          </div>
       </div><!-- -->
          <p align="right" class="myMore word"></p>

    </div><!--main -->
</div><!--leixing(left) -->

<div class="right">
	<div class="myTongcheng">
    	<div class="myPhoto"><img src="images/imgad.jpg" /></div>
    	<div class="myTitle">我的同城公益活动</div>
        <p class="myAct">2011中国（北京）国际茶业及茶艺博览会</p>
        <p class="myAct">4/10[周日]自然大学草木学院：奥林匹克森林公园植物认知之旅</p>
        <p class="myAct">【大家国学】体会优雅，探寻诗源——一起来读《诗经》吧。</p>
        <p class="myAct">2011林生祥《大地书房》大陆巡演·北京站</p>
        <p class="myAct">《十年后》《中国姑娘》放映+演员黄璐、吕聿来Q&A</p>
        <p align="right" class="myMore word"></p>
    </div><!--myTongcheng -->
    <div class="zhubanfang">
    	<div class="myTitle">同城公益活动的主办方</div>
        <div class="zbf">
        	<div class="zbf1"><a href="#"><img src="images/photo/0b95206241cb46c.jpg" border="0" width="50" height="50" /></a>
       	    <div class="word zbfWord"><a href="#">达尔文自然求知社</a></div></div>
            <div class="zbf2"><a href="#"><img src="images/photo/p940048843.jpg" border="0" width="50" height="50" /></a>
       	  <div class="word zbfWord"><a href="#">流浪动物救助站</a></div></div>
        </div>
        <p align="right" class="myMore word"></p>
    </div><!--zhubanfang -->
    <div class="app"><a href="#">>申请主办方</a></div>
</div><!--right -->

<div class="bottom"></div>

</div><!--body -->
  </body>
</html>
