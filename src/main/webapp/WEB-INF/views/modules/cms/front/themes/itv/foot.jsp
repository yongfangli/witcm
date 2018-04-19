<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!--底部-->
<div class="bottom">
	  <div class="bomCon" id="menu_one">
        <!--开始循环-->
         <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
      		 <c:if test="${status.index==0&&categoryId==category.id}">
          <div class="bomHref menu_one_active" onclick="window.location.href='${ctx}/itv'" id="menu_one_${status.index}">
              <p>${category.name}</p>
          </div>
         </c:if> 
         <c:if test="${status.index==0&&categoryId!=category.id}">
          <div class="bomHref" onclick="window.location.href='${ctx}/itv'" id="menu_one_${status.index}">
              <p>${category.name}</p>
          </div>
         </c:if> 
         <c:if test="${status.index!=0&&categoryId==category.id}">
          <div class="bomHref menu_one_active" onclick="window.location.href='${ctx}/itv/indexToggle?categoryId=${category.id}'" id="menu_one_${status.index}">
              <p>${category.name}</p>
          </div>
         </c:if> 
         <c:if test="${status.index!=0&&categoryId!=category.id}" >
          <div class="bomHref" onclick="window.location.href='${ctx}/itv/indexToggle?categoryId=${category.id}'" id="menu_one_${status.index}">
              <p>${category.name}</p>
          </div>
         </c:if> 
        </c:forEach>
     
        <!--循环结束-->
     </div>
</div> 
