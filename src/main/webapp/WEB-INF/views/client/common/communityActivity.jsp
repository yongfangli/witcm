<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>社区互动</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/Extra10.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/paging.css">
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
    
</head>
	<body>
		<div id="BBS">
			<!-- <a href="#" class="theme"> + 发表新主题11</a> -->
				<c:forEach items="${page.list}" var="article" varStatus='status'>
	<c:if test="${status.index==1 }">
		<input type="hidden" id="categoryId" value="${article.category.id}"/>
		</c:if>
			<div class="content">
				<div class="div_img">
					<img src="${article.image}"/>
				</div>
				<div class="content_info">
					<table width="900px" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2">
								<a href="${ctxClient}/articleDetail${fns:getUrlSuffix()}/${article.id}/?pageName=communityActivityDetail"  target="_blank"">${article.title}</a>
							</td>
						</tr>
						<tr height="45px">
							<td style="width: 555px;" class="content_info_td">${article.user.name } | <fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
							<td valign="middle" style="color: #858585;">
								<img src="${ctxStatic}/client/img/liulan.jpg"/>${article.hits }
								<img src="${ctxStatic}/client/img/weixin.jpg"/>${article.comments }
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr color="#D9D9D9"/>
							</td>
						</tr>
					</table>
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
    		 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityActivity"+"&pageNo="+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityActivity"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityActivity"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityActivity"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctxClient}'+"/articleList.html/"+categoryId+"/?pageName=communityActivity"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	
     </script>
	</body>
</html>
