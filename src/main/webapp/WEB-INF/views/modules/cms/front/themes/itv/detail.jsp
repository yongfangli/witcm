<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>文章详情</title>
	<link href="${ctxStaticItv}/css/detail.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
		<link rel="stylesheet" href="${ctxStaticItv}/css/comment.css" />
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
    <script>
        $(function(){
            var winH = $(window).height();
            var winW = $(window).width();
            $(".bigdiv").height(winH);
            $(".top").height(winH*0.11);
            $(".title").css("lineHeight",winH*0.11+"px");
            $(".middle").height(winH*0.77);
            $(".middle").css({
                "marginTop":winH*0.03+"px",
                "paddingTop":winH*0.03+"px",
                "paddingBottom":winH*0.03+"px"
            });



        })
    </script>
    <style>
        .middle{
            padding-left:30px ;
            padding-right:30px ;
        }
        .conten{
            overflow: auto;
            width:100%;
            height:100%;

        }
    </style>
</head>
<body>
<div class="bigdiv">
     <!--头部标题002-->
     <div class="top">
           <div class="top_cen">
          <c:if test="${urlFlag=='category'}"> 
           <p class="title">
           <a href="${ctx}/itv/categoryToggle?categoryId=${article.category.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv}/images/return.png" ></img></a><span>${article.title }</span></p>
         </c:if>
          <c:if test="${urlFlag!='category'}">  
           <p class="title">
           <a href="${ctx}/itv/indexToggle?categoryId=${article.category.id}" id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv}/images/return.png" ></img></a><span>${article.title }</span></p>
    	 </c:if>
    	 </div>
     </div>
     <!--中间内容-->
     <div class="middle head_focus" tabindex="1">

        <div class="conten">
           <p class="article">${article.articleData.content}</p>
            <c:if test="${category.allowComment=='1'}">
            <div class="commentDivs">
              <p>最新评论</p>
            </div>
             <c:forEach items="${commentsPage.list}" var="c" varStatus="status"> 
            <div class="commentDiv">
                 <img src="${c.resident.imagesId}" class="comImg"/>
                 <div class="contents">
                    <p>${c.resident.name} ｜ <fmt:formatDate value="${c.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>｜ ${c.resident.belongOrg.name} </p>
                    <hr class="comhr"/>
                    <p class="comp">${c.content}</p>
                 </div>
             </div>
             </c:forEach>
             </c:if>
               
        </div>
     </div>
</div>



    
     
</body>
</html>