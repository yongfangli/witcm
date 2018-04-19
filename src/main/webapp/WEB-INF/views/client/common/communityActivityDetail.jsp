<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>社区互动详情</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/Extra11.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/paging.css">
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
    
         <script src="${ctxStatic}/client/js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/client/js/paging.min.js" type="text/javascript"></script>
	
</head>
	<body>
<div id="page">
    <div id="content">
        <div id="dvTitle">
            <span>${article.title}</span>
        </div>
        <hr id="hrUp"/>
        <div id="dvDate">
            <div id="dvDateLeft">
            <span>${article.user.name}&nbsp;&nbsp;|&nbsp;&nbsp;
          <fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp;&nbsp;
            </span>
            </div>
            <div id="dvDateRight">
                <img src="${ctxStatic}/client/img/liulan.jpg"/>${article.hits}&nbsp;&nbsp;
                <img src="${ctxStatic}/client/img/weixin.jpg"/>${article.comments }
            </div>
        </div>
        <div id="dvBook">
            <div class="word">
                <p>
                 ${article.articleData.content}
                </p>
            </div>
            <div id="dvBookImage">
                 <img src="${article.image}" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;<img src="img/firefox-icon.png" /> -->
            </div>
        </div>
        <div id="dvMyRemark">
            <input type="hidden" name="pageName" value="communityActivityDetail">
            <textarea id="content1" name="content" type="text"></textarea><button id="sub1">发表</button>
         <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
          <script>
            $("#sub1").click(function(){
            	var url='${ctxClient}'+'/articleComment'+'${fns:getUrlSuffix()}'+'/'+'${article.id}';
            	var content=$("#content1").val();
            	if(content!=''&&content!=null){
            		$.post(url,{content:content},function(data){
            			if(data=='true'){
            				$.message({
            			        message:'评论成功',
            			        type:'success',
            			        time:'1000'
            			    });
            				function a(){
            					window.location.href='${ctxClient}'+'/articleDetail'+'${fns:getUrlSuffix()}'+'/'+'${article.id}'+'/?pageName=communityActivityDetail';
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
            	}else{
            		$.message({
    			        message:'请填写评论内容',
    			        type:'warning',
    			        time:'1000'
    			    });
            	}
            	
            })
            </script>
        </div>
		<div class="pinglun">最新评论2</div>
	
		<c:forEach items="${commentsPage.list}" var="comments" varStatus='status'>
				<div class="content">
			<div class="div_img">
				<img src="${comments.resident.imagesId}"/>
			</div>
			<div class="content_info">
				<table width="900px" cellpadding="0" cellspacing="0">
					<tr height="45px">
						<td class="content_info_td" align="left">${comments.resident.name} | <fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>  </td>
					</tr>
					<tr>
						<td align="left">
							<p>
								${comments.content}
							</p>
						</td>
					</tr>
				</table>
			</div>
			<hr />
		</div>
		</c:forEach>
		
		
				
     	<div class="box" id="box"></div>
		<script type="text/javascript">
	var artId='${article.id}';
	var talpage=${commentsPage.last};
	var nowpage=${commentsPage.pageNo};
     $('#box').paging({
    	    initPageNo: ${commentsPage.pageNo}, // 初始页码
    	    totalPages: ${commentsPage.last}, //总页数
    	    totalCount:'共：'+ ${commentsPage.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctxClient}'+"/articleDetail.html/"+artId+"/?pageName=communityActivityDetail"+"&pageNo="+pageNo;
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctxClient}'+"/articleDetail.html/"+artId+"/?pageName=communityActivityDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctxClient}'+"/articleDetail.html/"+artId+"/?pageName=communityActivityDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctxClient}'+"/articleDetail.html/"+artId+"/?pageName=communityActivityDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctxClient}'+"/articleDetail.html/"+artId+"/?pageName=communityActivityDetail"+"&pageNo="+pageNo;
        		 window.location.href=url;
    	})
    	
     </script>   
    </div>
</div>
</body>
</html>
