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
	<style type="text/css">
		fieldset{
			border: 1px solid #6C6C6C;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$("#busOrder").addClass("dvCheck");
		
	});
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        <div class="center_title">订单详情</div>
        <form:form id="inputForm" class="form-horizontal">
        	<fieldset>
        		<legend>订单信息</legend>
		        <div class="control-group">
					<label class="control-label">订单编号：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.code }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">数量：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.numbers }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">商品名称：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.goods.fullName }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">用户姓名：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.resident.name }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">所属社区：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.belongOrg.name }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">楼栋号：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.resident.buildingNo }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系电话：</label>
					<div class="controls">
						<input type="text" style="width:300px;" value="${orders.resident.telphone }" readonly="readonly">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">订单状态：</label>
				    <div class="controls">
						<input type="text" style="width:300px;" value="${fns:getDictLabel(orders.status, 'goods_status', '')}" readonly="readonly">
					</div>
				</div>
			</fieldset>
			<fieldset>
        		<legend>订单跟踪记录</legend>
        		<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>处理人</th>
						<th>时间</th>
						<th>状态</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="record">
					<tr>
						<td>
							${record.dealUserName}
						</td>
						<td>
							<fmt:formatDate value="${record.dealDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							${fns:getDictLabel(record.dealStatus, 'goods_status', '')}
						</td>
						<td>
							${record.remarks}
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
        	</fieldset>
        	
			<div class="form-actions">
				<input class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/bus/busOrder'"/>
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>