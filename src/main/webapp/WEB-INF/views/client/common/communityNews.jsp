<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新闻社区</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/CommunityNews02.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/paging.css">
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
     
</head>
	<body>
	<c:forEach items="${page.list}" var="news" varStatus='status'>
	<c:if test="${status.index==1 }">
		<input type="hidden" id="categoryId" value="${news.category.id}"/>
		</c:if>
		<div id="news">
			<div class="news_clock">
				<span class="news_clock_date"><fmt:formatDate value="${news.updateDate}" pattern="yyyy-MM-dd"/></span>
				<span class="news_clock_time"><fmt:formatDate value="${news.updateDate}" pattern="HH:mm:ss"/></span>
				<span class="news_clock_person">发布人：${news.user.name}</span>
			</div>
			<div class="news_line">
				<img src="${ctxStatic}/client/img/lin.png"/>
			</div>
			<div class="new_img">
				<img src="${news.image}"/>
			</div>
			<div class="news_news">
				<a href="${ctxClient}/articleDetail${fns:getUrlSuffix()}/${news.id}/?pageName=communityNewsDetail"  target="_blank">${news.title}</a>
				<span>
				${news.articleData.content}
					<!--  ${news.articleData.content}-->
				</span>
			</div>
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
    		 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityNews"+"&pageNo="+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityNews"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityNews"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityNews"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityNews"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	
     </script>
	</body>
</html>
