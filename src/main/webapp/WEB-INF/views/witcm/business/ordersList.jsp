<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		//处理
		function orderDeal(oid){
			var orderHtml = "<div style='margin:10px;'>状态：<select id='ostatus' name='ostatus'><option value='1'>已接单</option>"+
							"<option value='2'>已配送</option><option value='3'>已收货</option><option value='4'>已取消</option></select></div>";
			orderHtml += "<div style='margin:10px;'>说明：<textarea rows='3' cols='20' id='oremarks' name='oremarks' maxlength='300'></textarea></div>";
			var orderSubmit = function(v,h,f){
			   if(v==1){
				   return true;
			   }else if(v==0){
				   var oremarks = $.trim(f.oremarks);
				   var ostatus = f.ostatus;
				   if(ostatus==null || ostatus==""){
					   showTip("请选择处理状态");
					   return false;
				   }
				   $.ajax({
						type:"post",
						async:false,
						url:"${ctx}/business/orders/orderDeal.do?status="+ostatus+"&oid="+oid+"&remarks="+oremarks,
						cache:false,
						success: function(data){
							if(data && data.result){
								showTip("保存成功");
								$("#searchForm").submit();
								return true;
							}else{
								showTip(data.msg);
								return false;
							}
						}
					});
			   }
		   };
			$.jBox(orderHtml, {title:"订单处理",submit:orderSubmit, buttons:{"确认":0,"关闭":1}});
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/business/orders/">订单列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="orders" action="${ctx}/business/orders/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>居民姓名：</label>
				<form:input path="resident.name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品名称：</label>
				<form:input path="goods.fullName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>订单编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>订单编号</th>
				<th>居民名称</th>
				<th>商品名称</th>
				<th>数量</th>
				<th>下单时间</th>
				<th>订单状态</th>
				<shiro:hasPermission name="business:orders:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orders">
			<tr>
				<td>
					<a href="${ctx}/business/orders/form?id=${orders.id}">${orders.code}</a>
				</td>
				<td>
					${orders.resident.name}
				</td>
				<td>
					${orders.goods.fullName}
				</td>
				<td>
					${orders.numbers}
				</td>
				<td>
					<fmt:formatDate value="${orders.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(orders.status, 'goods_status', '')}
				</td>
				<shiro:hasPermission name="business:orders:edit"><td>
					<c:if test="${orders.status!=3 && orders.status!=4}">
		    			<a href="javascript:void(0)" onclick="orderDeal('${orders.id}')">处理</a>
					</c:if>
					<a href="${ctx}/business/orders/form?id=${orders.id}">详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>