<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By 电信江西分公司</title>
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" type="image/x-icon">
	<%@include file="/WEB-INF/views/modules/cms/front/include/head_center.jsp" %>
	<!-- Baidu tongji analytics --><script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
	<sitemesh:head/>
	<script type="text/javascript">
	function hid(e){
		var div=e.children[3];
		if(typeof(div)!='undefined'){
			var div_style=div.style.display;
			if(div_style=='block'||div_style==''){
				div.style.display='none';
			}
		}
		
	}
	
	function show(e){
		var div=e.children[3];
		if(typeof(div)!='undefined'){
			var div_style=div.style.display;
			if(div_style=='none'||div_style==''){
				div.style.display='block';
			}
		}
		
	};
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
		<!--导航条-->
		<div class="navi_div">
			<div class="navi_middle">
				<ul>
				  <a class="a-index" href="${ctx}"><li class="li"><div style="height:16px"></div>首页</li></a>
				  <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				  <li  onmousemove="show(this)" onmouseout="hid(this)" class="li"><div style="height:16px"></div>
				  <c:if test="${fnc:hasChild(category.id,site.id)=='1'}">
				  <a  target="_blank" href="javascript:void(0);">${category.name}</a>
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
		
			<div class="contents" style="clear: both;overflow:auto;">
				<sitemesh:body/>
			</div>
			
	     	<!--友情链接-->
	       <div style="height:25px"></div>
	       
	       <div class="friend_link">
	           <ul>
	              <li class="lianjieli">友情链接：</li>
	              <c:forEach items="${fnc:getLinkInfoList()}" var="link" varStatus="status">
	              	<li class="lianjieli"><a href="${link.urls}" target="_blank">${link.name }</a></li> 
	              </c:forEach>
	           </ul>
	       </div>
	     <!--底部-->  
	     <div class="company_bottom">
	           <div style="height:20px"></div>
	           ${site.copyright}
	     </div>
</body>
</html>