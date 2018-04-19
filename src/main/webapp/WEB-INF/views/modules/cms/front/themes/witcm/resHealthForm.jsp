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
	<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		.form-horizontal .control-label{
			width:180px !important;
		}
	
	</style>
	<script type="text/javascript">
	$(function(){
		$("#resHealth").addClass("dvCheck");
		
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
        	<c:if test="${not empty healthRecord.id }">健康档案修改</c:if>
        	<c:if test="${empty healthRecord.id }">健康档案增加</c:if>
        </div>
        <form:form id="inputForm" modelAttribute="healthRecord" action="${ctx}/res/resHealthSave" method="post" class="form-horizontal">
        	<form:hidden path="id"/>
        	<table id="contentTable" class="table_bor">
	        	<tr>
	        		<td class="table_form_f3">家庭用户：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<sys:treeselectFront id="familyUser" name="familyUser.id" value="${healthRecord.familyUser.id}" labelName="familyUser.name" labelValue="${healthRecord.familyUser.name}"
						title="家庭用户" url="/res/familyTreeData" extId="${familyUser.id}" cssClass="required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">血压(mmHg)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="bloods" htmlEscape="false" class="input-large digits required" maxlength="3" style="width:60px" placeholder="收缩压"/>&nbsp;/
	        			<form:input path="tbloods" htmlEscape="false" class="input-large digits required" maxlength="3" style="width:60px" placeholder="舒张压"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f3">总胆固醇(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="cholesterol" htmlEscape="false" class="input-large isnumber required" maxlength="8"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">甘油三酯(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="triglyceride" htmlEscape="false" class="input-large isnumber required" maxlength="8"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f3">胆固醇酯(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="cholest" htmlEscape="false" class="input-large isnumber required" maxlength="8"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">空腹血糖(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="fastBloods" htmlEscape="false" class="input-large isnumber required"/>
	        			<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f3">餐后1小时血糖(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="oneBloods" htmlEscape="false" class="input-large isnumber required" maxlength="8"/>
	        			<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">餐后2小时血糖(mmol/L)：</td>
	        		<td class="table_form_f2">
	        			<form:input path="twoBloods" htmlEscape="false" class="input-large isnumber required" maxlength="8"/>
	        			<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f3">测量时间：</td>
	        		<td class="table_form_f2">
	        			<input name="testDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
						value="<fmt:formatDate value="${healthRecord.testDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">医嘱：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:textarea path="doctorAdvice" htmlEscape="false" rows="4" maxlength="300" class="input-xlarge " style="width:400px;"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f3">备注：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="300" class="input-xlarge " style="width:400px;"/>
	        		</td>
	        	</tr>
	        </table>
	        
			<div class="form-actions">
				<input class="btn" type="submit" value="提 交"/>&nbsp;
				<input class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/res/resHealth'"/>
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>