<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/legal.css"/>
	<script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
</head>
<body>
	<c:forEach items="${page.list}" var="article" varStatus='status'>
	<c:if test="${status.index==0 }">
		<input type="hidden" id="categoryId" value="${article.category.id}"/>
		</c:if>
		<div class="div_content">
			<a target="_blank" href="${ctx}/trends-view-${article.id}${fns:getUrlSuffix()}">${article.title}</a>
			<span><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			<span>发布人：${article.user.name}</span>
			<div>
				${article.articleData.content}
			</div>
			<hr color="#CCCCCC"/>
		</div>
		</c:forEach>
		<div class="box" id="box"></div>
	
	<script type="text/javascript">
	var categoryId=$("#categoryId").val();
	var talpage=${page.last};
	var nowpage=${page.pageNo};
	if(typeof(categoryId)!='undefined'){
     $('#box').paging({
    	    initPageNo: ${page.pageNo}, // 初始页码
    	    totalPages: ${page.last}, //总页数
    	    totalCount:'共：'+ ${page.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
   //如果只有一页
     if(nowpage==talpage){
    	 $("#firstPage").attr("disabled", true); 
    	 $("#lastPage").attr("disabled", true); 
		}
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-trends"+'${fns:getUrlSuffix()}';
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-trends"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-trends"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-trends"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-trends"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
	}else{
		$(".contents").html("<h3 style='text-align: center;'>暂无数据</h3>");
	}
     </script>
	</body>
</html>