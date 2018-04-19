<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心－个人信息</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	<link href="/witcm/static/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet">
	<script src="${ctxStaticTheme}/js/jquery.easyui.min.js" type="text/javascript"></script>
	
	
	<script type="text/javascript">
	   $(function(){
		   $("#resInfo").addClass("dvCheck");
		   
		   var msg = "${message}";
		   if(msg!=null && msg!=""){
			   showTip(msg);
		   }
		   
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
        <div class="center_title">个人信息</div>
        <form:form id="inputForm" modelAttribute="resident" enctype="multipart/form-data" action="${ctx}/res/resInfoSave" method="post" class="form-horizontal">
	        <form:hidden path="id"/>
	        <form:hidden path="imagesId"/>
	        <table id="contentTable" class="table_bor">
	        	<tr>
	        		<td class="table_form_f1">姓名：</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        		<td class="table_form_f2" rowspan="4">
	        			<div style="text-align: center;width: 100%;">
	        				<img src="${resident.imagesId }" width="90px" height="110px"/>
							<input id="uploadFile" name="file" type="file" class="isimages"/>
	        			</div>
	        			
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">所在小区:</td>
	        		<td class="table_form_f2" colspan="2">
	        			<sys:treeselectFront id="office" name="belongOrg.id" value="${resident.belongOrg.id}" labelName="office.name" labelValue="${resident.belongOrg.name}"
						title="社区" url="/res/orgTreeData?type=2" extId="${belongOrg.id}" cssClass="required" notAllowSelectParent="true"/>
							<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">性别：</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:radiobuttons path="gender" items="${fns:getDictList('gender')}" itemLabel="label" itemValue="value" htmlEscape="false" class="input-medium required"/>
				  		<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">身份证号码：</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:input path="identityNo" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">手机号码：</td>
	        		<td class="table_form_f2">
	        			<form:input path="telphone"  htmlEscape="false" maxlength="30" class="input-xlarge" readonly="true"/>
	        		</td>
	        		<td class="table_form_f1">家庭电话：</td>
	        		<td class="table_form_f2">
	        			<form:input path="phone" htmlEscape="false" maxlength="30" class="input-xlarge "/>
	        		</td>
	        		
	        	</tr>
	        	<tr>
	        		<%-- <td class="table_form_f1">QQ号：</td>
	        		<td class="table_form_f2">
	        			<form:input path="qqNo" htmlEscape="false" maxlength="30" class="input-xlarge "/>
	        		</td> --%>
	        		<td class="table_form_f1">楼栋号：</td>
	        		<td class="table_form_f2">
	        			<form:input path="buildingNo" htmlEscape="false" maxlength="300" class="input-xlarge required"/>
						<span class="help-inline"><font color="red" style="font-size: 12px;">*</font> </span>
	        		</td>
	        		<td></td>
	        		<td></td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">个人简介：</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:textarea path="personDesc" htmlEscape="false" rows="4" maxlength="2000" class="input-xlarge " style="width:400px;"/>
	        		</td>
	        	</tr>
	        </table>
			
			<div class="form-actions">
				<input class="btn" type="submit" value="提 交"/>&nbsp;
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>

</body>
</html>