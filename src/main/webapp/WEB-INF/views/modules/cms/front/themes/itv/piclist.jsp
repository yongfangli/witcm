<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name }</title>
	<link href="${ctxStaticItv}/css/personlist.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
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
		$(".left_pAct").focus();
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
                "height":winH*0.86+"px",
                "marginTop":winH*0.05+"px",
                "marginBottom":winH*0.02+"px",
                "marginLeft":winW*0.02+"px",
                "width":(winW*0.8-2)*0.95+"px"
            });
            $(".userDiv").css({
                "height":winH*0.38+"px",
                "marginTop":winH*0.031+"px",
                // "marginBottom":winH*0.05+"px",
                // "marginLeft":winW*0.02+"px",
                // "width":(winW*0.8-2)*0.95+"px"
            });
            $(".imgWrap").css({
                "height":winH*0.3+"px"
                // "marginTop":winH*0.04+"px"
            });


        })
    </script>
	
</head>
<body>
    <div class="bigdiv">
    <!--左边列表zz-->
 <div class="list_left">
        <div class="title"><a href="${ctx}/itv/indexToggle?categoryId=${category.parent.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img> </a> ${category.name}</div>
         <c:forEach items="${categoryList}" var="category" varStatus="status"> 
        <c:if test="${category.id==curId}">
        <p class="left_p left_pAct" onclick="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'" tabindex="${status.index+1}">
           <span>${category.name }</span>
        </p>
        </c:if>
        <c:if test="${category.id!=curId}">
        <p class="left_p" onfocus="window.location.href='${ctx}/itv/categoryToggle?categoryId=${category.id}'" tabindex="${status.index+1}">
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
       <a class="div_focus" href="${ctx}/itv/detail-${article.id}?urlFlag=category" tabindex="${status.index+10}">
       	<div class="userDiv">
           <div class="userDivContent">
               <div class="imgWrap">
                       <img onclick="window.location.href='${ctx}/itv/detail-${article.id}?urlFlag=category'" src="${article.image}" class="userimg" />
           		<%--<img src="${article.image}" class="userimg" />--%>

               </div>
               <p class="username">${fns:abbr(article.title ,20)}</p>
           </div>
         </div>
         </a>
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
     <div class="last_page"> <c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.prev}" class="head_focus" tabindex="50">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.next}" class="head_focus" tabindex="51">▼</a></c:if></div>
    </div>
</div>
</body>
</html>