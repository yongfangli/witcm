<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品管理</title>
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
		<li class="active"><a href="${ctx}/business/goods/">商品列表</a></li>
		<!--<shiro:hasPermission name="business:goods:edit"><li><a href="${ctx}/business/goods/form">商品添加</a></li></shiro:hasPermission>-->
	</ul>
	<form:form id="searchForm" modelAttribute="goods" action="${ctx}/business/goods/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>归属商户：</label>
				<form:input path="business.fullName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>商品类别：</label>
				<sys:treeselect id="goodsTypes" name="types.id" value="${goods.types.id}" labelName="types.name" labelValue="${goods.types.name}"
					title="类别" url="/business/goodsTypes/treeData" extId="${types.id}" cssClass="input-medium" allowClear="true"/>
			</li>
			<li><label>商品全称：</label>
				<form:input path="fullName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>商品简称：</label>
				<form:input path="shortName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>归属商户</th>
				<th>商品类别</th>
				<th>商品全称</th>
				<th>商品简称</th>
				<th>参考价格(元)</th>
				<th>是否下架</th>
				<shiro:hasPermission name="business:goods:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goods">
			<tr>
				<td>
					${goods.business.fullName}
				</td>
				<td>
					${goods.types.name}
				</td>
				<td>
					<a href="${ctx}/business/goods/form?id=${goods.id}">${goods.fullName}</a>
				</td>
				<td>
					${goods.shortName}
				</td>
				<td>
					${goods.price}
				</td>
				<td>
					${fns:getDictLabel(goods.unshelFlag, 'yes_no', '')}
				</td>
				<shiro:hasPermission name="business:goods:edit"><td>
    				<a href="${ctx}/business/goods/form?id=${goods.id}">修改</a>
					<a href="${ctx}/business/goods/delete?id=${goods.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>