<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/trends.css"/>
	<%@ include file="/WEB-INF/views/client/include/head.jsp"%>
</head>
<body>
		<div id="out">
			<h3>${article.title}</h3>
			<hr color="#DADADA"/>
			<div class="author">
				<span>发布人：${article.user.name}</span>
				<span>发布时间：<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				<%-- <span>
					<img src="${ctxStatic}/client/img/fenxiang.jpg"/>
					我要分享
					<img src="${ctxStatic}/client/img/jiantou.jpg"/>
				</span> --%>
			</div>
			<div class="div_center">
				<div class="content">
		              ${article.articleData.content}
		         </div>
			</div>
			<div class="bottom">
				<div class="bottom_left">
				<c:if test="${null!=pre }">
					<a target="_blank" href="${ctx}/trends-view-${pre.id}${fns:getUrlSuffix()}"> <上一篇 </a>
					${fns:abbr(pre.title,80)}
					</c:if>
					<c:if test="${null==pre }">
					
					<a href="javascript:void(0);">上一篇</a>
					没有了
					</c:if>
				</div>
				<div class="bottom_right">
				<c:if test="${null!=next}">
				   ${fns:abbr(next.title,80)}
					<a target="_blank" href="${ctx}/trends-view-${next.id}${fns:getUrlSuffix()}"> 下一篇 ></a>
					
					</c:if>
					<c:if test="${null==next}">
					没有了
					<a href="javascript:void(0);">下一篇></a>
					</c:if>
				</div>
			</div>
		</div>
	</body>
</html>