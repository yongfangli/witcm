<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By 电信江西分公司</title>
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" type="image/x-icon">
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<!-- Baidu tongji analytics --><script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
	<sitemesh:head/>
	<style>
	.toggle{
	    background-color: #ec3b3b;
	  color:#fff
	}
	</style>
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
		$(function(){
			var pageName='${pageName}';
			/* if(pageName==''||pageName==null){
				$(".a-index li").addClass("toggle");
			} */
			 if(pageName=='news'){
				$(".a-news li").addClass("toggle");
			}
			else if(pageName=='trends'){
				$(".a-trends li").addClass("toggle");
			}
			else if(pageName=='legal'){
				$(".a-legal li").addClass("toggle");
			}
			else if(pageName=='guide'){
				$(".a-guide li").addClass("toggle");
			}
			else if(pageName=='facts'){
				$(".a-facts li").addClass("toggle");
			}
			else if(pageName=='faces'){
				$(".a-faces li").addClass("toggle");
			}
			else if(pageName=='activity'){
				$(".a-activity li").addClass("toggle");
			}
		});
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
		        message:'搜索失败',
		        type:'error',
		        time:'1000'
		    });
		}
		else{
			window.location.href='${ctx}/search${fns:getUrlSuffix()}?content='+encodeURIComponent(encodeURIComponent(content));
		}
	}
	</script>
</head>
<body>
	 <!--头部-->
	   <div class="top">
			<div class="top_left">
			<img src="${ctxStaticTheme}/images/logo.png" class="top_left_img">
				<b class="img_font">井冈山智慧社区</b>
			</div>
			
			<div class="top_right">
			   <div class="top_right_login">
			            <input type="text" placeholder="请输入搜索内容" class="scontent">
					    <img src="${ctxStaticTheme}/images/check.png" class="picimg" onClick="search()">
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
				  <div style="float:right">
					<img src="${ctxStaticTheme}/images/app.png" style="float:right">
				  </div>	
				</div>
				
			</div>
	   </div>
	   <!--轮播图-->
		<div class="mar">
            <div class="js-silder">
   				<div class="silder-scroll">
				  <div class="silder-main">
					 <div class="silder-main-img">
				       <img src="${ctxStaticTheme}/images/lunbo-01.png" class="lun_mar">
			         </div>
		        	 <div class="silder-main-img">
					   <img src="${ctxStaticTheme}/images/lunbo-01.png" class="lun_mar">
					 </div>
			  		 <div class="silder-main-img">
				       <img src="${ctxStaticTheme}/images/lunbo-01.png" class="lun_mar">
			   		 </div>
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
				  <c:if test="${status.index ==0}">
				  <a class="a-news" href="${ctx}/list1-${category.id}-news${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  <c:if test="${status.index == 1}">
				  <a class="a-trends" href="${ctx}/list1-${category.id}-trends${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 2}">
				  <a class="a-faces" href="${ctx}/list1-${category.id}-faces${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 3}">
				  <a class="a-guide" href="${ctx}/list1-${category.id}-guide${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 4}">
				  <a class="a-legal" href="${ctx}/list1-${category.id}-legal${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  <c:if test="${status.index == 5}">
				  <a class="a-facts" href="${ctx}/list1-${category.id}-facts${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 6}">
				  <a class="a-activity" href="${ctx}/list1-${category.id}-activity${fns:getUrlSuffix()}"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  </c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="contents" >
			<sitemesh:body/>
		</div>

     <!--友情链接-->
       <div style="margin-top: 50px;" class="friend_link">
           <ul>
              <li class="lianjieli">友情链接：</li>
              <c:forEach items="${fnc:getLinkInfoList()}" var="link" varStatus="status">
              <li class="lianjieli"><a href="${link.urls}" target="_blank">${link.name }</a></li>
              </c:forEach>
           </ul>
       </div>
     <!--底部-->
     <div class="company_bottom" style="">
           <div style="height:20px"></div>
           ${site.copyright}
     </div>
</body>
</html>