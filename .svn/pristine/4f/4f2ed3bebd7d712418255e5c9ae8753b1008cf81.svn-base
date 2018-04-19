<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By 电信江西分公司</title>
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" type="image/x-icon">
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<sitemesh:head/>
	
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
	<script type="text/javascript">
	function collect(bid){
		var url="${ctx}"+'/collect-'+bid+".json";
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
	function search(){
		var content=$(".scontent").val();
		if(content==''||content.length>=200){
			$.message({
		        message:'请输入合理的搜索内容',
		        type:'error',
		        time:'1000'
		    });
		}
		else{
			window.location.href='${ctx}/search${fns:getUrlSuffix()}?content='+encodeURIComponent(encodeURIComponent(content));
		}
	}

    var navTimer;
    function hid(e){
       navTimer = setTimeout(function(){
           $(e).find(".child").hide();
		},100);
	}

    function show(e){
        clearTimeout(navTimer);
        $(e).siblings().find(".child").hide();
        $(e).find(".child").show();
	}


	</script>


	<script>
		$(function(){
			<%--动态判断底部信息的存放--%>
            isOverDoc();
		    $(window).resize(function(){
                isOverDoc();
            });

            function isOverDoc(){
                var winH = $(window).height();
                var docH = $('body').height() +80;//80是底部信息的高度，90是底部信息+10的高度
                if(docH > winH){
                    //内容框底部有无翻页数据时，不同的padding-bottom设置{

                    if($(".pagination").length >0 ){
                        $(".page-footer").prev().css("paddingBottom","150px");
                    }else{
                        $(".page-footer").prev().css("paddingBottom","100px");
					}
                }
            }
		})








	</script>
	
</head>
<body >
	 <!--头部-->
	   <div class="top clearfix">
			<div class="top_left">
				<div>
					<img src="${ctxStaticTheme}/images/logo.png" class="top_left_img">
					<b class="img_font">井冈山智慧社区</b>
				</div>
				<div>
					<input value="${searchName }" type="text" placeholder="请输入搜索内容" class="scontent">
					<img src="${ctxStaticTheme}/images/check.png" class="picimg" onClick="search()">
				</div>

			</div>
			
			<div class="top_right clearfix">
			   <div class="top_right_login">

			   		<c:if test="${empty bususer && empty resuser}">
						<input type="button" value="登录" class="top_login" onclick="window.location.href='${ctx}/bus/login'"/>
						<input type="button" value="注册" class="top_reg" onclick="window.location.href='${ctx}/res/register'"/>
					</c:if>
					<c:if test="${not empty bususer}">
						<div class="top_userinfo">
							<span>欢迎您：<a href="${ctx}/bus/busInfo">${bususer.shortName }</a></span>&nbsp;|
							<span><a href="${ctx}/bus/exits">退出</a></span>
						</div>
					</c:if>
					<c:if test="${not empty resuser}">
						<div class="top_userinfo">
							<span>欢迎您：<a href="${ctx}/res/resInfo">${resuser.name }</a></span>&nbsp;|
							<span><a href="${ctx}/bus/exits">退出</a></span>
						</div>
					</c:if>
				</div>

				<div class="top_right_img">
					<div class="top_weixin">
						<img src="${ctxStaticTheme}/images/weixin.png">
					</div>
					<div style="float:right;margin-left:15px">
						<img src="${ctxStaticTheme}/images/app.png" style="float:right">
					</div>
				</div>
				<!-- <div class="backLink" ><a class="backLinka" href="${pageContext.request.contextPath}${fns:getAdminPath()}">后台登录</a></div>	 -->
			</div>
	   </div>
	   <!--轮播图-->
		<div class="mar">
            <div class="js-silder">
   				<div class="silder-scroll">
				  <div class="silder-main">
				  <c:forEach items="${fnc:getMainFaceList('1', '城区鸟瞰图')}" var="article">
					 <div class="silder-main-img" style="background:url(${article.image}) center center no-repeat;background-size:cover;">
				       <%-- <img src="${article.image}" class="lun_mar"> --%>
			         </div>
			        </c:forEach>
				  </div>
				</div>
			</div>
		</div>
		<!--导航条-->
		<div class="navi_div">
			<div class="navi_middle">
				<ul>
				<a class="a-index" href="${ctx}"><li class="li"><div style="height:16px"></div>首页</li></a>
				  <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				  <li  onmousemove="show(this)" onmouseout="hid(this)" class="li"><div style="height:16px"></div>
				  <c:if test="${fnc:hasChild(category.id,site.id)=='1'}">
				  <a  >${category.name}</a>
				  </c:if>
				   <c:if test="${fnc:hasChild(category.id,site.id)=='0'}">
				  <a  target="_blank" href="${ctx}/alist-${category.id}-1-8${fns:getUrlSuffix()}">${category.name}</a>
				  </c:if>
				  <div style="height:16px"></div>
				  <div class="child">
				  <ul   class="child-ul">
				  <c:forEach items="${fnc:getCategoryList(site.id,category.id,-1, '')}" var="c" varStatus="status">
				  <li class="child-li"><div style="height:16px"></div>
				  <c:if test="${c.pcLink!=''&&c.pcLink!=null }">
				   <a target="_blank" href="${ctx}${c.pcLink}">${c.name}</a>
				  </c:if>
				  <c:if test="${c.pcLink==''||c.pcLink==null }">
				  <a target="_blank" href="${ctx}/alist-${c.id}-1-8${fns:getUrlSuffix()}">${c.name}</a>
		          </c:if>
				  </c:forEach>
				  </ul>
				 </div>
				  </li>
				  </c:forEach>
				</ul>
			</div>
		</div>
		<div class="contentss"  style="clear: both;">
			<sitemesh:body/>
		</div>


	 <%--底部固定信息（友情链接+技术支持）--%>
	 <div class="page-footer">
		 <!--友情链接-->
		 <div class="friend_link">
			 <ul class="clearfix">
				 <li class="lianjieli">友情链接：</li>
				 <c:forEach items="${fnc:getLinkInfoList()}" var="link" varStatus="status">
					 <li class="lianjieli"><a href="${link.urls}" target="_blank">${link.name }</a></li>
				 </c:forEach>
			 </ul>
		 </div>
		 <!--底部-->
		 <div class="company_bottom" style="">
			 Copyright ©123 2017 井冈山智慧社区管理系统 - Powered By 江西电信 V1.0
		 </div>
	 </div>
    

</body>
</html>