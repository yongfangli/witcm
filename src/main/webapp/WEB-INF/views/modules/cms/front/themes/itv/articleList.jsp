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

	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
    <script>
        $(function(){
            var cW = $(window).width();
            var _span = $(".titleArticle p").eq(0).find("span");
            var sW = _span.width();
            console.log("cW*0.82",cW*0.81);
            console.log("cW",cW);
            console.log("sW",sW);

            if(sW > cW*0.81){
                _span.closest(".titleArticle").append("<i>...</i>");
            }

        })
    </script>
</head>

<body>
<div class="bigdiv">
     <!--头部标题-->
     <div class="top">
         <div class="top_cen">
           <p class="title" ><a href="${ctx}/itv/indexToggle?childId=${category.id}"><img class="return" src="${ctxStaticItv }/images/return.png" ></img> </a><span style="margin-left:40vw">${category.name}</span></p>
    	 </div>
     </div>
     <!--中间内容111-->
     <div class="middle">
        <div class="conten">
        <c:forEach items="${page.list}" var="article" varStatus="status"> 
           <div class="titleArticle" onclick="window.location.href='${ctx}/itv/detail-${article.id}'">
               <p>
                   <span> ${fns:abbr(article.title ,150)}</span>
               </p>
           </div>
           </c:forEach>
        </div>
     </div>
      <div class="last_page"><c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/indexToggle?categoryId=${category.id}&pageNo=${page.prev}" >▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp;<c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/indexToggle?categoryId=${category.id}&pageNo=${page.next}" >▼</a></c:if></div>
</div>
</body>
</html>