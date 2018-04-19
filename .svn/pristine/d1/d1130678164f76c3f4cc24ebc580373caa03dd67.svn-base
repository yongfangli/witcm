<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${category.name }</title>
 <link rel="stylesheet" href="${ctxStaticItv}/css/nearByService.css" />
  <link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script>
 /* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
 function placeholderPic(){
  var w = document.documentElement.offsetWidth;
  document.documentElement.style.fontSize=w/100+'px';
 }
 placeholderPic();
 window.onresize=function(){
  placeholderPic();
 }
</script>
<body>
<div class="bigdiv">
     <!--头部标题-->
     <div class="top">
         <div class="top_cen">
           <p class="title"><a href="${ctx}/itv/indexToggle?categoryId=${category.parent.id}"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a> <span style="margin-left:40vw">${category.name }</span></p>
    	 </div>
     </div>
     <!--中间内容-->
     <div class="middle">
        <div style="height:4vh"></div>
        <div class="conten">
         <c:forEach items="${page.list}" var="cv"  varStatus="status">
           <div class="addr">
              <img src="${ctxStaticItv}/images/phone.png" class="phoneimg"/>
              <div class="contentDiv">
                 <p style="font-size:1.8em">${cv.name }</p>
                 <p style="font-size:1.4em;margin-top:1vh">电话：${cv.phone }</p>
                 <p style="font-size:1.4em">地址：${cv.address }</p>
              </div>
           </div>
           </c:forEach>
           
        </div>
     </div>
       <div class="last_page"> <c:if test="${!page.firstPage}"><a style="color: #101010;" href="${ctx}/itv/nearByService?pageNo=${page.prev}">▲</a></c:if>&emsp;${page.pageNo}/${page.last}&emsp; <c:if test="${!page.lastPage}"><a style="color: #101010;" href="${ctx}/itv/nearByService?pageNo=${page.next}">▼</a></c:if></div>
</div>
</body>

</html>