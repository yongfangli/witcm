<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>居民管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//防止表单自动填充
			
			      document.getElementById("loginPswd").value="";
		
			$("#inputForm").validate({
				// 手机号码验证
				rules : {
					loginPswd: {
			            minlength: 6,
			        },
			        reloginPswd: {
			            minlength: 6,
			            equalTo: "#loginPswd"
			        },
			        messages:{
			        	reloginPswd: {
				            required: "请再次输入密码",
				            minlength:"密码长的不能小于6",
				            equalTo: "两次密码不一致"
				        },
				        reloginPswd: {
				            minlength:"密码长的不能小于6"
				        }
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
		<li class="active"><a href="javascript:void(0)">密码修改</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="resident" action="${ctx}/resident/resident/save?pass=true" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		
		<input type="hidden" name="oldpass" value="${resident.loginPswd}">
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="loginPswd"  type="password" htmlEscape="false" maxlength="30" class="input-medium"/>
			
			</div>
			<!-- 防止表单自动填充 -->
		</div>
		<div class="control-group">
			<label class="control-label">重复密码：</label>
			<div class="controls">
				<form:input path="reloginPswd" type="password" htmlEscape="false" maxlength="30" class="input-medium "/>
			
			</div>
		</div>
	 
		<div class="form-actions">
			<shiro:hasPermission name="resident:resident:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>