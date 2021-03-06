<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品管理</title>
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
		<li><a href="${ctx}/business/goods/">商品列表</a></li>
		<li class="active"><a href="${ctx}/business/goods/form?id=${goods.id}">商品<shiro:hasPermission name="business:goods:edit">${not empty goods.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="business:goods:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="goods" action="${ctx}/business/goods/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<input type="hidden" name="business.id" value="${goods.business.id}">
		<div class="control-group">
			<label class="control-label">商品图片：</label>
			<div class="controls">
				<form:hidden id="imagesId" path="imagesId" htmlEscape="false" maxlength="64" class="input-xlarge"/>
				<sys:ckfinder input="imagesId" type="images" uploadPath="/business/goods" selectMultiple="false" maxWidth="90" maxHeight="110"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属商户：</label>
			<div class="controls">
				<input type="text" readonly="readonly" value="${goods.business.fullName}">
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label">商品类别：</label>
			<div class="controls">
				<sys:treeselect id="goodsTypes" name="types.id" value="${goods.types.id}" labelName="types.name" labelValue="${goods.types.name}"
					title="类别" url="/business/goodsTypes/treeData" extId="${types.id}" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品全称：</label>
			<div class="controls">
				<form:input path="fullName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品简称：</label>
			<div class="controls">
				<form:input path="shortName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">参考价格(元)：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" maxlength="11" class="input-xlarge required isnumber"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否下架：</label>
			<div class="controls">
				<form:radiobuttons path="unshelFlag" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品描述：</label>
			<div class="controls">
				<form:textarea path="describes" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="business:goods:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>