<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>个人信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/myself.css" rel="stylesheet" type="text/css">  
</head>
<body>
<div class="wrap_box">
   <div class="top">
   	<p class="return"></p>
      <c:if test="${not empty mobileuser}">
      	<img src="${mobileuser.imagesId }">
      	<p class="welcome">欢迎你，<span class="login">${mobileuser.name }</span></p>
      </c:if>
      <c:if test="${empty mobileuser}">
      	<img src="${ctxStaticMobile}/images/index/logo1.png">
      	<p class="welcome">智慧社区欢迎你，<span class="login" onclick="window.location.href='${ctxMobile}/login'">点击登录</span></p>
      </c:if>
   </div>
   <div class="mylist" style="margin-top: 3vh;" onclick="window.location.href='${ctxMobile}/userInfo'">
      <img src="${ctxStaticMobile}/images/userinfo.png">
      <p class="userinfo">个人信息</p>
      <p class="return2">></p>
   </div>
   <div class="mylist" onclick="window.location.href='${ctxMobile}/userFamily'">
      <img src="${ctxStaticMobile}/images/dangan2.png">
      <p class="userinfo">家庭档案</p>
      <p class="return2">></p>
   </div>
   <div class="mylist" onclick="window.location.href='${ctxMobile}/userHealth'">
      <img src="${ctxStaticMobile}/images/dangan.png">
      <p class="userinfo">健康档案</p>
      <p class="return2">></p>
   </div>
   <div class="mylist" onclick="window.location.href='${ctxMobile}/userPoints'">
      <img src="${ctxStaticMobile}/images/jifen.png">
      <p class="userinfo">个人积分</p>
      <p class="return2">></p>
   </div>
    <div class="mylist" onclick="window.location.href='${ctxMobile}/userOrder'">
      <img src="${ctxStaticMobile}/images/mark2.png">
      <p class="userinfo">预订商家</p>
      <p class="return2">></p>
   </div>
    <div class="mylist" onclick="window.location.href='${ctxMobile}/userCollect'">
      <img src="${ctxStaticMobile}/images/shoucang.png">
      <p class="userinfo">个人收藏</p>
      <p class="return2">></p>
   </div>
    <div class="mylist" onclick="window.location.href='${ctxMobile}/resPswd'">
      <img src="${ctxStaticMobile}/images/uppass.png">
      <p class="userinfo">修改密码</p>
      <p class="return2">></p>
   </div>
   
    
 <div style="height:11vh"></div>  
 <div class="footer_box" style=" position: fixed; bottom:0;width:100%">
     <a href="${ctxMobile}"><img src="${ctxStaticMobile}/images/bottom/pagehome1.png">首页</a>
     <a href="${ctxMobile}/discover"><img src="${ctxStaticMobile}/images/bottom/service1.png">发现</a>
     <a href="${ctxMobile}/userMenu" style="color: #ec3b3b;"><img src="${ctxStaticMobile}/images/bottom/me2.png">我的</a>
	</div> 
</div>
</body>
</html>
