<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/business.css"/>
	<script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
	 <style>
	 .contents{
	    height: 1160px;
}
	
	 .current{
	 background:#EC3B3B;
	 }
	 </style>
	 <script>
	
	
	 $(function(){
		 
		 var url='${ctx}'+'/business-list1-6${fns:getUrlSuffix()}?';
		 function getElementsByClassNames(ele,className) { 
			//获取所有子节点 
			if(document.all){ 
			var children = ele.all; 
			}else{ 
			var children = 
			ele.getElementsByTagName('*'); 
			} 
			//遍历子节点并检查className属性 
			var elements 
			= new Array(); 
			for (var i = 0; i < children.length; i++) { 
			var child 
			= children[i]; 
			var classNames = child.className.split(' '); 
			for (var j = 
			0; j < classNames.length; j++) { 
			if (classNames[j] == className) { 
			elements[elements.length] = child; 
			break; 
			} 
			} 
			} 
			return elements; 
			} ;
		function getTypeId(){
			 var spanList=document.getElementsByClassName("type");
			 var spanp=spanList[0];
			 var spanc=getElementsByClassNames(spanp,"all");
			 if(typeof(spanc)=='undefined'||typeof(spanc[0])=='undefined'||typeof(spanc[0].attributes.typeid)=='undefined'){
				 return 'typeId=';
			 }else{
				 return 'typeId='+spanc[0].attributes.typeid.value;
			 }
		};
		function getSortValue(){
			var spanList=document.getElementsByClassName("sort");
			var spanp=spanList[0];
			 var spanc=getElementsByClassNames(spanp,"all");
			 if(typeof(spanc)=='undefined'||spanc.lenght<=0){
				 return '';
			 }else{
				 var result="";
				 for(var i=0;i<spanc.length;i++){
					 var search=spanc[i].attributes.value.value;
					 if(i==0){
						 result=result+search;
					 }else{
						 result=result+"&"+search;
					 }
				 }
				 return result;
			 }
		}
		var spanparent=document.getElementsByClassName("type")[0];
	    var spanList=spanparent.children;
	    
	    var spanparents=document.getElementsByClassName("sort")[0];
	    var spanLists=spanparents.children;
		for(var i=1;i<spanList.length;i++){
			(function(i){
				spanList[i].onclick=function(){
					var typeId=this.attributes.typeid;
					if(typeof(typeId)!='undefined')
					url=url+"typeId="+typeId.value;
					var sort=getSortValue();
					url=url+"&"+sort;
					;
					function fresh(){
						window.location.href=url;
					}
					var time=setTimeout(fresh,0);
				}
			})(i);
		}
		for(var i=1;i<spanLists.length;i++){
			(function(i){
				spanLists[i].onclick=function(){
					var comment=this.attributes.value;
					if(typeof(comment)!='undefined')
						if(i==0){
							url=url+comment.value;
						}
						else{
							url=url+"&"+comment.value;
						}
					var typeId=getTypeId();
					url=url+"&"+typeId;
					;
					function fresh(){
						window.location.href=url;
					}
					var time=setTimeout(fresh,0);
				}
			})(i);
		}
		
		var typeId=getTypeId();
		var sorted=getSortValue();
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
	    		 var url='${ctx}'+"/business-list"+pageNo+"-8"+'${fns:getUrlSuffix()}'+'?'+typeId+"&"+sorted;
	    		 window.location.href=url;
	    	});
	    	$("#nextPage").click(function(){
	    		if(nowpage==talpage){
	    			return;
	    		}
	    		else{
	    			var pageNo=nowpage+1;
	    			 var url='${ctx}'+"/business-list"+pageNo+"-8"+'${fns:getUrlSuffix()}'+'?'+typeId+"&"+sorted;
	        		 window.location.href=url;
	    		}
	    	})
	    	$("#prePage").click(function(){
	    		if(nowpage==1){
	    			return;
	    		}
	    		else{
	    			var pageNo=nowpage-1;
	    			 var url='${ctx}'+"/business-list"+pageNo+"-8"+'${fns:getUrlSuffix()}'+'?'+typeId+"&"+sorted;
	        		 window.location.href=url;
	    		}
	    	})
	    	$("#firstPage").click(function(){
	    			var pageNo=1;
	    			 var url='${ctx}'+"/business-list"+pageNo+"-8"+'${fns:getUrlSuffix()}'+'?'+typeId+"&"+sorted;
	        		 window.location.href=url;
	    	})
	    	$("#lastPage").click(function(){
	    			var pageNo=talpage;
	    			 var url='${ctx}'+"/business-list"+pageNo+"-8"+'${fns:getUrlSuffix()}'+'?'+typeId+"&"+sorted;
	        		 window.location.href=url;
	    	})




     })
	 </script>
	 <style>
	  
	 
	 </style>
