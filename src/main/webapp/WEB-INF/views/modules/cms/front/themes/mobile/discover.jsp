<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>智慧社区首页-发现</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/find.css" rel="stylesheet" type="text/css">  
      <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
    <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
    <style>
      .c-message{
      margin-left: -135px !important;
    }
    </style>
    <script>
    
    function collect(bid){
    	event.stopPropagation();
    	var url="${ctxMobile}"+'/collect-'+bid+".json";
    	$.get(url,function(data){
    		if(data.msg=='nologin'){
    			$.message({
    		        message:'请先使用居民账户登录后再收藏该商户',
    		        type:'warning',
    		        time:'1000'
    		    });
    		}
    		else if(data.msg=='true'){
    				$.message({
    			        message:'收藏成功',
    			        type:'success',
    			        time:'1000'
    			    });
    			}else{
    				$.message({
    			        message:'你已经收藏了该商家',
    			        type:'error',
    			        time:'1000'
    			    });
    			}
    	})
    }
    </script>
</head>
<body>
<div class="wrap_box">
<!--头部部分开始-->
<div style="height:9vh;text-align:center">
	<img src="${ctxStaticMobile}/images/index/logo1.png" class="logo"/>
    <p class="title">智慧社区微门户</p>
</div>
<div style="clear:both"></div>
<!--头部部分结束-->     
<div class="types">
<c:forEach items="${categoryList}" var="c" varStatus="status" >
<c:if test="${status.index==0}">
 <a style="color:#FFF" href="${ctxMobile}/businessList"><div style="background:#FF6606" class="mark">
      <img src="${c.image}">
      <p>${c.name}</p>
   </div></a>
   </c:if>
   <c:if test="${status.index==1}">
  <a style="color:#FFF" href="${ctxMobile}/convenientList"> <div style="background:#FF6A94" class="mark">
     <img src="${c.image}">
      <p>${c.name}</p>
   </div></a>
   </c:if>
   <c:if test="${status.index==2}">
   <a style="color:#FFF" href="${ctxMobile}/promotionList"><div style="background:#77B4EB" class="mark">
     <img src="${c.image}">
      <p>${c.name}</p>
   </div></a>
   </c:if>
</c:forEach>
  
</div>

<div class="head">
  <p>推荐商户</p>
</div>
<c:forEach items="${bpage.list}" var="b" varStatus="sta" >
<div class="commercial" onclick="window.location.href='${ctxMobile}/businessDetail?id=${b.id }'">
    <img src="${b.logoId}" class="markimg">
    <div class="right_info">
       <p style="font-size:1.2em">${b.fullName }<span style="float:right"><input type="button" onclick="collect('${b.id}')" class="save" value="收藏"></span></p>
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


<div style="width:96vw;height:10vh;"></div>
<div class="footer_box" style=" position: fixed; bottom:0;width:100%">
   <a href="${ctxMobile}"><img src="${ctxStaticMobile}/images/bottom/pagehome1.png"/>首页</a>
     <a href="${ctxMobile}/discover" style="color: #ec3b3b;"><img src="${ctxStaticMobile}/images/bottom/service2.png"/>发现</a>
     <a href="${ctxMobile}/userMenu"><img src="${ctxStaticMobile}/images/bottom/me1.png"/>我的</a>
</div>
</div>
</body>
</html>





















