<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>商户 中心－订单管理</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	
	<script type="text/javascript">
	   $(function(){
		   $("#busOrder").addClass("dvCheck");
		   
		   	var msg = "${message}";
	    	if(msg!=null && msg!=""){
		   		showTip(msg);
	    	}
	   });
	   function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	   
	 //处理
	function orderDeal(oid){
		var orderHtml = "<div style='margin:10px;'>状态：<select id='ostatus' name='ostatus'><option value='1'>已接单</option><option value='2'>已配送</option><option value='3'>已收货</option></select></div>";
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
					url:"${ctx}/bus/busOrderUpd.do?status="+ostatus+"&oid="+oid+"&remarks="+oremarks,
					cache:false,
					success: function(data){
						if(data && data.result){
							//showTip("保存成功");
							if(ostatus=="1"){
								$("#message").val("接单成功");
							}else if(ostatus=="2"){
								$("#message").val("配送成功");
							}else if(ostatus=="3"){
								$("#message").val("收货成功");
							}
							
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
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">订单列表</div>
        	<form:form id="searchForm" modelAttribute="orders" action="${ctx}/bus/busOrder" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="message" name="message" type="hidden">
				<ul class="ul-form">
					<li><label>订单编号：</label>
						<form:input path="code" htmlEscape="false" maxlength="100" class="input-medium" style="width:160px;"/>
					</li>
					<li><label>订单状态：</label>
						<form:select path="status" itemLabel="label" itemValue="value" items="${fns:getDictAllList('goods_status')}" style="width:100px;"></form:select>
					</li>
					<li class="btns"><input id="btnSubmit" class="btn" type="submit" value="查询"/></li>
				</ul>
			</form:form>
        	<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>用户姓名</th>
						<th>商品名称</th>
						<th>数量</th>
						<th>下单时间</th>
						<th>订单状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="orders">
					<tr>
						<td>
							<a href="${ctx}/bus/busOrderForm?id=${orders.id}">${orders.code}</a>
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
						<td>
		    				<c:if test="${orders.status!=3 && orders.status!=4}">
		    					<a href="javascript:void(0)" onclick="orderDeal('${orders.id}')">处理</a>
							</c:if>
		    				<a href="${ctx}/bus/busOrderForm?id=${orders.id}">详情</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>
        
        
        </div>
    </div>
</div>
</body>
</html>