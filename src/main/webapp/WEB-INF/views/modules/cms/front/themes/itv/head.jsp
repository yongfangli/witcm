<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<style>
.h_login{
	width: 3.5vw;
    height: 3.5vh;
    background: #fff;
    border: 1px;
    font-size: 1em;
    color: #000;
    border-radius: 0.5em;
    margin-right: 1vw;
}
</style>
<div class="top">
     <div class="conLe"> 
       <img src="${ctxStaticTheme}/images/logo.png" class="logo"/>
       <span class="top_title" onclick="window.location.href='${ctx}/itv'">井冈山智慧社区</span>
     </div>
     <div class="conRi"> 
		
	    <c:if test="${not empty itvuser}">
	    	<a href="${ctx}/itv/userMenu">
	    		<font style="color: #fff;">${itvuser.name }</font>
	    	</a>
	    </c:if>
	    <c:if test="${empty itvuser}">
	    	<input type="button" value="登录" class="h_login" onclick="window.location.href='${ctx}/itv/userMenu'">
	    	<a href="${ctx}/itv/userMenu">
       			<img src="${ctxStaticItv}/images/login.png" class="loginimg"/>
       		</a>
	    </c:if>
	    <span class="border"></span>
	    <span id="city" class="content">吉安</span>
	    <%--  <img src="${ctxStaticItv}/images/sunlignt.png" class="loginimg" style="margin-left:0.6vw;"/>  --%>
	    <span class="border"></span>
	    <span id="weather" class="content">晴</span>
	    <span id="temp" class="content"></span>
	     
	    <span id="date" class="content">2018.01.08</span>
	    <span id="week" class="content">星期四</span>
	    <span class="border"></span>
	    <span id="time" class="times">09:00</span>
     </div>
</div>
