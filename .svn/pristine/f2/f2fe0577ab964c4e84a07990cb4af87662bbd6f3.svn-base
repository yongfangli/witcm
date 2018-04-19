<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/login.css" type="text/css" rel="stylesheet" />
	
	<%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
	 
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		$("#bigdiv").height($(window).height());
	});
		function login(){
			var userName = $("#userName").val();
			var password = $("#password").val();
			if(userName==null || userName==""){
				showTip('请输入手机号');
				return false;
			}
			if(password==null || password==""){
				showTip('请输入密码');
				return false;
			}
			$.ajax({
				type:"post",
				async:false,
				url:"${ctx}/itv/loginAjax.do?userName="+userName+"&password="+password,
				cache:false,
				success: function(data){
					if(data && data.result){
						window.location.href='${ctx}/itv/userMenu';
					}else{
						showTip(data.msg);
					}
				}
			});
		}
	</script>
</head>
<body>
    <div class="bigdiv" id="bigdiv">
   	 <!--头部-->
     <div class="top">
          <div class="conLe"> 
            <img src="${ctxStaticTheme}/images/logo.png" class="logo"/>
            <span class="top_title" onclick="window.location.href='${ctx}/itv'">井冈山智慧社区</span>
          </div>
          <div class="conRi">
          	<a href="${ctx}/itv/userMenu"> 
            	<img src="${ctxStaticItv}/images/login.png" class="loginimg"/>
            </a>
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
     <div class="clear"></div>
     <!--中间--> 
     <div class="middle">
      	
      	<div style="height:50px"></div>
         <div class="inputDiv">
              <img src="${ctxStaticItv}/images/username.png"  class="loginImg" />
              <input type="text" id="userName" class="input" maxlength="30" placeholder="手机号"/>
         </div>
         <div style="height:30px"></div>
         <div class="inputDiv">
              <img src="${ctxStaticItv}/images/password.png"  class="loginImg"/>
              <input type="password" id="password" class="input" maxlength="30" placeholder="密码"/>
         </div>
         <div style="height:30px"></div>
         <input type="button" value="登录" class="login" onclick="login();"/>
         
     </div>
     
   </div>
</body>
</html>