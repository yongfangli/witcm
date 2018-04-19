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
	
	<script type="text/javascript">
	   $(function(){
		   $("#busGoods").addClass("dvCheck");
		   
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
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">商品列表</div>
			<form:form id="searchForm" modelAttribute="goods" action="${ctx}/bus/busGoods" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="ul-form">
					<li><label>商品全称：</label>
						<form:input path="fullName" htmlEscape="false" maxlength="100" class="input-medium" style="width:160px;"/>
					</li>
					<li class="btns"><input id="btnSubmit" class="btn" type="submit" value="查询"/></li>
					<li class="btns"><input class="btn" type="button" value="增 加" onclick="window.location.href='${ctx}/bus/busGoodsForm'"/></li>
				</ul>
			</form:form>
        	<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>商品全称</th>
						<th>商品简称</th>
						<th>商品类别</th>
						<th>参考价格(元)</th>
						<th>是否下架</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="goods">
					<tr>
						<td>
							<a href="${ctx}/bus/busGoodsForm?id=${goods.id}">${goods.fullName}</a>
						</td>
						<td>
							${goods.shortName}
						</td>
						<td>
							${goods.types.name}
						</td>
						<td>
							${goods.price}
						</td>
						<!-- <td>
							<fmt:formatDate value="${goods.shelDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td> -->
						<td>
							${fns:getDictLabel(goods.unshelFlag, 'yes_no', '')}
						</td>
						<td>
		    				<a href="${ctx}/bus/busGoodsForm?id=${goods.id}">修改</a>
							<a href="${ctx}/bus/busGoodsdel?id=${goods.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
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