</head>
<body>

	    <div class="cur_locat">
			<a href="${ctx}">首页</a>&gt;&gt;<a href="javasctipt:void(0)">周边商家</a>
		</div>
		<div id="b-top">
			<div class="div_first type">
				<span class="span_first ">类别：</span>
				<c:if test="${criteria.typeId !=null && criteria.typeId !=''}">
				<span class="">全部</span>
				</c:if>
				<c:if test="${criteria.typeId ==null || criteria.typeId ==''}">
				<span class="all">全部</span>
				</c:if>
				 <c:forEach items="${bTypeList}" var="cv"  varStatus="status">
				 <c:if test="${criteria.typeId == cv.id}">
				 <span class='all' typeId="${cv.id}">${cv.name }</span>
				 </c:if>
				  <c:if test="${criteria.typeId!=cv.id}">
				<span class='' typeId="${cv.id}">${cv.name }</span>
				</c:if>
				</c:forEach>
			</div>
			<div class="div_first div_last sort">
				<span class="span_first">排序：</span>
				<c:if test="${sortflag=='0'}">
				<span class="all" value='0'>全部</span>
				<span class="" value='sortByComment=1'>好评↑</span>
				<span class="" value='sortByCollect=1'>收藏量↑</span>
				</c:if>
				<c:if test="${sortflag=='1'}">
				<span class="" value='0'>全部</span>
				<span class="all" value='sortByComment=1'>好评↑</span>
				<span class="" value='sortByCollect=1'>收藏量↑</span>
				</c:if>
				<c:if test="${sortflag=='2'}">
				<span class="" value='0'>全部</span>
				<span class="" value='sortByComment=1'>好评↑</span>
				<span class="all" value='sortByCollect=1'>收藏量↑</span>
				</c:if>
				<c:if test="${sortflag=='3'}">
				<span class="" value='0'>全部</span>
				<span class="all" value='sortByComment=1'>好评↑</span>
				<span class="all" value='sortByCollect=1'>收藏量↑</span>
				</c:if>
			</div>
			</div>
			<div  class="shop-list">
			<c:forEach items="${page.list}" var="business">
			<div class="content">
				<div class="div_img">
					<img src="${business.logoId}"/>
				</div>
				<div class="content_info">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td width="780px"><span class="b-title">${business.fullName} </span><span class="">
							<c:forEach begin="1" end="5" step="1" var="num">
							
							<c:if test="${num gt business.star}">
							<span class="color_b">&#9733;</span>
							</c:if>
							<c:if test="${num le business.star}">
							<span class="color_r">&#9733;</span>
							</c:if>
							</c:forEach>
							</span>
							</td>
							
							<td width="200px">
								<img src="${ctxStaticTheme}/images/liulan.jpg"/>${business.viewCount}
								<img src="${ctxStaticTheme}/images/weixin.jpg" />${business.commentNum}
							</td>
							<td rowspan="3">
								<a target="_blank" href="${ctx}/business-detail-${business.id}-1-1${fns:getUrlSuffix()}?tagFlag=0">详情</a>
								<a href="javascript:void(0);" onclick="collect('${business.id}')" style="margin-top: 10px;">收藏</a>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top:10px;">
								电话：${business.telphone }
							</td>
						</tr>
						<tr>
							<td colspan="2">地址：${business.address }</td>
						</tr>
					</table>
				</div>
				<hr/>
			</div>
			</c:forEach>

				<div class="pagination">
					<div class="box" id="box"></div>
				</div>
	
	<script type="text/javascript">
	
	
    	
     </script> 
		</div>
		
	</body>
</html>