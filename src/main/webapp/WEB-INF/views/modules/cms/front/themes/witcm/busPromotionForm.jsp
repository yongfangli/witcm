<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>商户 中心－促销管理</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	
	<script type="text/javascript">
	   $(function(){
		   $("#busPromotion").addClass("dvCheck");
		   
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
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">
	        	<c:if test="${not empty promotion.id }">促销修改</c:if>
	        	<c:if test="${empty promotion.id }">促销增加</c:if>
	        </div>
        	<form:form id="inputForm" modelAttribute="promotion" action="${ctx}/bus/busPromotionSave${urlSuffix}" method="post" class="form-horizontal">
	        	<form:hidden path="id"/>
	        	<table id="contentTable" class="table_bor">
		        	<tr>
		        		<td class="table_form_f1">促销主题：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<form:input path="titles" htmlEscape="false" maxlength="200" class="input-xlarge required" style="width:300px;"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">是否下线：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<form:radiobuttons path="offlineFlag" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">截止日期：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
							value="<fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d'});"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">促销内容：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<form:textarea path="contents" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge required" style="width:400px;"/>
						<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        </table>
	        
				<div class="form-actions">
					<input class="btn" type="submit" value="提 交"/>&nbsp;
					<input class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/bus/busPromotion'"/>&nbsp;
				</div>
	        
	        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>