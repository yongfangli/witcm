<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>居民管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//防止表单自动填充
			
			var login=document.getElementById("loginPswd");
			if(typeof(login)!='undefined'&&login!=null){
				login.value="";
			}
		
			$("#inputForm").validate({
				// 手机号码验证
				rules : {
					telphone : {
			            required : true,
			            remote: {
					    	 url:"${ctx}/resident/resident/checkTelPhone",
					    	 data:{oldPhone:'${resident.telphone}'},
					    	 type:"post"	
					         },
			            minlength : 11,
			            // 自定义方法：校验手机号在数据库中是否存在
			            // checkPhoneExist : true,
			            isMobile : true
			        },
			        qqNo :{
			        	isqq:true,
			        },
			        identityNo:{
			        	required :true,
                        isidcard:true			     
			        },
			        phone:{
			        	ishome:true
			        },
			        loginPswd: {
			        	// <c:if test="${empty resident.id}">
			            required: true,
			          //</c:if>
			            minlength: 6,
			        },
			        reloginPswd: {
			        	// <c:if test="${empty resident.id}">
			            required: true,
			            //</c:if>
			            minlength: 6,
			            equalTo: "#loginPswd"
			        }
				},
				messages : {
					telphone : {
			            required : "请输入手机号",
			            minlength : "确认手机不能小于11个字符",
			            isMobile : "请正确填写您的手机号码",
			            remote: "手机号不能重复"
			        },
			        identityNo:{
			        	required :"身份证号不能为空",
                        isidcard: "请输入正确的身份证号"		     
			        },
			        qqNo :{
			        	isqq:"qq号格式不对",
			        },
			        reloginPswd: {
			            required: "请再次输入密码",
			            minlength:"密码长度不能小于6",
			            equalTo: "两次密码不一致"
			        },
			        reloginPswd: {
			            required: "请输入密码",
			            minlength:"密码长度不能小于6"
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
		<li><a href="${ctx}/resident/resident/">居民列表</a></li>
		<li class="active"><a href="${ctx}/resident/resident/form?id=${resident.id}">居民<shiro:hasPermission name="resident:resident:edit">${not empty resident.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="resident:resident:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="resident" action="${ctx}/resident/resident/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		
		<sys:message content="${message}"/>		
			<div class="control-group">
			<label class="control-label">头像：</label>
			<div class="controls">
				<form:hidden id="nameImage" path="imagesId" htmlEscape="false" maxlength="255" class="input-medium"/>
				<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属小区:</label>
			<div class="controls">
                <sys:treeselect id="office" name="belongOrg.id" value="${resident.belongOrg.id}" labelName="office.name" labelValue="${resident.belongOrg.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-medium required" notAllowSelectParent="true"/>
			    <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:radiobuttons path="gender" items="${fns:getDictList('gender')}" itemLabel="label" itemValue="value" htmlEscape="false" class="input-medium required"/>
			  <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号码：</label>
			<div class="controls">
				<form:input path="identityNo" htmlEscape="false" maxlength="50" class="input-medium required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">家庭电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="30" class="input-medium "/>
			
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
				<form:input path="telphone"  htmlEscape="false" maxlength="30" class="input-medium"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<c:if test="${resident.id ==''||resident.id==null }">
		
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="loginPswd"  type="password" htmlEscape="false" maxlength="30" class="input-medium"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
			<!-- 防止表单自动填充 -->
		</div>
		<div class="control-group">
			<label class="control-label">重复密码：</label>
			<div class="controls">
				<form:input path="reloginPswd" type="password" htmlEscape="false" maxlength="30" class="input-medium "/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		</c:if>
		<c:if test="${resident.id !='' && resident.id!=null }">
		   <input name="resident.loginPswd" value="${resident.loginPswd}" type="hidden"/>
		</c:if>
		<div class="control-group">
			<label class="control-label">QQ号：</label>
			<div class="controls">
				<form:input path="qqNo" htmlEscape="false" maxlength="30" class="input-medium "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼栋号：</label>
			<div class="controls">
				<form:input path="buildingNo" htmlEscape="false" maxlength="50" class="input-medium required"/>
			<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人简介：</label>
			<div class="controls">
			<form:textarea path="personDesc" htmlEscape="false" rows="4" maxlength="2000" class="input-large "/>
			</div>
		</div>
	
	 
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2000" class="input-large "/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="resident:resident:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>