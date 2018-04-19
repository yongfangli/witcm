<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>友情链接管理</title>
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
		<li class="active"><a href="${ctx}/resident/linkInfo/">友情链接列表</a></li>
		<shiro:hasPermission name="resident:linkInfo:edit"><li><a href="${ctx}/resident/linkInfo/form">友情链接添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="linkInfo" action="${ctx}/resident/linkInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>链接</th>
				<shiro:hasPermission name="resident:linkInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="linkInfo">
			<tr>
				<td><a href="${ctx}/resident/linkInfo/form?id=${linkInfo.id}">
					${linkInfo.name}
				</a></td>
				<td>
					${linkInfo.urls}
				</td>
				<shiro:hasPermission name="resident:linkInfo:edit"><td>
    				<a href="${ctx}/resident/linkInfo/form?id=${linkInfo.id}">修改</a>
					<a href="${ctx}/resident/linkInfo/delete?id=${linkInfo.id}" onclick="return confirmx('确认要删除该友情链接吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>