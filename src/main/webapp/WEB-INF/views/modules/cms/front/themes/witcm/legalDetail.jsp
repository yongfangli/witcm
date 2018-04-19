<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<%@ include file="/WEB-INF/views/client/include/head.jsp"%>
     		<style type="text/css">
			#out{width: 1200px;margin: 30px auto 0 auto;}
			h3{
				margin: 10px 0;
				color: #EC3B3B;
				text-align: center;
				font-size: 28px;
				font-family: "微软雅黑" "Regular";
			}
			.author{text-align: center;margin-top:10px;}
			.author span{
				font-size: 14px;
				font-family: "微软雅黑" "Regular";
				color: #666;
				display: inline-block;
				padding: 0 60px;
			}
			.author img{vertical-align: middle;}
			.div_center{margin-top: 10px;}
			.div_center p{
				text-indent: 2em;
				color: #333333;
				margin-top: 10px;
			}
			.bottom{
				width: 1200px;
				height: 30px;
				border-radius: 5px;
				border:1px solid #666;
				margin-top: 40px;
				overflow: hidden;
				font-size: 14px;
				font-family: "微软雅黑" "Regular";
				color: #333;
			}
			.bottom .bottom_left{float: left;height: 30px;}
			.bottom .bottom_right{float:right;height: 30px;}	
			.bottom a{
				display: inline-block;
				width: 75px;height: 30px;
				text-decoration: none;
				background-color: #333;
				text-align: center;
				padding-top:5px;
				color: #ccc;
			}
			.bottom a:hover{background-color: #EC3B3B;color:white;}
		</style>
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
			<div class="div_center a5" style="display: inline-block;">
				<div class="content">
		              ${article.articleData.content}
		         </div>
			</div>
			<div class="bottom">
				<div class="bottom_left">
				<c:if test="${null!=pre }">
					<a target="_blank" href="${ctx}/legal-view-${pre.id}${fns:getUrlSuffix()}"> <上一篇</a>
					${fns:abbr(pre.title,80)}
					</c:if>
					<c:if test="${null==pre }">
					
					<a href="javascript:void(0);"><上一篇</a>
					没有了
					</c:if>
				</div>
				<div class="bottom_right">
				<c:if test="${null!=next}">
				   ${fns:abbr(next.title,80)}
					<a target="_blank" href="${ctx}/legal-view-${next.id}${fns:getUrlSuffix()}"> 下一篇> </a>
					
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