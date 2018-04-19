<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>办事指南</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/Extra09.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/paging.css">
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
    
</head>
	<body>
	<c:forEach items="${page.list}" var="article" varStatus='status'>
	<c:if test="${status.index==1 }">
		<input type="hidden" id="categoryId" value="${article.category.id}"/>
		</c:if>
		<div class="div_content" style="display:block;">
			<a href="${ctxClient}/articleDetail${fns:getUrlSuffix()}/${article.id}/?pageName=communityGuideDetail"  target="_blank">${article.title}</a>
			<span><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			<span>发布人：${article.user.name}</span>
			<hr style="margin-top:40px" color="#CCCCCC"/>
		</div>
		</c:forEach>
		<div class="box" id="box"></div>
		<script src="${ctxStatic}/client/js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/client/js/paging.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	var categoryId=$("#categoryId").val();
	var talpage=${page.last};
	var nowpage=${page.pageNo};
     $('#box').paging({
    	    initPageNo: ${page.pageNo}, // 初始页码
    	    totalPages: ${page.last}, //总页数
    	    totalCount:'共：'+ ${page.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityGuideDetail"+"&pageNo="+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityGuideDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityGuideDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityGuideDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityGuideDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	
     </script>
	</body>
</html>
