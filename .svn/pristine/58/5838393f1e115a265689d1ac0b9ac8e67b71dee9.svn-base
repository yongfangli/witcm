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
	        	<div class="center_title">促销列表</div>
				<form:form id="searchForm" modelAttribute="promotion" action="${ctx}/bus/busPromotion" method="post" class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<ul class="ul-form">
						<li><label>促销主题：</label>
							<form:input path="titles" htmlEscape="false" maxlength="100" class="input-medium" style="width:200px;"/>
						</li>
						<li class="btns"><input id="btnSubmit" class="btn" type="submit" value="查询"/></li>
						<li class="btns"><input class="btn" type="button" value="增 加" onclick="window.location.href='${ctx}/bus/busPromotionForm'"/></li>
					</ul>
				</form:form>
	        	<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th width="20%">促销主题</th>
							<th width="40%">促销内容</th>
							<th width="15%">截止日期</th>
							<th width="8%">是否下线</th>
							<th width="8%">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="promotion">
						<tr>
							<td>
								<a href="${ctx}/bus/busPromotionForm?id=${promotion.id}">${promotion.titles}</a>
							</td>
							<td>${promotion.contents}</td>
							<td>
								<fmt:formatDate value="${promotion.endDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>
								${fns:getDictLabel(promotion.offlineFlag, 'yes_no', '')}
							</td>
							<td>
			    				<a href="${ctx}/bus/busPromotionForm?id=${promotion.id}">修改</a>
								<a href="${ctx}/bus/busPromotionDel?id=${promotion.id}" onclick="return confirmx('确认要删除该促销活动吗？', this.href)">删除</a>
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