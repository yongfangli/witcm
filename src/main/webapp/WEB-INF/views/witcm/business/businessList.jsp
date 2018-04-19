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
		<li class="active"><a href="${ctx}/business/business/">商户列表</a></li>
		<shiro:hasPermission name="business:business:add"><li><a href="${ctx}/business/business/add">商户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="business" action="${ctx}/business/business/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商户全称：</label>
				<form:input path="fullName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>手机号：</label>
				<form:input path="telphone" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>归属社区：</label>
				<sys:treeselect id="office" name="belongOrg.id" value="${business.belongOrg.id}" labelName="belongOrg.name" labelValue="${business.belongOrg.name}"
					title="社区" url="/sys/office/treeData?type=2" cssClass="input-medium" notAllowSelectParent="true" allowClear="true"/>
			</li>
			<li><label>商户类别：</label>
				<sys:treeselect id="businessTypes" name="types.id" value="${business.types.id}" labelName="types.name" labelValue="${business.types.name}"
					title="类别" url="/business/businessTypes/treeData" extId="${types.id}" cssClass="input-medium" allowClear="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商户全称</th>
				<th>商户类别</th>
				<th>手机号</th>
				<th>联系人</th>
				<th>归属社区</th>
				<th>最后登录时间</th>
				<shiro:hasPermission name="business:business:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="business">
			<tr>
				<td>
					<a href="${ctx}/business/business/form?id=${business.id}">${business.fullName}</a>
				</td>
				<td>
					${business.types.name}
				</td>
				<td>
					${business.telphone}
				</td>
				<td>
					${business.linkMan}
				</td>
				<td>
					${business.belongOrg.name}
				</td>
				<td>
					<fmt:formatDate value="${business.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="business:business:edit">
					<td>
	    				<a href="${ctx}/business/business/form?id=${business.id}">修改</a>
						<a href="${ctx}/business/business/delete?id=${business.id}" onclick="return confirmx('确认要删除该商户吗？', this.href)">删除</a>
						<a href="${ctx}/business/goods/bform?business.id=${business.id}">添加商品</a>
						<a href="${ctx}/business/promotion/bform?business.id=${business.id}">添加促销</a>
					</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>