<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收藏管理</title>
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
		<li class="active"><a href="${ctx}/resident/collect/">收藏列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="collect" action="${ctx}/resident/collect/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>所在社区：</label>
				<sys:treeselect id="belongOrgId" name="resident.belongOrg.id" value="${collect.resident.belongOrg.id}" labelName="resident.belongOrg.name" labelValue="${collect.belongOrgId.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></li>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>居民</th>
				<th>收藏商家</th>
				<th>收藏时间</th>
				<th>居民所在社区</th>
				<th>修改日期</th>
				<shiro:hasPermission name="resident:collect:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="collect">
			<tr>
				<td><a href="${ctx}/resident/collect/form?id=${collect.id}">
					${collect.resident.name}
				</a></td>
				<td>
				<a href="${ctx}/business/business/form?id=${collect.business.id}">
				${collect.business.fullName}
				</a>	
				</td>
				<td>
					<fmt:formatDate value="${collect.collectDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${collect.resident.belongOrg.name}
				</td>
				<td>
					<fmt:formatDate value="${collect.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="resident:collect:edit"><td>
    				<a href="${ctx}/resident/collect/form?id=${collect.id}">修改</a>
					<a href="${ctx}/resident/collect/delete?id=${collect.id}" onclick="return confirmx('确认要删除该收藏吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>