<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/userstyle.css" rel="stylesheet" type="text/css">  
</head>
<body>
<div class="wrap_box">
<!--头部部分开始-->
	<div class="user_center">
		<p style="height: 20px;"></p>
		<p><a class="back" href="${ctxMobile}/userMenu"><span> <  个人信息</span></a></p>
		<p><img src="${mobileuser.imagesId }"></p>
		<p style="text-align: center; color: #FFFFFF; margin-top: 20px;">欢迎你，<span style="border-bottom: 1px solid #FFFFFF;">${mobileuser.name }</span></p>
	</div>
	
	<ul class="ly_box">
	    <div class="ly_text">
	         <p>姓名：</p>
	         <p>性别：</p>
	         <p>手机号码：</p>
	         <p>家庭号码：</p>
	         <p>QQ号：</p>
	         <p>身份证号：</p>
	         <p>所在小区：</p>
	         <p>楼栋号：</p>
	         <p>个人简介：</p>
	    </div>
	    <div class="ly_input">
	       <input type="text" readonly="readonly" value="${resident.name }">
	       <input type="text" readonly="readonly" value="${fns:getDictLabel(resident.gender, 'gender', '')}">
	       <input type="text" readonly="readonly" value="${resident.telphone }">
	       <input type="text" readonly="readonly" value="${resident.phone }">
	       <input type="text" readonly="readonly" value="${resident.qqNo }">
	       <input type="text" readonly="readonly" value="${resident.identityNo }">
	       <input type="text" readonly="readonly" value="${resident.belongOrg.name }">
	       <input type="text" readonly="readonly" value="${resident.buildingNo }">
	       <textarea class="ly_content">${resident.personDesc }</textarea>
	    </div>
	    
	</ul>
    
    <div class="ly_submit">
	 <button type="submit" style="font-size: 16px;" onclick="window.location.href='${ctx}/mobile/exits'">退出</button> 
	</div>
    
</div>
</body>
</html>