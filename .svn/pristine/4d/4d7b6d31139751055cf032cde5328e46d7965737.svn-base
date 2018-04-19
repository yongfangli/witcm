<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
		<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/activityDetail.css"/>
 <link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/Communitystyle.css"/>
   	<link href="${ctxStaticTheme}/css/newsDetail.css" type="text/css" rel="stylesheet" />
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
     <script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
<script>
function showList(parentId,curId){
	var url='${ctx}'+"/alist-"+parentId+"-1"+"-8"+'${fns:getUrlSuffix()}?curId='+curId;
	 window.location.href=url;
}

function showListP(parentId,curId,pictureId){
	var url='${ctx}'+"/alist-"+parentId+"-1"+"-8"+'${fns:getUrlSuffix()}?curId='+curId+'&pictureId='+pictureId;
	 window.location.href=url;
}

	$(function(){
        //左侧有无菜单栏时，不同的样式设置
		if($(".cp_left").length >0 ){
            $(".cp_left").height($("#cp").height());
            $("#cp").find(".cp_right").css("marginLeft","20px");
		}else{
            $("#cp").find("#BBS").css("width","1200px");
            $("#cp").find(".cp_right").css("width","100%");
            $("#cp").find(".cp_right").css({
                float:"left",
                marginLeft:"0"
            });
		}


	})
</script>


</head>
<body>
  <body>
	 <div class="cur_locat">
			<a href="${ctx}">首页</a>&gt;&gt;<a href="javasctipt:void(0)">${parentName}</a>
		</div>
		
		<div id="cp" class="clearfix">
		   <c:if test="${categoryLists!=null}">
			<div class="cp_left">
				<div class="cp_lm">
					<div class="cp_fl">${parentName}</div>
					<div class="cp_fll">
						<ul>
					<c:forEach items="${categoryLists}" var="category" varStatus='status'>
					<c:if test="${category.id==curId}">
					
							<li><a  onclick="showList('${parentId}','${category.id}')" class="ys" href="javascript:void(0)">${category.name}</a></li>
							</c:if>
							<c:if test="${category.id!=curId }">
							<li><a   onclick="showList('${parentId}','${category.id}')" href="javascript:void(0)">${category.name}</a></li>
							</c:if>
							
					</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			</c:if>
			<div class="cp_right">
			
		<div id="BBS">
		<c:if test="${categoryType=='news'}">
			<!-- <a href="#" class="theme"> + 发表新主题</a> -->
			<c:forEach items="${page.list}" var="article" varStatus='status'>
				<div class="content_info" >
					<div class="new_img">
				<img style="width: 100px;height: 79px;" src="${article.image}"/>
			    </div>
			<div class="describe" style="width: 77%;margin-left: 15px;">
					<table width="100%" cellpadding="0" cellspacing="0">
				
						<tr>
							<td colspan="2">
								<a target="_blank" href='${ctx}/view-${article.id}${fns:getUrlSuffix()}'>${fns:abbr(article.title,75)}</a>
							</td>
						</tr>
						<tr height="40px">
							<td class="content_info_td"> ${article.user.name }| <fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						<tr>
							<td colspan="2">
								<hr color="#D9D9D9"/>
							</td>
						</tr>
					</table>
					</div>
				</div>
				</c:forEach>
				</c:if>
				<c:if test="${categoryType=='article'}">
			<!-- <a href="#" class="theme"> + 发表新主题</a> -->
			<c:forEach items="${page.list}" var="article" varStatus='status'>
				<div class="content_info" >
			<div class="describe" style="width: 90%;">
					<table width="100%" cellpadding="0" cellspacing="0">
				
						<tr>
							<td colspan="2">
								<a target="_blank" href='${ctx}/view-${article.id}${fns:getUrlSuffix()}'>${fns:abbr(article.title,75)}</a>
							</td>
						</tr>
						<tr height="40px">
							<td class="content_info_td"> ${article.user.name }| <fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						<tr>
							<td colspan="2">
								<hr color="#D9D9D9"/>
							</td>
						</tr>
					</table>
					</div>
				</div>
				</c:forEach>
				</c:if>
					<c:if test="${categoryType=='special'}">
			<!-- <a href="#" class="theme"> + 发表新主题</a> -->
			<c:forEach items="${page.list}" var="article" end="0" varStatus='status'>
		<div id="out" >
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
			<div class="div_center" style="display: inline-block;">
				<div class="content">
		            ${article.articleData.content}
		         </div>
			</div>
			
		</div>
				</c:forEach>
				</c:if>
		<c:if test="${categoryType=='picture'}">
				<c:choose>
				<c:when test="${empty pictureD}">
							<div id="nav">
							
			
			<c:forEach items="${categoryLists}" var="category" varStatus='status'>
					<c:if test="${category.id==curId && !empty category.description}">
							景区简介：<br/>
							${category.description}
							<br/>
							景点介绍：<br/>
							</c:if>
							
					</c:forEach>
			
			<div class="nav_first">
			<c:forEach items="${page.list}" var="news" varStatus='status' end="3">
	<c:if test="${status.index==0}">
		<input type="hidden" id="categoryId" value="${news.category.id}"/>
		</c:if>
		
				<div class="avator picture">
					<%--<a href="javascript:void(0)"><img src="${news.image}"/></a>--%>
						<a onclick="showListP('${parentId}','${curId}','${news.id}')" title="领导" style='background-image:url("${news.image}") '></a>
						<a href="javascript:void(0)"><span>${news.title}</span></a>
				</div>
				</c:forEach>
			</div>	
			<div class="nav_first nav_second">
			<c:forEach items="${page.list}" var="news" varStatus='status' begin="4" end="7">
				<div class="avator">
					<%--<a href="javascript:void(0)"><img src="${news.image}"/></a>--%>
						<a onclick="showListP('${parentId}','${curId}','${news.id}')"  style='background-image:url("${news.image}") '></a>
					<a href="javascript:void(0)"><span>${news.title}</span></a>
				</div>
				</c:forEach>
				</div>
				</div>
				</c:when>
				<c:otherwise>
				<h3>${pictureD.title}</h3>
			<hr color="#DADADA"/>
				<img src="${pictureD.image}"/>
				<div class="content">
		              ${pictureD.articleData.content}
		         </div>
			</div>
				</c:otherwise>
				</c:choose>
			</c:if>
     	</div>
     </div>
     
	</body>
</html>