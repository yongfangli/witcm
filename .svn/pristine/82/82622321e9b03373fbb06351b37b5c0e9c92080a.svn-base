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
</head>

<body>
<div class="bigdiv">
     <!--头部标题-->
     <div class="top">
         <div class="top_cen">
           <p class="title" ><a href="${ctx}/itv/businessFather"><img class="return" src="${ctxStaticItv }/images/return.png" ></img> </a><span style="margin-left:40vw">促销信息</span></p>
    	 </div>
     </div>
     <!--中间内容-->
     <div class="middle">
        <div class="conten">
        <c:forEach items="${page.list}" var="pro" varStatus="status"> 
           <div class="titleArticle" onclick="window.location.href='${ctx}/itv/promotionDetail?id=${pro.id}'">
               <p>${fns:abbr(pro.titles ,150)}</p>
           </div>
           </c:forEach>
        </div>
     </div>
      <div class="last_page"><c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/promotion?pageNo=${page.prev}" >▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp;<c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/promotion?pageNo=${page.next}" >▼</a></c:if></div>
</div>
</body>
</html>