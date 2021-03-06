<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页-个人中心－个人收藏</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
	$(function(){
		$("#resCollect").addClass("dvCheck");
		
		var msg = "${message}";
	   	if(msg!=null && msg!=""){
			showTip(msg);
	   	}
	});
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
    	return false;
    }
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="resMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">个人收藏列表</div>
			<form:form id="searchForm" modelAttribute="collect" action="${ctx}/res/resCollect" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			</form:form>
        	<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>商家名称</th>
						<th>收藏时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="collect">
					<tr>
						<td>
							<a href="${ctx}/business-detail-${collect.business.id}-1-1${fns:getUrlSuffix()}?tagFlag=0" target="_blank">
								${collect.business.fullName}
							</a>
						</td>
						<td>
							<fmt:formatDate value="${collect.collectDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
		    				<a href="${ctx}/res/resCollectDel?id=${collect.id}" onclick="return confirmx('确认要删除该收藏吗？', this.href)">删除</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>
        
        </div>
    </div>
</div>
</body>
</html>