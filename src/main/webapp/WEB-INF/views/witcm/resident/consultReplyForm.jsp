<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>咨询回复管理</title>
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
		<li><a href="${ctx}/resident/consultReply/">咨询回复列表</a></li>
		<li class="active"><a href="${ctx}/resident/consultReply/form?id=${consultReply.id}">咨询回复<shiro:hasPermission name="resident:consultReply:edit">${not empty consultReply.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="resident:consultReply:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="consultReply" action="${ctx}/resident/consultReply/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">咨询：</label>
			<div class="controls">
                <sys:treeselect id="consult" name="consult.id" value="${consultReply.consult.id}" labelName="consult.titles" labelValue="${consultReply.consult.titles}"
					title="咨询" url="/resident/consult/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="contents" htmlEscape="false" rows="4" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="resident:consultReply:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>