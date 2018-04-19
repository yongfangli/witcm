<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心－家庭档案修改</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
	$(function(){
		$("#resFamily").addClass("dvCheck");
		
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
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="resMenu.jsp" />
        
        <div id="dvContentRight">
        <div class="center_title">
        	<c:if test="${not empty family.id }">家庭档案修改</c:if>
        	<c:if test="${empty family.id }">家庭档案增加</c:if>
        </div>
        <form:form id="inputForm" modelAttribute="family" action="${ctx}/res/resFamilySave" method="post" class="form-horizontal">
	        <form:hidden path="id"/>
	        <form:hidden path="residentFlag"/>
	        <table id="contentTable" class="table_bor">
	        	<tr style="height: 60px;">
	        		<td class="table_form_f1">姓名：</td>
	        		<td class="table_form_f2">
	        			<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f1">出生年月：</td>
	        		<td class="table_form_f2">
	        			<input name="birthday" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
						value="<fmt:formatDate value="${family.birthday}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						<span class="help-inline"><font color="red" style="font-size: 12px;">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">身份证号码：</td>
	        		<td class="table_form_f2">
	        			<form:input path="identityNo" htmlEscape="false" maxlength="64" class="input-xlarge isidcard required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f1">手机号码：</td>
	        		<td class="table_form_f2">
	        			<form:input path="telphone" htmlEscape="false" maxlength="64" class="input-xlarge isMobile required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">QQ号：</td>
	        		<td class="table_form_f2">
	        			<form:input path="qqNo" htmlEscape="false" maxlength="64" class="input-xlarge isqq"/>
	        		</td>
	        		<td class="table_form_f1">性别：</td>
	        		<td class="table_form_f2">
	        			<form:radiobuttons path="gender" items="${fns:getDictList('gender')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">是否户主：</td>
	        		<td class="table_form_f2">
	        			<form:radiobuttons path="houserMaster" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f1">是否残疾：</td>
	        		<td class="table_form_f2">
	        			<form:radiobuttons path="deformity" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">是否扶贫对象：</td>
	        		<td class="table_form_f2">
	        			<form:radiobuttons path="helpPoor" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f1">是否矫正人员：</td>
	        		<td class="table_form_f2">
	        			<form:radiobuttons path="correct" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">是否养老对象：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:radiobuttons path="pension" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">个人简介：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:textarea path="usersDesc" htmlEscape="false" rows="4" maxlength="64" class="input-xlarge " style="width:400px;"/>
	        		</td>
	        	</tr>
	        </table>
        	
			<div class="form-actions">
				<input class="btn" type="submit" value="提 交"/>&nbsp;
				<input class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/res/resFamily'"/>
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>