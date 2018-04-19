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
		<p><a class="back" href="${ctxMobile}/userMenu"><span> <  个人积分</span></a></p>
		<p><img src="${mobileuser.imagesId }"></p>
		<p style="text-align: center; color: #FFFFFF; margin-top: 20px;">欢迎你，<span style="border-bottom: 1px solid #FFFFFF;">${mobileuser.name }</span></p>
	</div>
	
	
	<div class="nav_box" style="margin-top: 0.16rem;padding-left:10%;height: 3.5rem;">
		<div style="height: 20px;"></div>
     <table style="width: 92vw;margin:0px auto;height:20vh">
      	<tr>
      		<td>总积分</td>
      		<td style=""><input type="button" class="integral1" value="${empty resident.totalPoints ? 0 : resident.totalPoints}"></td>
      	</tr>
      	<tr>
      		<td>可用积分</td>
      		<td><input type="button" class="integral2" value="${empty resident.usablePoints ? 0 : resident.usablePoints }"></td>
      	</tr>
      	<tr>
      		<td>已用积分</td>
      		<td><input type="button" class="integral3" value="${empty resident.usedPoints ? 0 : resident.usedPoints}"></td>
      	</tr>
    	
    </table>
    </div>
    
</div>

</body>
</html>