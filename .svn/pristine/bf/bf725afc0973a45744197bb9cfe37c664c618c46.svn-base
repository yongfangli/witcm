<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>咨询管理</title>
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
	    <li class="active"><a href="${ctx}/resident/consult/">咨询列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="consult" action="${ctx}/resident/consult/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>发表人：</label>
				<sys:treeselect id="resident" name="resident.id" value="${consult.resident.id}" labelName="resident.name" labelValue="${consult.resident.name}"
					title="居民" url="/resident/resident/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>标题：</label>
				<form:input path="titles" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>内容：</label>
				<form:input path="contents" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>发表人</th>
				<th>发表人姓名</th>
				<th>标题</th>
				<th>内容</th>
				<th>归属机构</th>
				<th>归属单位</th>
				<th>创建日期</th>
				<shiro:hasPermission name="resident:consult:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="consult">
			<tr>
				<td><a href="${ctx}/resident/consult/form?id=${consult.id}">
					${consult.resident.name}
				</a></td>
				<td>
					${consult.userName}
				</td>
				<td>
					${consult.titles}
				</td>
				<td class="my-content">
					${consult.contents}
				</td>
				<td>
					${consult.belongOrg.name}
				</td>
				<td>
					${consult.belongAreaId}
				</td>
				<td>
					<fmt:formatDate value="${consult.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="resident:consult:edit"><td>
				    <a href="${ctx}/resident/consultReply/list?consult.id=${consult.id}">查看回复</a>
					<a href="${ctx}/resident/consult/delete?id=${consult.id}" onclick="return confirmx('确认要删除该咨询吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>