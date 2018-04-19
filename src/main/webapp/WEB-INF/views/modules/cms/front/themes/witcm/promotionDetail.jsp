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
			#out{width: 1200px;margin: 0 auto;}
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
       
		 <div class="cur_locat">
			<a href="${ctx}">首页</a>&gt;&gt;<a href='${ctx}/promotion-list-1${fns:getUrlSuffix()}'>促销信息</a>
		</div>
		<div id="out">
			<h3>${promotion.titles}</h3>
			<hr color="#DADADA"/>
			<div class="author">
				<span>发布商家：${promotion.business.fullName}</span>
				<span>发布时间：<fmt:formatDate value="${promotion.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				
			</div>
			<div class="div_center" style="display: inline-block;">
				<div class="content" style="padding-left: 200px;">
		              ${promotion.contents}
		         </div>
			</div>
		</div>
	</body>
</html>