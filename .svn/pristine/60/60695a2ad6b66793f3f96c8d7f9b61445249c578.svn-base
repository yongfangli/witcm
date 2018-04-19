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
		<li><a href="${ctx}/business/business/">商户列表</a></li>
		<li><a href="${ctx}/business/business/form?id=${goods.business.id}">商户修改</a></li>
		<li class="active"><a href="${ctx}/business/goods/blist?business.id=${goods.business.id}">商品管理</a></li>
		<li><a href="${ctx}/business/promotion/blist?business.id=${goods.business.id}">促销管理</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="goods" action="${ctx}/business/goods/blist" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="businessId" name="business.id" type="hidden" value="${goods.business.id}"/>
		<ul class="ul-form">
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
			<li class="btns"><a href="${ctx}/business/goods/bform?business.id=${goods.business.id}"><input id="btnAdd" class="btn btn-primary" type="button" value="添加"/></a></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商品全称</th>
				<th>商品简称</th>
				<th>商品类别</th>
				<th>参考价格(元)</th>
				<!-- <th>上架时间</th> -->
				<th>是否下架</th>
				<shiro:hasPermission name="business:goods:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goods">
			<tr>
				<td>
					<a href="${ctx}/business/goods/bform?id=${goods.id}">${goods.fullName}</a>
				</td>
				<td>
					${goods.shortName}
				</td>
				<td>
					${goods.types.name}
				</td>
				<td>
					${goods.price}
				</td>
				<!-- <td>
					<fmt:formatDate value="${goods.shelDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td> -->
				<td>
					${fns:getDictLabel(goods.unshelFlag, 'yes_no', '')}
				</td>
				<shiro:hasPermission name="business:goods:edit"><td>
    				<a href="${ctx}/business/goods/bform?id=${goods.id}">修改</a>
					<a href="${ctx}/business/goods/delete?id=${goods.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>