<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心－家庭档案</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
	$(function(){
		$("#resHealth").addClass("dvCheck");
		
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
        <jsp:include page="resMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">健康档案列表</div>
			<form:form id="searchForm" modelAttribute="healthRecord" action="${ctx}/res/resHealth" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="ul-form">
					<li><label>姓名：</label>
						<form:input path="familyUser.name" htmlEscape="false" maxlength="100" class="input-medium" style="width:160px;"/>
					</li>
					<li class="btns"><input id="btnSubmit" class="btn" type="submit" value="查询"/></li>
					<li class="btns"><input class="btn" type="button" value="增 加" onclick="window.location.href='${ctx}/res/resHealthForm'"/></li>
				</ul>
			</form:form>
        	<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th width="10%">姓名</th>
						<th width="10%">最近检查的血压</th>
						<th width="10%">最近检查的血脂</th>
						<th width="10%">最近检查的血糖</th>
						<th width="12%">检查时间</th>
						<th width="8%">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="healthRecord">
					<tr>
						<td>
							<a href="${ctx}/res/resHealthForm?id=${healthRecord.id}">${healthRecord.familyUser.name}</a>
						</td>
						<td>
							<c:if test="${healthRecord.bloods>=120 || (healthRecord.tbloods>=90 && healthRecord.bloods>=90) }">
								<font style="color:red;">${healthRecord.bloods}/${healthRecord.tbloods}mmHg(偏高)</font>
							</c:if>
							<c:if test="${healthRecord.bloods<=90 || (healthRecord.tbloods<=60 && healthRecord.bloods<=120) }">
								<font style="color:red;">${healthRecord.bloods}/${healthRecord.tbloods}mmHg(偏低)</font>
							</c:if>
							
							<c:if test="${healthRecord.bloods>90 && healthRecord.bloods<120 && healthRecord.tbloods>60 && healthRecord.tbloods<90}">
								<font style="color:green;">${healthRecord.bloods}/${healthRecord.tbloods}mmHg(正常)</font>
							</c:if>
						</td>
						<td>
							总胆固醇:${healthRecord.cholesterol}mmol/L<br/>
							甘油三酯:${healthRecord.triglyceride}mmol/L<br/>
							胆固醇酯:${healthRecord.cholest}mmol/L
						</td>
						<td>
							空腹:${healthRecord.fastBloods}mmol/L<br/>
							餐后1小时:${healthRecord.oneBloods}mmol/L<br/>
							餐后2小时:${healthRecord.twoBloods}mmol/L
						</td>
						<td>
							<fmt:formatDate value="${healthRecord.testDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
		    				<a href="${ctx}/res/resHealthForm?id=${healthRecord.id}">修改</a>
		    				<a href="${ctx}/res/resHealthDel?id=${healthRecord.id}" onclick="return confirmx('确认要删除该条数据吗？', this.href)">删除</a>
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