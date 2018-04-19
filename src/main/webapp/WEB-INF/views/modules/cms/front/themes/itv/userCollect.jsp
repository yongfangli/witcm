<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/userInfo.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
	<script type="text/javascript">
	/* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
	 function placeholderPic(){
	  var w = document.documentElement.offsetWidth;
	  document.documentElement.style.fontSize=w/100+'px';
	 }
	 placeholderPic();
	 window.onresize=function(){
	  placeholderPic();
	 };
	 
	 function page(n){
		$("#pageNo").val(n);
		$("#searchForm").submit();
    	return false;
    }
	</script>
</head>
<body>
<div class="bigdiv">
    <!--左边列表-->
    <div class="list_left">
       <div class="title"><a href="${ctx}/itv/userMenu"><img class="return" src="${ctxStaticItv }/images/return.png" ></img>
</a> 个人收藏</div>
       <p><img src="${resident.imagesId }" class="headr" /></p>
       <p class="welcome">欢迎你</p>
       <p class="nickname">${resident.name }</p>
       <p><input type="button" class="close" value="退出" onclick="window.location.href='${ctx}/itv/exits'"></p>
        <div style="height:25vh"></div>
       <p class="xinxin">Copyright @ 2017-2018</p>
       <p class="xinxin">井冈山智慧社区 V1.0- Powered By</p>
       <p class="xinxin">江西电信信息产业有限共识&技术支持</p>
    </div>
    <!--右边文章-->
    <div class="left_user">
        <div class="rightBack">
        	<div style="height:3.5vh"></div>
            <div class="tableDiv">
            <form:form id="searchForm" modelAttribute="orders" action="${ctx}/itv/userCollect" method="post" class="breadcrumb form-search">
            	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	        	<table class="table"  border="1" cellspacing="0" cellpadding="0">
	                <tr class="th">
	                   <td>商家名称</td>
	                   <td>收藏时间</td>
	                   <td>操作</td>
	                </tr>
	                <c:forEach items="${page.list}" var="collect">
		                <tr class="tr">
		                   <td class="td">${collect.business.fullName}</td>
		                   <td><fmt:formatDate value="${collect.collectDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                   <td><a href="${ctx}/itv/userCollectDel?id=${collect.id}" onclick="return confirmx('确认要删除该收藏吗？', this.href)">删除</a></td>
		                </tr>
	                </c:forEach>
	                <c:if test="${empty page.list}">
	                	<tr class="tr">
	                		<td colspan="3">暂无数据</td>
	                	</tr>
	                </c:if>
	            </table>
            </form:form>
            </div>
        </div>
        <div class="last_page">
        <c:if test="${!page.firstPage}">
        	<a href="javascript:void(1)" onclick="page('${page.prev}')">▲</a>
        </c:if>
        &emsp;${page.pageNo}/${page.last}&emsp;
        <c:if test="${!page.lastPage}">
        	<a href="javascript:void(1)" onclick="page('${page.next}')">▼</a>
        </c:if>
        </div>
    </div>
</div>
</body>
</html>