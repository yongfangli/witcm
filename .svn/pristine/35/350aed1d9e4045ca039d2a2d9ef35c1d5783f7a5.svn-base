<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/business/business/">商户列表</a></li>
		<li><a href="${ctx}/business/business/form?id=${promotion.business.id}">商户修改</a></li>
		<li><a href="${ctx}/business/goods/blist?business.id=${promotion.business.id}">商品管理</a></li>
		<li class="active"><a href="${ctx}/business/promotion/blist?business.id=${promotion.business.id}">促销管理</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="promotion" action="${ctx}/business/promotion/blist" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="businessId" name="business.id" type="hidden" value="${promotion.business.id}"/>
		<ul class="ul-form">
			<li><label>促销主题：</label>
				<form:input path="titles" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="btns"><a href="${ctx}/business/promotion/bform?business.id=${promotion.business.id}"><input id="btnAdd" class="btn btn-primary" type="button" value="添加"/></a></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>促销主题</th>
				<th>促销内容</th>
				<th>截止日期</th>
				<th>是否下线</th>
				<shiro:hasPermission name="business:promotion:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="promotion">
			<tr>
				<td>
					<a href="${ctx}/business/promotion/bform?id=${promotion.id}">${promotion.titles}</a>
				</td>
				<td>${promotion.contents}</td>
				<td>
					<fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td>
					${fns:getDictLabel(promotion.offlineFlag, 'yes_no', '')}
				</td>
				<shiro:hasPermission name="business:promotion:edit"><td>
    				<a href="${ctx}/business/promotion/bform?id=${promotion.id}">修改</a>
					<a href="${ctx}/business/promotion/delete?id=${promotion.id}" onclick="return confirmx('确认要删除该促销吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>