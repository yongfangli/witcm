<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>便民热线管理</title>
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
		<li class="active"><a href="${ctx}/business/convenient/">便民热线列表</a></li>
		<shiro:hasPermission name="business:convenient:edit"><li><a href="${ctx}/business/convenient/form">便民热线添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="convenient" action="${ctx}/business/convenient/" method="post" class="breadcrumb form-search">
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
				<th>地址</th>
				<th>电话</th>
				<shiro:hasPermission name="business:convenient:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="convenient">
			<tr>
				<td><a href="${ctx}/business/convenient/form?id=${convenient.id}">
					${convenient.name}
				</a></td>
				<td>
					${convenient.address}
				</td>
				<td>
					${convenient.phone}
				</td>
				<shiro:hasPermission name="business:convenient:edit"><td>
    				<a href="${ctx}/business/convenient/form?id=${convenient.id}">修改</a>
					<a href="${ctx}/business/convenient/delete?id=${convenient.id}" onclick="return confirmx('确认要删除该便民热线吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>