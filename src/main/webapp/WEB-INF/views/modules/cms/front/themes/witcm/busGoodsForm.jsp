<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>商户 中心－商品管理</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet">
	
	<script type="text/javascript">
	   $(function(){
		   $("#busGoods").addClass("dvCheck");
		   
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
	        	<c:if test="${not empty goods.id }">商品修改</c:if>
	        	<c:if test="${empty goods.id }">商品增加</c:if>
	        </div>
	        <form:form id="inputForm" modelAttribute="goods" enctype="multipart/form-data" action="${ctx}/bus/busGoodsSave" method="post" class="form-horizontal">
	        	<form:hidden path="id"/>
	        	<form:hidden path="imagesId"/>
	        	<table id="contentTable" class="table_bor">
		        	<tr>
		        		<td class="table_form_f1">商品类别：</td>
		        		<td class="table_form_f2" colspan="2">
		        			<sys:treeselectFront id="goodsTypes" name="types.id" value="${goods.types.id}" labelName="types.name" labelValue="${goods.types.name}"
							title="类别" url="/bus/goodsTreeData" extId="${types.id}" cssClass="required"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        		<td class="table_form_f2" rowspan="3">
		        			<div style="text-align: center;width: 100%;">
		        				<img src="${goods.imagesId }" width="90px" height="110px"/>
								<input type="file" id="logoId" name="file" class="isimages"/>
		        			</div>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">商品全称：</td>
		        		<td class="table_form_f2" colspan="2">
		        			<form:input path="fullName" htmlEscape="false" maxlength="100" class="input-xlarge required" style="width:300px;"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">商品简称：</td>
		        		<td class="table_form_f2" colspan="2">
		        			<form:input path="shortName" htmlEscape="false" maxlength="100" class="input-xlarge required" style="width:300px;"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">参考价格(元)：</td>
		        		<td class="table_form_f2">
		        			<form:input path="price" htmlEscape="false" maxlength="8" class="input-xlarge required isnumber" style="width:150px;"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        		<td class="table_form_f1">是否下架：</td>
		        		<td class="table_form_f2">
		        			<form:radiobuttons path="unshelFlag" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
							<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">商品描述：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<form:textarea path="describes" htmlEscape="false" rows="4" maxlength="300" class="input-xxlarge required" style="width:300px;"/>
						<span class="help-inline"><font color="red">*</font></span>
		        		</td>
		        		
		        	</tr>
		        	<tr>
		        		<td class="table_form_f1">备注：</td>
		        		<td class="table_form_f2" colspan="3">
		        			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge" style="width:300px;"/>
		        		</td>
		        	</tr>
		        </table>
		        
				<div class="form-actions">
					<input class="btn" type="submit" value="提 交"/>&nbsp;
					<input class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/bus/busGoods'"/>&nbsp;
				</div>
	        
	        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>