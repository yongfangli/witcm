<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${category.name}</title>
 <link rel="stylesheet" href="${ctxStaticItv}/css/titleOfArticle.css" />
	<link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
	 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>

    <script>
        $(function() {
            var winH = $(window).height();
            var winW = $(window).width();
            $(".bigdiv").height(winH);
            $(".top").height(winH * 0.11);
            $(".title").css("lineHeight", winH * 0.11 + "px");
            $(".middle").css({
                "height": winH * 0.72 + "px",
                "marginTop": winH * 0.03 + "px",
                "paddingTop": winH * 0.03 + "px",
                "paddingBottom": winH * 0.03 + "px",
                "marginBottom": winH * 0.03 + "px"
            });
            $(".title>a").css({
                "height": winH * 0.07 + "px",
                "marginTop": winH * 0.02 + "px"
            });
            $(".conten").css({
                "height": winH * 0.725 + "px"
            });
            $(".titleArticle").css({
                "height": winH * 0.07 + "px",
                "marginTop": winH * 0.03 + "px"
            });
            $(".titleArticle>p").css({
                "height": winH * 0.07 + "px",
                "lineHeight": winH * 0.07 + "px"
            });
        })
    </script>
</head>

<body>
<div class="bigdiv">
     <!--头部标题001-->
     <div class="top">
         <div class="top_cen">
           <p class="title" >
               <a href="${ctx}/itv/indexToggle?childId=${category.id}" tabindex="-1" id="itv_back">
                   <img class="return" src="${ctxStaticItv }/images/return.png" ></img>
               </a>
               <span >${category.name}</span></p>
    	 </div>
     </div>
     <!--中间内容111-->
     <div class="middle">
        <div class="conten">
        <c:forEach items="${page.list}" var="article" varStatus="status"> 
        	<a class="div_focus" href="${ctx}/itv/detail-${article.id}" tabindex="${status.index+1}">
           <div class="titleArticle">
               <p>
                   <span> ${fns:abbr(article.title ,150)}</span>
               </p>
           </div>
           </a>
           </c:forEach>
        </div>
     </div>
      <div class="last_page"><c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/indexToggle?categoryId=${category.id}&pageNo=${page.prev}"  class="head_focus" tabindex="50">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp;<c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/indexToggle?categoryId=${category.id}&pageNo=${page.next}"  class="head_focus" tabindex="51">▼</a></c:if></div>
</div>
</body>
</html>