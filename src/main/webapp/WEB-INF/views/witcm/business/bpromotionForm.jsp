<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>促销管理</title>
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
		<li><a href="${ctx}/business/business/">商户列表</a></li>
		<li><a href="${ctx}/business/business/form?id=${promotion.business.id}">商户修改</a></li>
		<li><a href="${ctx}/business/goods/blist?business.id=${promotion.business.id}">商品管理</a></li>
		<li><a href="${ctx}/business/promotion/blist?business.id=${promotion.business.id}">促销管理</a></li>
		<li class="active"><a href="${ctx}/business/promotion/bform?id=${promotion.id}&business.id=${promotion.business.id}">促销<shiro:hasPermission name="business:promotion:edit">${not empty promotion.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="business:promotion:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="promotion" action="${ctx}/business/promotion/bsave" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<input type="hidden" name="business.id" value="${promotion.business.id}">
		<div class="control-group">
			<label class="control-label">促销主题：</label>
			<div class="controls">
				<form:input path="titles" htmlEscape="false" maxlength="500" class="input-xlarge required"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">是否下线：</label>
			<div class="controls">
				<form:radiobuttons path="offlineFlag" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">截止日期：</label>
			<div class="controls">
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">促销内容：</label>
			<div class="controls">
				<form:textarea path="contents" htmlEscape="false" rows="4" maxlength="2000" class="input-xxlarge required"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="business:promotion:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>