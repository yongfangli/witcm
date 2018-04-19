<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单状态管理</title>
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
		<li class="active"><a href="${ctx}/business/ordersRecord/">订单状态列表</a></li>
		<shiro:hasPermission name="business:ordersRecord:edit"><li><a href="${ctx}/business/ordersRecord/form">订单状态添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ordersRecord" action="${ctx}/business/ordersRecord/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>订单ID：</label>
				<form:select path="orders.id" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>处理状态：</label>
				<form:input path="dealStatus" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>处理人：</label>
				<form:input path="dealUser.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>处理时间：</label>
				<input name="dealDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${ordersRecord.dealDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>订单ID</th>
				<th>处理状态</th>
				<th>处理人</th>
				<th>处理时间</th>
				<th>备注</th>
				<th>归属机构</th>
				<th>归属单位</th>
				<th>创建日期</th>
				<shiro:hasPermission name="business:ordersRecord:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ordersRecord">
			<tr>
				<td><a href="${ctx}/business/ordersRecord/form?id=${ordersRecord.id}">
					${fns:getDictLabel(ordersRecord.orders.id, '', '')}
				</a></td>
				<td>
					${ordersRecord.dealStatus}
				</td>
				<td>
					${ordersRecord.dealUser.id}
				</td>
				<td>
					<fmt:formatDate value="${ordersRecord.dealDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ordersRecord.remarks}
				</td>
				<td>
					${ordersRecord.belongOrgI.id}
				</td>
				<td>
					${ordersRecord.belongArea}
				</td>
				<td>
					<fmt:formatDate value="${ordersRecord.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="business:ordersRecord:edit"><td>
    				<a href="${ctx}/business/ordersRecord/form?id=${ordersRecord.id}">修改</a>
					<a href="${ctx}/business/ordersRecord/delete?id=${ordersRecord.id}" onclick="return confirmx('确认要删除该订单状态吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>