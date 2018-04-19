<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/paging.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/Communitystyle.css"/>
</head>
<body>
  <body>
		<div id="nav">
			<div class="nav_first">
			<c:forEach items="${page.list}" var="news" varStatus='status' end="3">
	<c:if test="${status.index==0}">
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
	<script src="${ctxStatic}/client/js/paging.min.js" type="text/javascript"></script>
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
    
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-faces"+'${fns:getUrlSuffix()}';
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-faces"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-faces"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-faces"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/list"+pageNo+"-"+categoryId+"-faces"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
	}else{
    		$(".contents").html("<h3 style='text-align: center;'>暂无数据</h3>");
    	}
    	
     </script>
	</body>
</html>