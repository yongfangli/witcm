<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/index.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
	 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
	
</head>
<body>
    <div class="bigdiv">
   	 <!--头部-->
     <jsp:include page="head.jsp" />
        
     <div class="clear"></div>
     <!--中间--> 
     <div class="middle">
       	<div class="mid_con_tour">
            <div class="tvimg">
               <video src="${category.image}" controls="controls" class="TVimg" />
            </div>
	        <div class="contentTourList">
	        <c:forEach items="${categoryList}" var="category" varStatus="status" >
              <c:if test="${status.index%2==0}">
               <div class="con_top" style="background:#3D9972" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'">
                 <img src="${category.image}" class="content_img" />
                 <br/><br/>
              	 <p>${category.name }</p>
               </div>
               </c:if>
               <c:if test="${status.index%2!=0}">
               <div class="con_bom" style="background:#FF6606" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${category.id}'">
                 <img src="${category.image}" class="content_img" />
                 <br/><br/>
              	 <p>${category.name }</p>
               </div></c:if>
               </c:forEach>
            </div>
       </div>
     </div>
    <!--底部-->
     <jsp:include page="foot.jsp" />
     
   </div>
</body>
</html>