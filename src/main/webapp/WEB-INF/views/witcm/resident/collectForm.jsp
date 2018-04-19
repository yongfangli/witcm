<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收藏管理</title>
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
		<li><a href="${ctx}/resident/collect/">收藏列表</a></li>
		<li class="active"><a href="${ctx}/resident/collect/form?id=${collect.id}">收藏查看</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="collect"  method="post" class="form-horizontal">
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">居民：</label>
			<div class="controls">
				<input type="text" value="${collect.resident.name}" htmlEscape="false" readOnly="true" maxlength="64" class="input-large"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收藏商家：</label>
			<div class="controls">
				<input type="text" value="${collect.business.fullName}"   readOnly="true" htmlEscape="false" class="input-large"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收藏时间：</label>
			<div class="controls">
				<input name="collectDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${collect.collectDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属机构：</label>
			<div class="controls">
				<input type="text" value="${collect.belongOrgId.name}" readonly="readonly" htmlEscape="false" maxlength="64" class="input-large "/>
			</div>
		</div>
		</form:form>
</body>
</html>