<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<link href="${ctxStaticItv}/css/userMenu.css" type="text/css" rel="stylesheet" />
	
	 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		$("#itvUserName").attr("tabindex","-1");
	});
	</script>
</head>
<body>
    <div class="bigdiv">
    <a href="${ctx}/itv" tabindex="-1" id="itv_back" style="display: none;"></a>
   	 <!--头部-->
     <jsp:include page="head.jsp" />
     <div class="clear"></div>
     <!--中间--> 
     <div class="middle">
     	<a class="div_focus" href="${ctx}/itv/userInfo" tabindex="1">
	      	<div class="typeList" style="background:#448EEF">
	          <img src="${ctxStaticItv}/images/userinfo2.png" />
	          <p>个人信息</p>
	        </div>
        </a>
        <a class="div_focus" href="${ctx}/itv/userFamily" tabindex="2">
        <div class="typeList" style="background:#FF6A94">
          <img src="${ctxStaticItv}/images/dangan.png"/>
          <p>家庭档案</p>
        </div>
        </a>
        <a class="div_focus" href="${ctx}/itv/userHealth" tabindex="3">
        <div class="typeList" style="background:#4A991C">
          <img src="${ctxStaticItv}/images/dangan2.png"/>
          <p>健康档案</p>
        </div>
        </a>
        <a class="div_focus" href="${ctx}/itv/userOrder" tabindex="4">
	        <div class="typeList" style="background:#FF6606">
	          <img src="${ctxStaticItv}/images/yuding.png"/>
	          <p>预订商家</p>
	        </div>
        </a>
        <a class="div_focus" href="${ctx}/itv/userPoints" tabindex="5">
        <div class="typeList" style="background:#FFA302">
          <img src="${ctxStaticItv}/images/jifen.png"/>
          <p>个人积分</p>
        </div>
        </a>
        <a class="div_focus" href="${ctx}/itv/userCollect" tabindex="6">
        <div class="typeList" style="background:#728BFF">
          <img src="${ctxStaticItv}/images/shoucang.png"/>
          <p>个人收藏</p>
        </div>
         </a>
     </div>
     
   </div>
</body>
</html>