<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/userInfo.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
	<script type="text/javascript">
	/* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
	 function placeholderPic(){
	  var w = document.documentElement.offsetWidth;
	  document.documentElement.style.fontSize=w/100+'px';
	 }
	 placeholderPic();
	 window.onresize=function(){
	  placeholderPic();
	 };
	 
	 function page(n){
		$("#pageNo").val(n);
		$("#searchForm").submit();
    	return false;
    }
	</script>
</head>
<body>
<div class="bigdiv">
    <!--左边列表-->
    <div class="list_left">
       <div class="title"><a href="${ctx}/itv/userMenu"><img class="return" src="${ctxStaticItv }/images/return.png" ></img>
</a> 健康档案</div>
       <p><img src="${resident.imagesId }" class="headr" /></p>
       <p class="welcome">欢迎你</p>
       <p class="nickname">${resident.name }</p>
       <p><input type="button" class="close" value="退出" onclick="window.location.href='${ctx}/itv/exits'"></p>
        <div style="height:25vh"></div>
       <p class="xinxin">Copyright @ 2017-2018</p>
       <p class="xinxin">井冈山智慧社区 V1.0- Powered By</p>
       <p class="xinxin">江西电信信息产业有限共识&技术支持</p>
    </div>
    <!--右边文章-->
    <div class="left_user">
        <div class="rightBack">
        	<div style="height:3.5vh"></div>
            <div class="tableDiv">
            <form:form id="searchForm" modelAttribute="orders" action="${ctx}/itv/userHealth" method="post" class="breadcrumb form-search">
            	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	        	<table class="table"  border="1" cellspacing="0" cellpadding="0">
	                <tr class="th">
	                   <td>姓名</td>
	                   <td>最近检查的血压</td>
	                   <td>最近检查的血脂</td>
	                   <td>最近检查的血糖</td>
	                   <td>检查时间</td>
	                </tr>
	                <c:forEach items="${page.list}" var="healthRecord">
		                <tr class="tr">
		                   <td>${healthRecord.familyUser.name}</td>
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
		                   <td><fmt:formatDate value="${healthRecord.testDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                </tr>
	                </c:forEach>
	                <c:if test="${empty page.list}">
	                	<tr class="tr">
	                		<td colspan="5">暂无数据</td>
	                	</tr>
	                </c:if>
	            </table>
            </form:form>
            </div>
        </div>
        <div class="last_page">
        <c:if test="${!page.firstPage}">
        	<a href="javascript:void(1)" onclick="page('${page.prev}')">▲</a>
        </c:if>
        &emsp;${page.pageNo}/${page.last}&emsp;
        <c:if test="${!page.lastPage}">
        	<a href="javascript:void(1)" onclick="page('${page.next}')">▼</a>
        </c:if>
        </div>
    </div>
</div>
</body>
</html>