<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心－密码修改</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
	$(function(){
		   $("#resPswd").addClass("dvCheck");
		   
		   var msg = "${message}";
		   if(msg!=null && msg!=""){
			   showTip(msg);
		   }
	});
	
	//修改密码
	function updPswd(){
		var oldpswd = $("#oldpswd").val();
		var newpswd = $("#newpswd").val();
		var cnewpswd = $("#cnewpswd").val();
		if(oldpswd==null || oldpswd==""){
			showTip('旧密码不能为空');
			return false;
		}
		if(newpswd==null || newpswd==""){
			showTip('新密码不能为空');
			return false;
		}
		if(cnewpswd==null || cnewpswd==""){
			showTip('确认密码不能为空');
			return false;
		}
		if(newpswd!=cnewpswd){
			showTip('两次输入的密码不一致，请重新输入');
			return false;
		}
		$.ajax({
			type:"post",
			async:false,
			url:"${ctx}/res/resPswdUpd.do?oldpswd="+oldpswd+"&newpswd="+newpswd,
			cache:false,
			success: function(data){
				if(data && data.result){
					showTip("密码修改成功");
					$("#oldpswd").val("");
					$("#newpswd").val("");
					$("#cnewpswd").val("");
				}else{
					showTip(data.msg);
				}
			}
		});
	}
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="resMenu.jsp" />
        
        <div id="dvContentRight">
        <div class="center_title">密码修改</div>
        <form:form id="inputForm" method="post" class="form-horizontal">
	        <table id="contentTable" class="table_bor">
	        	<tr>
	        		<td class="table_form_f1">旧密码:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<input type="password" id="oldpswd"  maxlength="30" class="required"/>
	        			<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">新密码:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<input type="password" id="newpswd" name="email" maxlength="30" class="required"/>
	        			<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">确认密码:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<input type="password" id="cnewpswd" maxlength="30" class="required"/>
						<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        </table>
			<div class="form-actions">
				<input class="btn" type="button" value="提 交" onclick="updPswd();"/>&nbsp;
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>