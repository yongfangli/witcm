<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<%@ include file="/WEB-INF/views/client/include/head.jsp"%>
	<link href="${ctxStaticTheme}/css/newsDetail.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/activity.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/paging.css"/>
	 <script>
	 function del(id){
		 var url='${ctx}'+'/commentsdel-'+id+".json";
			$.post(url,function(data){
    			if(data.msg=='nologin'){
    				$.message({
    			        message:'请先登录',
    			        type:'warning',
    			        time:'1000'
    			    });
    				}
    			else if(data.msg=='true'){
    				$.message({
    			        message:'删除成功',
    			        type:'success',
    			        time:'1000'
    			    });
    				function a(){
    					window.location.href='${ctx}'+'/view-${article.id}${fns:getUrlSuffix()}?pageNo=${commentsPage.pageNo}';
    				};
    				setTimeout(a,1000);
    			}else{
    				$.message({
    			        message:'删除失败',
    			        type:'error',
    			        time:'1000'
    			    });
    			}
    		});
	 }
	 $(function(){
            $("#sub1").click(function(){
            	var url='${ctx}'+'/comment-${article.id}'+".json";
            	var content=$.trim($("#content1").val());
            	if(content!=''&&content!=null){
            		if(content.length>=500){
                		$.message({
        			        message:'评论内容不能超过500个字',
        			        type:'error',
        			        time:'1000'
        			    });
                	}else{
            		$.post(url,{content:content},function(data){
            			if(data.msg=='nologin'){
            				$.message({
            			        message:'请先登录',
            			        type:'warning',
            			        time:'1000'
            			    });
            				}
            			else if(data.msg=='true'){
            				$.message({
            			        message:'评论成功',
            			        type:'success',
            			        time:'1000'
            			    });
            				function a(){
            					window.location.href='${ctx}'+'/view-${article.id}${fns:getUrlSuffix()}?pageNo=${commentsPage.pageNo}';
            				};
            				setTimeout(a,1000);
            			}else{
            				$.message({
            			        message:'评论失败',
            			        type:'error',
            			        time:'1000'
            			    });
            			}
            		});
            	} }
            	else{
            		$.message({
    			        message:'评论不能为空',
    			        type:'warning',
    			        time:'1000'
    			    });
            	}
            	
            })})
            </script>
            <style>
	.comments{
		/*display: flex;*/
		/*flex-direction: column;*/
		/*align-items: center;*/
	}
            
     .box {
   		 height: 28px;
    	line-height: 28px;
    	left: 37%;
        position: static;
   		text-align: center;
	 }
	.reply{
		font-size:0.9em;
		color: #295c9d;
    	float: right;
	}

	.bottom{
		border:none !important;
	;
	}

            </style>
</head>
<body>
		<div id="out">
			<h3>${article.title}</h3>
			<hr color="#DADADA"/>
			<div class="author">
				<span>发布人：${article.user.name}</span>
				<span>发布时间：<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				<%-- <span>
					<img src="${ctxStatic}/client/img/fenxiang.jpg"/>
					我要分享
					<img src="${ctxStatic}/client/img/jiantou.jpg"/>
				</span> --%>
			</div>
			<div class="div_center article-content" >
				<div class="content">
		              ${article.articleData.content}
		         </div>
			</div>
			<c:if test="${canComment}">
	   <div class="comments">
			  <div id="dvMyRemark">
            <input type="hidden" name="pageName" value="communityActivityDetail">
            <textarea id="content1" name="content" type="text"></textarea><button id="sub1">发表</button>
         <script src="${ctxStaticTheme}/js/message.js" type="text/javascript"></script>
         
        </div>
		<div class="pinglun">最新评论</div>
	  
	    <c:if test='${fn:length(commentsPage.list)==0}'>
	      <div class="empty">
	            <h4 style="text-align:center">暂无评论</h4>
		</div>
		</c:if>
		<c:forEach items="${commentsPage.list}" var="comments" varStatus='status'>
				<div class="content">
			<div class="content_info">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr height="45px">
						<td class="content_info_td" align="left">${comments.resident.name} | <fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>｜ ${comments.resident.belongOrg.name}  </td>
					</tr>
					<tr>
						<td align="left">
							<p>
								${comments.content}
								<c:if test="${comments.canDel}"><a class="reply" href="javascript:;" onclick="del('${comments.id}')" >删除</a></c:if>
							</p>
							
						</td>
						</tr>
					
				</table>
			</div>
			<hr />
		</div>
		</c:forEach>
		   <div class="pagination">
			   <div class="box" id="box"></div>
		   </div>

			<script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
		<script type="text/javascript">
	var artId='${article.id}';
	var talpage=${commentsPage.last};
	var nowpage=${commentsPage.pageNo};
	var count=${commentsPage.count};
	if(count>0){
     $('#box').paging({
    	    initPageNo: ${commentsPage.pageNo}, // 初始页码
    	    totalPages: ${commentsPage.last}, //总页数
    	    totalCount:'共：'+ ${commentsPage.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
     //如果只有一页
     if(1==talpage){
    	 $("#firstPage").attr("disabled", true); 
    	 $("#lastPage").attr("disabled", true); 
		};
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctx}/view-'+artId+'${fns:getUrlSuffix()}?pageNo='+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}/view-'+artId+'${fns:getUrlSuffix()}?pageNo='+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}/view-'+artId+'${fns:getUrlSuffix()}?pageNo='+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctx}/view-'+artId+'${fns:getUrlSuffix()}?pageNo='+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctx}/view-'+artId+'${fns:getUrlSuffix()}?pageNo='+pageNo;
        		 window.location.href=url;
    	})
	}
     </script>   
			
			
			</div>
			</c:if>
			<div class="bottom clearfix">
				<div class="bottom_left">
				<c:if test="${null!=pre }">
					<a target="_blank" href="${ctx}/view-${pre.id}${fns:getUrlSuffix()}">&lsaquo; 上一篇 </a>
					<span>${fns:abbr(pre.title,80)}</span>
					</c:if>
					<c:if test="${null==pre }">
					
					<a href="javascript:void(0);">&lsaquo;上一篇</a>
					<span>没有了</span>
					</c:if>
				</div>
				<div class="bottom_right">
				<c:if test="${null!=next}">
				    <span>${fns:abbr(next.title,80)}</span>
					<a target="_blank" href="${ctx}/view-${next.id}${fns:getUrlSuffix()}">下一篇&rsaquo;  </a>
					</c:if>
					<c:if test="${null==next}">
					<span>没有了</span>
					<a href="javascript:void(0);">下一篇&rsaquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</body>
</html>