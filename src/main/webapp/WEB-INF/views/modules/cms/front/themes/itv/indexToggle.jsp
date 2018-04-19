<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
 <link type="text/css" rel="stylesheet" href="${ctxStaticItv}/css/Pension.css" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
 
 
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
</head>

<body>
   <div class="bigdiv">
   	 <!--头部-->
     <jsp:include page="head.jsp" />
     <div class="clear"></div>
      
     <div class="middle">
       <c:if test="${!page.firstPage}">
        <div class="but_left"><a href="${ctx}/itv/indexToggle?categoryId=${categoryId}&pageNo=${page.prev}"><</a></div>
     </c:if>
       <c:if test="${page.firstPage}">
        <div style="width: 2vw;height: 1.5vh;float: left;"></div>
     </c:if>
     <c:forEach items="${page.list}" var="category"  varStatus="status">
	     <c:if test="${fn:length(page.list)==3}">
	     
		     <c:if test="${category.module=='link'}" >
		      <div style="margin-left:8vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/${category.href}'" id="menu_two_${status.index}">
		             <img src="${category.image}"/>
		             <p>${category.name}</p>
		     	 </div> 
		     </c:if>
		     <c:if test="${category.module!='link'}" >
		      <div style="margin-left:8vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" id="menu_two_${status.index}">
		             <img src="${category.image}"/>
		             <p>${category.name}</p>
		     </div> 
		     </c:if>
	     </c:if>
	     <c:if test="${fn:length(page.list)==4}">
	     
	     <c:if test="${category.module=='link'}" >
	      <div class="comDiv menu_two" onclick="window.location.href='${ctx}/${category.href}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     	 </div> 
	     </c:if>
	     <c:if test="${category.module!='link'}" >
	      <div class="comDiv menu_two" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     </div> 
	     </c:if>
	     </c:if>
	     <c:if test="${fn:length(page.list)==2}">
	     
	     <c:if test="${category.module=='link'}" >
	      <div style="margin-left:18vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/${category.href}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     	 </div> 
	     </c:if>
	     <c:if test="${category.module!='link'}" >
	      <div style="margin-left:18vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     </div> 
	     </c:if>
	     </c:if>
	     <c:if test="${fn:length(page.list)==1}">
	     
	     <c:if test="${category.module=='link'}" >
	      <div style="margin-left:35vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/${category.href}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     	 </div> 
	     </c:if>
	     <c:if test="${category.module!='link'}" >
	      <div style="margin-left:35vw" class="comDiv menu_two" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" id="menu_two_${status.index}">
	             <img src="${category.image}"/>
	             <p>${category.name}</p>
	     </div> 
	     
	     </c:if>
	     </c:if>
    </c:forEach>
     <c:if test="${!page.lastPage}">
        <div class="but_left"><a href="${ctx}/itv/indexToggle?categoryId=${categoryId}&pageNo=${page.next}">></a></div>
     </c:if>
     </div>
    
     <!--底部-->
     <jsp:include page="foot.jsp" />
     
   </div>
</body>
</html>