<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品类别管理</title>
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
		<li class="active"><a href="${ctx}/business/goodsTypes/">商品类别列表</a></li>
		<shiro:hasPermission name="business:goodsTypes:edit"><li><a href="${ctx}/business/goodsTypes/form">商品类别添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>排序</th>
				<th>创建时间</th>
				<shiro:hasPermission name="business:goodsTypes:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="goodsTypes">
			<tr id="${goodsTypes.id}" pId="${goodsTypes.parent.id ne '1' ? goodsTypes.parent.id : '0'}">
				<td>
					<a href="${ctx}/business/goodsTypes/form?id=${goodsTypes.id}">${goodsTypes.name}</a>
				</td>
				<td>${goodsTypes.orders}</td>
				<td>
					<fmt:formatDate value="${goodsTypes.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="business:goodsTypes:edit"><td>
    				<a href="${ctx}/business/goodsTypes/form?id=${goodsTypes.id}">修改</a>
					<a href="${ctx}/business/goodsTypes/delete?id=${goodsTypes.id}" onclick="return confirmx('确认要删除该商品类别吗？', this.href)">删除</a>
					<a href="${ctx}/business/goodsTypes/form?parent.id=${goodsTypes.id}">添加下级类别</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>