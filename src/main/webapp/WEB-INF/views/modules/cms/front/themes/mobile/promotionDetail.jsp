<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>促销详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/street.css" rel="stylesheet" type="text/css"> 
    <link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
     <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
    <link href="${ctxStaticMobile}/css/community.css" rel="stylesheet" type="text/css">
    <link href="${ctxStaticMobile}/css/Community_affairs.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
   </script>
</head>
<body >
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but"  href="javascript:history.back(-1)"><</a>
     <p class="nav_title">促销详情</p>
   </div>
     <!---内容开始-->
	<div class="news_title_box">
       <h1 class="news_title" style="font-size: 0.32rem">${promotion.titles}</h1>
       <div style="height:2vh"></div>
   </div>
   <p class="issuer">
   		<span class="issuers">发布商家：${promotion.business.fullName}</span>
  	 	<span class="times">发布时间：<fmt:formatDate value="${promotion.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
   </p>
   <div style="height:4vh"></div>
   <div class="content">
     <p style="text-indent:2em;margin-top:1vh">
     ${promotion.contents}
     </p>
   </div>
 </div>
 </body>
</html>





















