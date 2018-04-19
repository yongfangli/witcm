<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/activityDetail.css"/>
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
     <script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
	<style>
		#BBS{
			width:1200px;
		}
	</style>
</head>
	<body>
	    <div class="cur_locat">
			<a href="${ctx}">首页</a>&gt;&gt;<a href="javasctipt:void(0)">促销信息</a>
		</div>

			
		<div id="BBS">
			<!-- <a href="#" class="theme"> + 发表新主题123</a> -->
			<c:forEach items="${page.list}" var="pro" varStatus='status'>
				<div class="content_info">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2">
								<a target="_blank" href='${ctx}/promotionDetail-${pro.id}${fns:getUrlSuffix()}'>${fns:abbr(pro.titles,75)}</a>
							</td>
						</tr>
						<tr height="40px">
							<td class="content_info_td">${pro.business.fullName} | <fmt:formatDate value="${pro.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						<tr>
							<td colspan="2">
								<hr color="#D9D9D9"/>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<div class="pagination">
				<div class="box" id="box"></div>
			</div>

		<script type="text/javascript">
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
   //如果只有一页
     if(nowpage==talpage){
    	 $("#firstPage").attr("disabled", true); 
    	 $("#lastPage").attr("disabled", true); 
		}
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/promotion-list-"+pageNo+'${fns:getUrlSuffix()}';
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			var url='${ctx}'+"/promotion-list-"+pageNo+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			var url='${ctx}'+"/promotion-list-"+pageNo+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			var url='${ctx}'+"/promotion-list-"+pageNo+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			 var pageNo=talpage;
    			 var url='${ctx}'+"/promotion-list-"+pageNo+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	
     </script>
     	</div>
     </div>
	</body>
</html>
