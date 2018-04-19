<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/business/orders/">订单列表</a></li>
		<li class="active"><a href="${ctx}/business/orders/form?id=${orders.id}">订单详情</a></li>
	</ul><br/>
	<form:form id="inputForm" method="post" class="form-horizontal">
		<fieldset>
        	<legend>订单信息</legend>
        	<div class="control-group">
				<label class="control-label">订单编号：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.code }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商品名称：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.goods.fullName }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">数量：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.numbers }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">订单状态：</label>
			    <div class="controls">
					<input type="text" style="width:300px;" value="${fns:getDictLabel(orders.status, 'goods_status', '')}" readonly="readonly">
				</div>
			</div>
		</fieldset>
		<fieldset>
       	<legend>用户信息</legend>
			<div class="control-group">
				<label class="control-label">用户姓名：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.resident.name }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">用户手机号：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.resident.telphone }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">所属社区：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.belongOrg.name }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">楼栋号：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${orders.resident.buildingNo }" readonly="readonly">
				</div>
			</div>
		</fieldset>
		<fieldset>
        	<legend>商家信息</legend>
			<div class="control-group">
				<label class="control-label">商家名称：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${business.fullName }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商家手机号：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${business.telphone }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商家电话：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${business.phone }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商家联系人：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${business.linkMan }" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商家地址：</label>
				<div class="controls">
					<input type="text" style="width:300px;" value="${business.address }" readonly="readonly">
				</div>
			</div>
			
        </fieldset>
        <fieldset>
       		<legend>订单跟踪记录</legend>
       		<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>处理人</th>
						<th>时间</th>
						<th>状态</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="record">
					<tr>
						<td>
							${record.dealUserName}
						</td>
						<td>
							<fmt:formatDate value="${record.dealDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							${fns:getDictLabel(record.dealStatus, 'goods_status', '')}
						</td>
						<td>
							${record.remarks}
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
       	</fieldset>
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>