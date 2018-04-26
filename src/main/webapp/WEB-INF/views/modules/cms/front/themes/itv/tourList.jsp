<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${category.name }</title>
 <link rel="stylesheet" href="${ctxStaticItv}/css/tour.css" />
 <link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
<script>
 /* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
 function placeholderPic(){
  var w = document.documentElement.offsetWidth;
  document.documentElement.style.fontSize=w/100+'px';
 }
 placeholderPic();
 window.onresize=function(){
  placeholderPic();
 }
	var flag='${flag}';
    function tourist(obj){
		 if(obj==1){
			$(".content").show();
			$(".touristImg").hide();
			$("#seller").attr("class", "seller");
			$("#goods").attr("class", "goods");
			$(".last_page").hide();
			flag='0';
		}else{
			$(".content").hide();
			$(".touristImg").show();
			$("#seller").attr("class", "goods");
			$("#goods").attr("class", "seller");
			$(".last_page").show();
			flag='1';
			}
		
	 }
    function prev(obj){
		obj=obj+"&flag="+flag;
		window.location.href=obj;
	}
    $(function(){
		$(".left_pAct").focus();
	 });
</script>
	<script type="text/javascript">
        $(function(){
            var winH = $(window).height();
            var winW = $(window).width();
            $(".bigdiv").height(winH);
            $(".list_left").height(winH);
            $(".title").css({
                "height":winH*0.09+"px",
                "lineHeight":winH*0.09 + "px",
                "marginTop":winH*0.04+"px"
            });
            $(".left_p").css({
                "height":winH*0.06+"px",
                "lineHeight":winH*0.06 + "px"
            });
            $(".left_user").css({
                "width":(winW*0.8-2)+"px"
            });
            $(".left_content").css({
                "height":winH*0.88+"px",
                "marginBottom":winH*0.04+"px",
                "marginTop":winH*0.04+"px",
                "paddingTop":winH*0.04+"px"
            });
            $(".seller,.goods").height(winH*0.06);
            $(".content,.touristImg").css({
                "height":winH*0.78+"px",
                "paddingTop":winH*0.02+"px"
            });
            $(".touristimg1,.touristimg2,.touristimg3").css({
                "height":winH*0.34+"px",
                "marginTop":winH*0.02+"px"
            });
            $(".timg").height(winH*0.34);

        })
    </script>
 
</head>

<body>
<div class="bigdiv">
    <!--左边列表ss-->
    <div class="list_left">
        <div class="title"><a   href="${ctx}/itv/indexToggle?categoryId=${category.parent.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a>${category.name }</div>
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
      <c:if test="${flag=='0'}">
      	<button onclick="tourist(1)" id="seller" class="seller">景点介绍</button>
        <button onclick="tourist(2)" id="goods" class="goods">景点风貌</button>
        </c:if>
           <c:if test="${flag=='1'}">
      	<button onclick="tourist(1)" id="seller" class="goods">景点介绍</button>
        <button onclick="tourist(2)" id="goods" class="seller">景点风貌</button>
        </c:if>
             <c:if test="${flag=='0'}">
        <div class="content">
            
            <p class="font">${dec }</p>
            </div>
      <div class="touristImg" style="display:none">

            <c:forEach items="${page.list}" var="article" varStatus="status"> 
              <div class="touristimg${status.index+1}">
    			<img src="${article.image}" class="timg" />

              </div>
              </c:forEach>
            </div>
            <div class="last_page" style="display:none">
   <c:if test="${!page.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.prev}')" href="javascript:void(0)">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.next}')" href="javascript:void(0)">▼</a></c:if>
</div>
</c:if>
       <c:if test="${flag=='1'}">
        <div class="content" style="display:none">
            <div style="height:2vh"></div>
            <p class="font">${dec }</p>
            </div>
      <div class="touristImg" >
            <div style="height:2vh"></div>
            <c:forEach items="${page.list}" var="article" varStatus="status"> 
              <div class="touristimg${status.index+1}">
    			<img src="${article.image}" class="timg" />
              </div>
              </c:forEach>
            </div>
            <div class="last_page" >
   <c:if test="${!page.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.prev}')" href="javascript:void(0)">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/categoryToggle?categoryId=${curId}&pageNo=${page.next}')" href="javascript:void(0)">▼</a></c:if>
</div>
</c:if>
      </div>
    </div>
</div>
</body>

</html>