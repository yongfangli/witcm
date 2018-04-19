<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>si信息管理管理</title>
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
		<li class="active"><a href="${ctx}/si/siInfo/">si信息管理列表</a></li>
		<shiro:hasPermission name="si:siInfo:edit"><li><a href="${ctx}/si/siInfo/form">si信息管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="siInfo" action="${ctx}/si/siInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>SI名称：</label>
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
				<th>SI名称</th>
				<th>联系人</th>
				<th>联系电话</th>
				<th>合作内容</th>
				<th>备注</th>
				<th>创建日期</th>
				<shiro:hasPermission name="si:siInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="siInfo">
			<tr>
				<td><a href="${ctx}/si/siInfo/form?id=${siInfo.id}">
					${siInfo.name}
				</a></td>
				<td>
					${siInfo.linkMan}
				</td>
				<td>
					${siInfo.telphone}
				</td>
				<td>
					${siInfo.contents}
				</td>
				<td>
					${siInfo.remarks}
				</td>
				<td>
					<fmt:formatDate value="${siInfo.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="si:siInfo:edit"><td>
    				<a href="${ctx}/si/siInfo/form?id=${siInfo.id}">修改</a>
					<a href="${ctx}/si/siInfo/delete?id=${siInfo.id}" onclick="return confirmx('确认要删除该si信息管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>