<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<link href="${ctxStaticItv}/css/listDetail.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
    <link href="${ctxStaticItv}/css/scroll.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctxStaticItv}/js/iscroll.js"></script>
	<script type="text/javascript" src="${ctxStaticItv}/js/demoUtils.js"></script>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
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
	 window.onload=function(){
	 var myScroll;

	 
	 	myScroll = new IScroll('#wrapper');
	 
	 document.addEventListener('touchmove', function (e) { e.preventDefault(); }, isPassive() ? {
			capture: false,
			passive: false
		} : false);
	 };
	 $(function(){
		$(".menu_three_active").focus();
	 });
	</script>
    <script>
        $(function(){
            var winH = $(window).height();
            var winW = $(window).width();
            $(".bigdiv").height(winH);
            $(".list_left").height(winH);
            $(".left_content").height(winH);
            $(".title").css({
                    "height":winH*0.09+"px",
                    "lineHeight":winH*0.09 + "px",
                    "marginTop":winH*0.04+"px"
            });
            $(".left_p").css({
                "height":winH*0.06+"px",
                "lineHeight":winH*0.06 + "px"
            });
            $(".left_content").css({
                "height":winH*0.9+"px",
                "marginTop":winH*0.05+"px",
                "marginBottom":winH*0.05+"px",
                "marginLeft":winW*0.02+"px",
                "width":(winW*0.8-2)*0.95+"px"
            });
            $(".article").css({
                "height":winH*0.9+"px"
            });
            $(".font_title").css({
                "height":winH*0.1+"px",
                "lineHeight":winH*0.1 + "px"
            });
            $(".list_left_content").css({
                "height":winH+"px"
            });
            // $("#scroller").css("marginLeft",  -$("#scroller").width()/2+"px");

        })
    </script>
	<style>
        #scroller table{
           margin-top:30px;

        }
         img{
            border:none;
        }


    </style>
</head>
<body >
    <div class="bigdiv">
    <!--左边列表aa-->
    <div class="list_left">
        <div class="list_left_content">
            <div class="title"><a href="${ctx}/itv/indexToggle?childId=${category.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a> ${category.name}</div>
            <c:forEach items="${categoryList}" var="category" varStatus="status">
                <c:if test="${category.id==curId}">
                    <p class="left_p menu_three_active menu_three" onclick="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'" id="menu_three_${status.index}" tabindex="${status.index+1}">
                        <span>${category.name }</span>
                    </p>
                </c:if>
                <c:if test="${category.id!=curId}">
                    <p class="left_p menu_three" onfocus="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'" id="menu_three_${status.index}" tabindex="${status.index+1}">
                        <span>${category.name }</span>
                    </p>
                </c:if>
            </c:forEach>
        </div>

    </div>
    <!--右边文章-->
    <div class="left_content head_focus" tabindex="50">
    
       <div class="article" >
       <div id="wrapper">
        <div id="scroller">
        <c:forEach items="${page.list}" var="article" varStatus="status" end="0">
           <p class="font_title">${article.title}</p>
           <hr/>
           <p class="font">${article.articleData.content}</p>
          <%--  <p class="font">如果好人的定义就是我对任何人所有的好是理所当然的话，那我宁可做个坏人。偶尔去做点好事，发发善心，最起码会有人记得我的好。若是人人口中的善人，做了一件有失他善意的事，他平时所做的好事都会被推翻，他会被认为是伪善，他会被打上伪君子的称号，人们宁可原谅一个十恶不赦的坏人，也无法容忍一个好人做了错事。</p>
           <img src="${ctxStaticItv}/images/conimg.png" class="con_img" />
           <img src="${ctxStaticItv}/images/conimg.png" class="con_img2" /> --%>
       </c:forEach>
       </div>
       </div>
       </div>
    </div>
</div>
</body>
</html>