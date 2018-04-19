<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name }</title>
	<link href="${ctxStaticItv}/css/personlist.css" type="text/css" rel="stylesheet" />
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
    <!--左边列表-->
 <div class="list_left">
        <div class="title"><a id="return" href="${ctx}/itv/indexToggle?categoryId=${category.parent.id}"><img class="return" src="${ctxStaticItv }/images/return.png" ></img> </a> ${category.name}</div>
         <c:forEach items="${categoryList}" var="category" varStatus="status"> 
        <c:if test="${category.id==curId}">
        <p class="left_p left_pAct" onclick="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'">
           <span>${category.name }</span>
        </p>
        </c:if>
        <c:if test="${category.id!=curId}">
        <p class="left_p" onclick="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'">
           <span>${category.name }</span>
        </p>
        </c:if>
        </c:forEach>
    </div>
    <!--右边文章-->
        <div class="left_user">
      <div class="left_content">
       <div class="user_cont">
       <c:forEach items="${page.list}" var="article" varStatus="status"> 
       <div class="userDiv">
           <img onclick="window.location.href='${ctx}/itv/detail-${article.id}?urlFlag=category'" src="${article.image}" class="userimg" />
           <p class="username">${fns:abbr(article.title ,20)}</p>
         </div>
       </c:forEach>
        <!--循环开始-->
      <!--    <div class="userDiv">
           <img src="img/user.png" class="userimg" />
           <p class="username">代理名</p>
           <p style="font-size:1.4em">办公室主任</p>
           <p style="font-size:1.4em">18900000000</p>
         </div> -->
        <!--循环结束-->
         </div>
      </div>
     <div class="last_page"> <c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.prev}">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.next}">▼</a></c:if></div>
    </div>
</div>
</body>
</html>