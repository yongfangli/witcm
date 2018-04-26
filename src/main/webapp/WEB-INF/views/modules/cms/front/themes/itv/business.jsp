<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区商超</title>
 <link rel="stylesheet" href="${ctxStaticItv}/css/business.css" />
 <link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
 <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
  <link href="${ctxStaticTheme}/css/message.css" type="text/css" rel="stylesheet" />
  	<script src="${ctxStaticTheme}/js/message.js" type="text/javascript"></script>
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
 function collect(bid){
	 event.stopPropagation();
		var url="${ctx}"+'/itv/collect-'+bid+".json";
		$.get(url,function(data){
			if(data.msg=='nologin'){
				$.message({
			        message:'请先使用居民账户登录后再收藏该商户',
			        type:'warning',
			        time:'1000'
			    });
			}
			else if(data.msg=='true'){
					$.message({
 			        message:'收藏成功',
 			        type:'success',
 			        time:'1000'
 			    });
				}else{
					$.message({
 			        message:'你已经收藏了该商家',
 			        type:'error',
 			        time:'1000'
 			    });
				}
		})
	}
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
                "height":winH*0.93+"px",
                "marginTop":winH*0.05+"px",
                "marginBottom":winH*0.02+"px",
                "marginLeft":winW*0.02+"px",
                "width":(winW*0.8-2)*0.95+"px"
            });
            $(".left_content").css({
                "height":winH*0.84+"px",
                "marginBottom":winH*0.01+"px",
                "paddingTop":winH*0.02+"px",
                "marginTop":winH*0.02+"px"
            });
            $(".markDiv").css({
                "height":winH*0.277+"px"
            });

            $(".mark_left_img").css({"height":winH*0.23+"px"});
            $(".save").css({"height":winH*0.04+"px"});
            $(".read").css({"height":winH*0.02+"px"});
            $(".right_mark>p").css({"marginBottom":winH*0.02+"px"});



        })
    </script>

</head>

<body>
<div class="bigdiv">
    <!--左边列表cc-->
    <div class="list_left">
        <div class="title"><a href="${ctx}/itv/businessFather " id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a> 周边商户</div>
         <c:forEach items="${typeList}" var="btype" varStatus="status"> 
         <c:if test="${btype.id==type.id}">
        <p class="left_p left_pAct" onclick="window.location.href='${ctx}/itv/businessToggle?businessTypeId=${btype.id}'" tabindex="${status.index+1}">
           <span>${ btype.name}</span>
        </p>
        </c:if>
            <c:if test="${btype.id!=type.id}" >
        <p class="left_p " onfocus="window.location.href='${ctx}/itv/businessToggle?businessTypeId=${btype.id}'" tabindex="${status.index+1}">
           <span>${ btype.name}</span>
        </p>
        </c:if>
        </c:forEach>
    </div>
    <!--右边文章-->
    <div class="left_user">
      <div class="left_content">
        <div class="user_cont">
         <c:forEach items="${page.list}" var="bus" varStatus="status"> 
           <div class="markDiv">
           	<a class="div_focus" href="${ctx}/itv/businessDetail?businessId=${bus.id}" tabindex="${status.index+20}">
              <div class="mark_left_img head_focus">
             	 <img src="${bus.logoId}" class="mark_img" />
                     <%--<img src="${ctxStaticItv}/images/person.png" >--%>
              </div>
             </a>
              <div class="right_mark">
             	<p class="markName">${empty bus.fullName?bus.shortName:bus.fullName}
             	<span>
             	<c:forEach begin="1" end="5" step="1" var="num">
							<c:if test="${num gt bus.star}">
							<span class="grade-ignore">★</span>
							</c:if>
							<c:if test="${num le bus.star}">
							<span class="grade">★</span>
							</c:if>
							</c:forEach>
				</span>			
             	</p>
                <p class="markPhone">电话：${empty bus.phone?bus.telphone:bus.phone}</p>
                <p class="address">地址：${bus.address}</p>
                <p class="markSave clearfix">
                   <button class="save" onclick="collect('${bus.id}')" tabindex="${status.index+25}">收藏</button>
                   <span style="float:right;display: block;">
                   		<img src="${ctxStaticItv}/images/liulan.png" class="read" /> ${bus.viewCount } &emsp;
                        <img src="${ctxStaticItv}/images/read.png" class="read" /> ${bus.collectNum }
                   </span>
                </p>
              </div>
            
           </div>

             </c:forEach>
   <!--         <div class="markDiv2">
           	  <div class="mark_left_img">
             	 <img src="img/mark2.png" class="mark_img" />
              </div>
              <div class="right_mark">
             	<p class="markName">天虹<span class="grade">★ ★ ★ ★ ★</span></p>
                <p class="markPhone">电话：0791-88888888</p>
                <p class="address">地址：南昌市红谷滩新区红谷中大道1619号</p>
                <p class="markSave">
                   <button class="save">收藏</button>
                   <span style="float:right;">
                   		<img src="img/liulan.png" class="read" /> 168 &emsp;
                        <img src="img/read.png" class="read" /> 68
                   </span>
                </p>
              </div>
           </div>
           <hr class="hr"/> -->
   
         </div>
      </div>
     <div class="last_page"><c:if test="${!page.firstPage}"><a style="color: #101010;"  href="${ctx}/itv/businessToggle?businessTypeId=${type.id}&pageNo=${page.prev}"  class="head_focus" tabindex="50">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp;<c:if test="${!page.lastPage}"><a style="color: #101010;"  href="${ctx}/itv/businessToggle?businessTypeId=${type.id}&pageNo=${page.next}"  class="head_focus" tabindex="51">▼</a></c:if></div>
    </div>
</div>
</body>
</html>