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
	
</head>
<body>
<c:if test="${fn:length(page.page)==0}">
		<div class="div_content" style="display:block;">
网站暂时没有相关内容,您可以尝试使用其他关键字进行搜索!
		</div>
</c:if>
	    <c:forEach items="${page.page}" var="page" varStatus='status'>
		<div class="div_content" style="display:block;">
			<a target="_blank" href="${page.url}">${fns:abbr(page.title,100)}</a>
			<hr style="margin-top:40px" color="#CCCCCC"/>
		</div>
		</c:forEach>
        <div class="box" id="box"></div>
	<script src="${ctxStatic}/client/js/paging.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	var talpage=${page.total};
	var nowpage=${page.curPage};
	if(${page.count}>0){
     $('#box').paging({
    	    initPageNo: ${page.curPage}, // 初始页码
    	    totalPages: ${page.total}, //总页数
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
    		 var url='${ctx}'+"/search${fns:getUrlSuffix()}?content="+encodeURIComponent(encodeURIComponent('${searchName}'))+"&pageNo="+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/search${fns:getUrlSuffix()}?content="+encodeURIComponent(encodeURIComponent('${searchName}'))+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/search${fns:getUrlSuffix()}?content="+encodeURIComponent(encodeURIComponent('${searchName}'))+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctx}'+"/search${fns:getUrlSuffix()}?content="+encodeURIComponent(encodeURIComponent('${searchName}'))+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/search${fns:getUrlSuffix()}?content="+encodeURIComponent(encodeURIComponent('${searchName}'))+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
	}else{
		$(".contents").html("<h3 style='text-align: center;'>暂无数据</h3>");
	}
     </script>
	</body>
</html>