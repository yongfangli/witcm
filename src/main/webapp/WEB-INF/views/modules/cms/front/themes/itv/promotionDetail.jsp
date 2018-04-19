<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>促销信息</title>
	<link href="${ctxStaticItv}/css/detail.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	/* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
	 function placeholderPic(){
	 	var w = document.documentElement.offsetWidth;
	 	document.documentElement.style.fontSize=w/100+'px';
	 }
	 placeholderPic();
	 window.onresize=function(){
	 	placeholderPic();
	 };
	</script>
	
</head>
<body>
    <div class="bigdiv">
     <!--头部标题-->
     <div class="top">
         <div class="top_cen">
           <p class="title">
           <a href="${ctx}/itv/promotion"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a><span style="margin-left:25vw">${promotion.titles }</span></p>
    	 </div>
     </div>
     <!--中间内容-->
     <div class="middle">
        <div style="height:4vh"></div>
        <div class="conten">
           <p class="font">${promotion.contents}</p>
          <%-- <p class="font">如果好人的定义就是我对任何人所有的好是理所当然的话，那我宁可做个坏人。偶尔去做点好事，发发善心，最起码会有人记得我的好。若是人人口中的善人，做了一件有失他善意的事，他平时所做的好事都会被推翻，他会被认为是伪善，他会被打上伪君子的称号，人们宁可原谅一个十恶不赦的坏人，也无法容忍一个好人做了错事。</p>
            <img src="${ctxStaticItv}/images/conimg.png" class="con_img" />
            <img src="${ctxStaticItv}/images/conimg.png" class="con_img2" /> --%>
        </div>
     </div>
</div>
</body>
</html>