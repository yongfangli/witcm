<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/index.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
	 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
		<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStaticTheme}/js/wySilder.min.js" type="text/javascript"></script>
	<script src="${ctxStaticTheme}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	 <link href="${ctxStaticTheme}/css/common.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	jQuery(".slideGroup .slideBox").slide({ mainCell:"ul",vis:5,prevCell:".sPrev",nextCell:".sNext",effect:"leftLoop",autoPlay:true});

	/* 外层tab切换 */
   jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"});
	$(function (){
		$(".js-silder").silder({
			auto: true,//自动播放，传入任何可以转化为true的值都会自动轮播
			speed: 20,//轮播图运动速度
			sideCtrl: true,//是否需要侧边控制按钮
			bottomCtrl: true,//是否需要底部控制按钮
			defaultView: 0,//默认显示的索引
			interval: 300000,//自动轮播的时间，以毫秒为单位，默认3000毫秒
			activeClass: "active",//小的控制按钮激活的样式，不包括作用两边，默认active
		});
	});
	</script>
	<script>
		$(function(){

		    var winH = $(window).height();
		    var winW = $(window).width();
		    $(".top").height(winH*0.15);
		    $(".top").css("lineHeight",winH*0.15+"px");
		    $(".bigdiv").height(winH);
		    $(".middle").height(winH*0.7);
		    $(".bottom").height(winH*0.15);
            $(".bottom").css("lineHeight",winH*0.15+"px");

            $(".tvimg").width(winW*0.9-50-200+"px");

            var len = $(".bottom").find(".bomHref").length;
            $(".bomHref").width(1/len*100 +"%");
		})
	</script>
	<style>
		.lun_mar {
		height: 420px;
		}
		.top{
			width:96%;
			margin:0 auto;
		}
		.middle{
			position: relative;
		}
		.con_top,.con_bom{
			width:160px;
			height:160px;
			padding:20px;
		}
		.con_top{
			margin-bottom:20px;
		}
		.silder-ctrl-prev>span, .silder-ctrl-next>span{
			margin-top:-210px;
		}
		.silder-main-img img{
			border:none;
		}

	</style>
</head>
<body>
    <div class="bigdiv">
   	 <!--头部-->
     <jsp:include page="head.jsp" />
        
     <div class="clear"></div>
     <!--中间--> 
     <div class="middle">
       	<div class="mid_con_tour clearfix">
            <div class="tvimg">
              <!--轮播图-->
		<div class="mar" style="height: 420px;">
            <div class="js-silder">
   				<div class="silder-scroll">
				  <div class="silder-main">
				  <c:forEach items="${articleList}" var="article" begin="0" end="7">
				     <c:if test="${not empty article.image}">
					 <div class="silder-main-img" >
				        <img src="${article.image}" class="lun_mar">
			         </div>
			         </c:if>
			        </c:forEach>
				  </div>
				</div>
			</div>
		</div>
            </div>
	        <div class="contentTourList">
	        <c:forEach items="${categoryList}" var="category" varStatus="status" >
              <c:if test="${status.index%2==0}">
               <div class="con_top" style="background:#3D9972" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" tabindex="11">
                 <img src="${category.image}" class="content_img" />
                 <br/><br/>
              	 <p>${category.name }</p>
               </div>
               </c:if>
               <c:if test="${status.index%2!=0}">
               <div class="con_bom" style="background:#FF6606" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'" tabindex="12">
                 <img src="${category.image}" class="content_img" />
                 <br/><br/>
              	 <p>${category.name }</p>
               </div></c:if>
               </c:forEach>
            </div>
       </div>
     </div>
    <!--底部-->
     <jsp:include page="foot.jsp" />
     
   </div>
</body>
</html>