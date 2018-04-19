<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>家属管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			//数据导入
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
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
    <div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/resident/family/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="导入"/>
			<a href="${ctx}/resident/family/import/template">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/resident/family/">家属档案列表</a></li>
		<shiro:hasPermission name="resident:family:edit"><li><a href="${ctx}/resident/family/form">家属档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="family" action="${ctx}/resident/family/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>关键字：</label>
				<form:input path="likeName" htmlEscape="false" maxlength="64" class="input-medium"/>
			<c:if test="${family.resident!=null&&family.resident.id!=null&&family.resident.id!=''}">
			<input type="hidden" name="resident.id" value="${family.resident.id}">
			</c:if>
			</li>
			<li><label>楼栋：</label>
			<form:input path="resident.buildingNo" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>社区：</label><sys:treeselect id="belongOrg" name="belongOrg.id" value="${resident.belongOrg.id}" labelName="belongOrg.name" labelValue="${resident.belongOrg.name}" 
				title="社区" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="false"/></li>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			<input id="btnImport" class="btn btn-primary" type="button" value="导入"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>所属居民</th>
				<th>楼栋</th>
				<th>性别</th>
				<th>出生年月</th>
				<th>身份证号码</th>
				<th>手机号码</th>
				<th>QQ号</th>
				<th>归属机构</th>
				<th>修改日期</th>
				<shiro:hasPermission name="resident:family:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="family">
			<tr>
				<td><a href="${ctx}/resident/family/form?id=${family.id}">
					${family.name}
				</a></td>
				<td>
					<a href="${ctx}/resident/resident/form?id=${family.resident.id}">${family.resident.name}
				</a></td>
				<td>
					${family.resident.buildingNo}
				</td>
				<td>
					${fns:getDictLabel(family.gender, 'gender', '')}
				</td>
				<td>
					<fmt:formatDate value="${family.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${family.identityNo}
				</td>
				<td>
					${family.telphone}
				</td>
				<td>
					${family.qqNo}
				</td>
			
				<td>
					${family.belongOrg.name}
				</td>
				<td>
					<fmt:formatDate value="${family.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="resident:family:edit"><td>
    				<a href="${ctx}/resident/family/form?id=${family.id}">修改</a>
					<a href="${ctx}/resident/family/delete?id=${family.id}" onclick="return confirmx('确认要删除该家属吗？', this.href)">删除</a>
					<a href="javascript:void(0)" onClick="viewHealth('${family.id}','${family.name}')">查看健康档案</a>
					<script>
					function viewHealth(id,name){
						var url="${ctx}/resident/healthRecord/list?familyUser.id="+id+"&&familyUser.name="+encodeURIComponent(encodeURIComponent(name));
					    window.location.href=url;
					}
					
					</script>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>