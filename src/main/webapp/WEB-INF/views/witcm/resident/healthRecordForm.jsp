<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>家庭健康档案管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function validate(){
				var userId=$("#familyUserId").val();
				if(userId==null||userId==""){
					alert("no");
				}
			}
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
		<li><a href="${ctx}/resident/healthRecord/">家庭健康档案列表</a></li>
		<li class="active"><a href="${ctx}/resident/healthRecord/form?id=${healthRecord.id}">家庭健康档案<shiro:hasPermission name="resident:healthRecord:edit">${not empty healthRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="resident:healthRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form onSubmit="validate" id="inputForm" modelAttribute="healthRecord" action="${ctx}/resident/healthRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">家庭用户：</label>
			<div class="controls">
				<sys:treeselect id="familyUser" name="familyUser.id" value="${healthRecord.familyUser.id}" labelName="familyUser.name" labelValue="${healthRecord.familyUser.name}"
					title="居民" url="/resident/family/treeData" cssClass="input-medium required" allowClear="true" notAllowSelectParent="true"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">血压(mmHg)：</label>
			<div class="controls">
				<form:input maxlength="10" path="bloods" htmlEscape="false" class="input-large isInt required" placeholder="收缩压"/>
				|
				<form:input maxlength="10" path="tbloods" htmlEscape="false" class="input-large isInt required" placeholder="舒张压"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">总胆固醇(mmol/L)：</label>
			<div class="controls">
				<form:input path="cholesterol" maxlength="10" htmlEscape="false" class="input-large isnumber required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">甘油三酯(mmol/L)：</label>
			<div class="controls">
				<form:input path="triglyceride" maxlength="10" htmlEscape="false" class="input-large isnumber required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">胆固醇酯(mmol/L)：</label>
			<div class="controls">
				<form:input path="cholest" maxlength="10" htmlEscape="false" class="input-large isnumber required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">空腹血糖(mmol/L)：</label>
			<div class="controls">
				<form:input path="fastBloods" maxlength="10" htmlEscape="false" class="input-large isnumber"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">餐后1小时血糖(mmol/L)：</label>
			<div class="controls">
				<form:input path="oneBloods" maxlength="10"  htmlEscape="false" class="input-large isnumber"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">餐后2小时血糖(mmol/L)：</label>
			<div class="controls">
				<form:input path="twoBloods" maxlength="10" htmlEscape="false" class="input-large isnumber"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">测量时间：</label>
			<div class="controls">
				<input name="testDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${healthRecord.testDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,maxDate:'%y-%M-%d'});"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医嘱：</label>
			<div class="controls">
				<form:textarea path="doctorAdvice" htmlEscape="false" rows="4" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="resident:healthRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>