<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户类别管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 3});
		});
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/business/businessTypes/">商户类别列表</a></li>
		<shiro:hasPermission name="business:businessTypes:edit"><li><a href="${ctx}/business/businessTypes/form">商户类别添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>排序</th>
				<th>创建日期</th>
				<shiro:hasPermission name="business:businessTypes:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="businessTypes">
			<tr id="${businessTypes.id}" pId="${businessTypes.parent.id ne '1' ? businessTypes.parent.id : '0'}">
				<td>
					<a href="${ctx}/business/businessTypes/form?id=${businessTypes.id}">${businessTypes.name}</a>
				</td>
				<td>${businessTypes.orders}</td>
				<td>
					<fmt:formatDate value="${businessTypes.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="business:businessTypes:edit"><td>
    				<a href="${ctx}/business/businessTypes/form?id=${businessTypes.id}">修改</a>
					<a href="${ctx}/business/businessTypes/delete?id=${businessTypes.id}" onclick="return confirmx('确认要删除该类别及所有子类别项吗？', this.href)">删除</a>
					<a href="${ctx}/business/businessTypes/form?parent.id=${businessTypes.id}">添加下级类别</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- <div class="pagination">${page}</div> -->
</body>
</html>