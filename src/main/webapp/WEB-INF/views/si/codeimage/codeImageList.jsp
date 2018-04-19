<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>二维码生成管理</title>
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
		<li class="active"><a href="${ctx}/codeimage/codeImage/">二维码生成列表</a></li>
		<li><a href="${ctx}/codeimage/codeImage/form">二维码生成添加</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="codeImage" action="${ctx}/codeimage/codeImage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题介绍：</label>
				<form:input path="title" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>图片地址</th>
				<th>标题介绍</th>
				<shiro:hasPermission name="codeimage:codeImage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="codeImage">
			<tr>
				<td><a href="${ctx}/codeimage/codeImage/form?id=${codeImage.id}">
					${codeImage.image}
				</a></td>
				<td>
					${codeImage.title}
				</td>
				<shiro:hasPermission name="codeimage:codeImage:edit"><td>
    				<a href="${ctx}/codeimage/codeImage/form?id=${codeImage.id}">修改</a>
					<a href="${ctx}/codeimage/codeImage/delete?id=${codeImage.id}" onclick="return confirmx('确认要删除该二维码生成吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>