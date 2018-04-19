<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>社区风貌</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/Communitystyle.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/paging.css">
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
</head>
<body>
		<div id="nav">
			<div class="nav_first">
			<c:forEach items="${page.list}" var="news" varStatus='status' end="3">
	<c:if test="${status.index==1 }">
		<input type="hidden" id="categoryId" value="${news.category.id}"/>
		</c:if>
				<div>
					<a href="javascript:void(0)"><img src="${news.image}"/></a>
					<a href="javascript:void(0)"><span>${news.title}</span></a>
				</div>
				</c:forEach>
			</div>	
			<div class="nav_first nav_second">
			<c:forEach items="${page.list}" var="news" varStatus='status' begin="4" end="7">
				<div>
					<a href="javascript:void(0)"><img src="${news.image}"/></a>
					<a href="javascript:void(0)"><span>${news.title}</span></a>
				</div>
			</c:forEach>
			</div>
		</div>
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
    		 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityFaces"+"&pageNo="+pageNo+"&pageSize=8";
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityFaces"+"&pageNo="+pageNo+"&pageSize=8";
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityFaces"+"&pageNo="+pageNo+"&pageSize=8";
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityFaces"+"&pageNo="+pageNo+"&pageSize=8";
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityFaces"+"&pageNo="+pageNo+"&pageSize=8";
        		 window.location.href=url;
    	})
    	
     </script>
	</body>
</html>
