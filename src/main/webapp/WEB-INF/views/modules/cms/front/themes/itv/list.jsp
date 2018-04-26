<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name }</title>
	<link href="${ctxStaticItv}/css/list.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
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
                "width":(winW*0.8-2)*0.95+"px",
                "height":winH*0.95+"px",
                "marginLeft":winW*0.02+"px",
                "marginTop":winH*0.05+"px"
            });
            $(".content-wrap").css({
                "marginBottom":winH*0.03+"px"
            });
            $(".right_list p").css({
                "height":winH*0.06+"px",
                "lineHeight":  winH*0.06+"px"
            });
            // $(".font_title").css({
            //     "height":winH*0.1+"px",
            //     "lineHeight":winH*0.1 + "px"
            // });

        })
    </script>
    <style>
        .left_content{
            float:left;
        }
    </style>
	
</head>
<body>
    <div class="bigdiv clearfix">
    <!--左边列表123-->
 <div class="list_left">
        <div class="title"><a href="${ctx}/itv/indexToggle?childId=${category.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img>
</a> ${category.name}</div>
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
    <!--右边文章-->
    <%--<div style="width:79vw;height:100vh;float:left;">--%>
      <div class="left_content">
          <div class="content-wrap">
              <c:forEach items="${page.list}" var="article" varStatus="status">
              	<a class="div_focus" href="${ctx}/itv/detail-${article.id}?urlFlag=category" tabindex="${status.index+20}">
                  <div class="right_list">
                      <p>${fns:abbr(article.title ,100)}</p>
                  </div>
                  </a>
              </c:forEach>
          </div>
          <div class="last_page"> <c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.prev}" class="head_focus" tabindex="50">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.next}" class="head_focus" tabindex="51">▼</a></c:if></div>

      </div>
    <%--</div>--%>
</div>
</body>
</html>