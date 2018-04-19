<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>温馨提醒</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/index.css" rel="stylesheet" type="text/css">  
        <link href="${ctxStaticMobile}/css/find.css" rel="stylesheet" type="text/css">  
    <style>
    .center{
    font-size: 16px;
     text-indent:10px;
    }
    
    a{
        color: #29b910;
    }
    .head{
        padding-top: 20px;
    }
    </style>
</head>
<body>
<div class="wrap_box">
<div class="center">
亲，你还没有登录呢，赶快去登录吧！
<a href="${ctxMobile}/login">去登录</a>
</div>
<div class="head">
  <p>推荐商户</p>
</div>
<c:forEach items="${bpage.list}" var="b" varStatus="sta" >
<div class="commercial" onclick="window.location.href='${ctxMobile}/businessDetail?id=${b.id }'">
    <img src="${b.logoId}" class="markimg">
    <div class="right_info">
       <p style="font-size:1.2em">${b.fullName }<span style="float:right"><input type="button" class="save" value="收藏"></span></p>
       <p>电话：${b.phone }</p>
       <p>地址：${b.address }</p>
       <p>
            	<c:forEach begin="1" end="5" step="1" var="num">
							<c:if test="${num gt b.star}">
							<span style="color:#333333">★</span>
							</c:if>
							<c:if test="${num le b.star}">
							<span style="color:#ec3b3b">★</span>
							</c:if>
							</c:forEach>
          <span class="readDiv">
            <img src="${ctxStaticMobile}/images/yulan1.png" class="read1"> 
            <span class="read2">${b.viewCount }</span>
            <img src="${ctxStaticMobile}/images/yulan2.png" class="read3"> 
            <span class="read4">${b.commentNum }</span>
          </span>
       </p>
    </div>
</div>
</c:forEach>
</div>
</body>
</html>





















