<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>家属管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		
			//$("#name").focus();
			$("#inputForm").validate({
				
				rules : {
				    name: {remote: {
				    	url:"${ctx}/resident/family/checkName",
				    	data:{oldName:'${family.name}'},
				        type:"post"
				         }
					},
					identityNo:{
						required:true,
						isidcard:true
					}
					
				},
				message :{
					name:{remote:"名字重复"},
					identityNo:{
						required:"身份证不能为空",
						isidcard:"身份证号不规范"
					}
				},
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
		<li><a href="${ctx}/resident/family/">家属档案列表</a></li>
		<li class="active"><a href="${ctx}/resident/family/form?id=${family.id}">家属档案<shiro:hasPermission name="resident:family:edit">${not empty family.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="resident:family:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="family" action="${ctx}/resident/family/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="residentFlag"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属户主：</label>
			<div class="controls">
				<sys:treeselect id="resident" name="resident.id" value="${family.resident.id}" labelName="resident.name" labelValue="${family.resident.name}"
					title="居民" url="/resident/resident/treeData" cssClass="input-medium required" allowClear="true" notAllowSelectParent="true"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
		    <div class="controls">
				<form:radiobuttons path="gender" items="${fns:getDictList('gender')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出生年月：</label>
			<div class="controls">
				<input name="birthday" type="text" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${family.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,maxDate:'%y-%M-%d'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号码：</label>
			<div class="controls">
				<form:input path="identityNo" htmlEscape="false" maxlength="64" class="input-medium isidcard required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
				<form:input path="telphone" htmlEscape="false" maxlength="64" class="input-medium isMobile required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">QQ号：</label>
			<div class="controls">
				<form:input path="qqNo" htmlEscape="false" maxlength="64" class="input-medium isqq"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否户主：</label>
			<div class="controls">
				<form:radiobuttons path="houserMaster" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否残疾：</label>
			<div class="controls">
				<form:radiobuttons path="deformity" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否扶贫对象：</label>
			<div class="controls">
				<form:radiobuttons path="helpPoor" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否矫正人员：</label>
			<div class="controls">
				<form:radiobuttons path="correct" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否养老对象：</label>
			<div class="controls">
				<form:radiobuttons path="pension" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人简介：</label>
			<div class="controls">
				<form:textarea path="usersDesc" htmlEscape="false" rows="4" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="resident:family:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>