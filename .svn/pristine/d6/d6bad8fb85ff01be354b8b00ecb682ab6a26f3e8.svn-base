<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>评论管理</title>
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
		<li class="active"><a href="${ctx}/resident/comments/">评论列表</a></li>
		<shiro:hasPermission name="resident:comments:edit"><li><a href="${ctx}/resident/comments/form">评论添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="comments" action="${ctx}/resident/comments/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>评论居民</th>
				<th>评论的帖子</th>
				<th>评论内容</th>
				<th>评论时间</th>
				<th>是否有回复</th>
				<shiro:hasPermission name="resident:comments:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="comments">
			<tr>
				<td><a href="${ctx}/resident/comments/form?id=${comments.id}">
					${comments.resident.name}
				</a></td>
				<td>
					${comments.article.title}
				</td>
				<td>
					${comments.content}
				</td>
				<td>
					<fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${comments.hasReply}
				</td>
				<shiro:hasPermission name="resident:comments:edit"><td>
    				<a href="${ctx}/resident/comments/form?id=${comments.id}">修改</a>
					<a href="${ctx}/resident/comments/delete?id=${comments.id}" onclick="return confirmx('确认要删除该评论吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>