<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>居民管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	.statusChange{
	    font-weight: 900;
	    }
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			
	      //禁用启用状态设置
	      $(".statusChange").click(function(){
	    	  var tx=this.text;
	    	  var hrefMap=this.dataset;
  	          var url=hrefMap.href;
  	          var s_name=$("#likeName").val();
  	          var s_telphone=$("#telphone").val();
  	          var s_pageNo=$("#pageNo").val();
  	          var s_pageSize=$("#s_pageSize").val();
  	          var s_org_id=$("#belongOrgId").val();
  	          var s_org_name=$("#belongOrgName").val();
  	          url=encodeURI(encodeURI(url+"&likeName="+s_name+"&pageNo="+s_pageNo+"&pageSize="+s_pageSize+"&telphone="+s_telphone+"&belongOrg.id="+s_org_id+"&belongOrg.name="+s_org_name));
	    	  top.$.jBox.confirm("确认要"+tx+"吗？","系统提示",function(v,h,f){
	    		  if(v=="ok"){
	    			  window.location.href=url;}
	              },{buttonsFocus:1});
	    	  top.$('.jbox-body .jbox-icon').css('top','55px');
	      });
	      
			//住户导入导出
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/resident/resident/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
			
			/* $("#importForm").submit(function(){
				
					  alert("preventDefault!");
					  var event = event || window.event;
					  event.preventDefault(); // 兼容标准浏览器
					  window.event.returnValue = false; // 兼容IE6~8
					 
			})
			  */
				
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/resident/resident");
			$("#searchForm").submit();
        	return false;
        }
		 function check(e){
			var srcelement=e.srcElement||e.target;
			var file=srcelement[0];
			var filename=file.value;
			   var pre=filename.substring( filename.lastIndexOf('.')+1 ) ;
			   if(filename==""){
				   top.$.jBox.info("文件不能为空"); 
				   return false;
			   }
			   else if(pre!="xlsx"&&pre!="xls"){
				   top.$.jBox.info("文件格式只能为xls或者xlsx");
				   file.value="";
				   file.outHtml=file.outHtml;
				   return false;
			   }
			return true;
		} 
	</script>
</head>
<body>
    <div id="importBox" class="hide">
    
		<form id="importForm" onsubmit = "return check(event);"  action="${ctx}/resident/resident/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" onchange="change(event);" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary"  type="submit" value="导入"/>
			<a href="${ctx}/resident/resident/import/template">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/resident/resident/">居民列表</a></li>
		<shiro:hasPermission name="resident:resident:edit"><li><a href="${ctx}/resident/resident/form">居民添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="resident" action="${ctx}/resident/resident/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="likeName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
		
			<li><label>手机号码：</label>
				<form:input path="telphone" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>社区：</label><sys:treeselect id="belongOrg" name="belongOrg.id" value="${resident.belongOrg.id}" labelName="belongOrg.name" labelValue="${resident.belongOrg.name}" 
				title="社区" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="false"/></li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
			
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
				<input id="btnImport" class="btn btn-primary" type="button" value="导入"/></li>
			
			<li class="clearfix"></li>
			
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>身份证号码</th>
				<th>家庭电话</th>
				<th>手机号码</th>
				<th>QQ号</th>
				<th>楼栋号</th>
				<th>所属社区</th>
				<th>创建日期</th>
				<shiro:hasPermission name="resident:resident:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="resident">
			<tr>
				<td><a href="${ctx}/resident/resident/form?id=${resident.id}">
					${resident.name}
				</a></td>
				<td>
					${fns:getDictLabel(resident.gender, 'gender', '')}
				</td>
				<td>
					${resident.identityNo}
				</td>
				<td>
					${resident.phone}
				</td>
				<td>
					${resident.telphone}
				</td>
				<td>
					${resident.qqNo}
				</td>
				<td>
					${resident.buildingNo}
				</td>
				<td>
					${resident.belongOrg.name}
				</td>
				<td>
					<fmt:formatDate value="${resident.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="resident:resident:edit"><td>
				    <a class="statusChange" href="javascript:void(0)"  data-href="${ctx}${resident.loginFlagResolveUrl}">${resident.loginText}</a>
    				<a href="${ctx}/resident/resident/form?id=${resident.id}">修改</a>
    				<a href="${ctx}/resident/resident/form?id=${resident.id}&pass=true"  >修改密码</a>
					<a href="${ctx}/resident/resident/delete?id=${resident.id}" onclick="return confirmx('确认要删除该居民吗？', this.href)">删除</a>
					<a href="${ctx}/resident/family/list?resident.id=${resident.id}" >查看家庭档案</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>