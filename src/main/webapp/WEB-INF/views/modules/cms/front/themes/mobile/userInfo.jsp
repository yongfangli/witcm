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
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
 <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
<style>
	div.jbox .jbox-border {
      background: none repeat scroll 0 0 #FF5722;
    }
     .c-message{
      margin-left: -135px !important;
    }
</style>
<script>
$(function(){
   $("#submit").click(function(){
	   var telphone=$("#telphone").val();
	  var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
	  var phone=$("#phone").val();
	  var home=/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
	  var qq=$("#qq").val();
	  var qqreg=/^[0-9]{1,}$/;
	   if(telphone==''||telphone=='undefined'){
			$.message({
		        message:'请输入手机号',
		        type:'error',
		        time:'1500'
		    });
	   }else if(!mobile.test(telphone)){
		   $.message({
		        message:'请输入正确的手机号',
		        type:'error',
		        time:'1500'
		    });
	   }else if(phone!=''&&phone!='undefined'&&!home.test(phone)){
		   $.message({
		        message:'请输入正确的家庭号码',
		        type:'error',
		        time:'1500'
		    });
	   }else if(qq!=''&&qq!='undefined'&&!qqreg.test(qq)){
		   $.message({
		        message:'请输入正确的qq号码',
		        type:'error',
		        time:'1500'
		        
		    });
	   }else{
		   var data=$("#form").serializeArray();
		   var building=data[6];
		 building.value=encodeURIComponent(building.value);
		   data[6]=building;
		   var des=data[9];
		   des.value=encodeURIComponent(des.value);
			   data[9]=des;
			$.ajax({
    			url:'${ctxMobile}/infoSave.json',
    		    method:"post",
    		    data:data,
    		    success:function(result){
    		    	if(result.result==true){
    		    		$.message({
					        message:'保存成功',
					        type:'success',
					        time:'1500',
					        onClose:function(){
        			        	window.location.reload();  
        			        }
					    });
    		    	}else{
    		    		$.message({
					        message:result.msg,
					        type:'error',
					        time:'1500',
					        onClose:function(){
					        	window.location.reload();
        			        }
					    });
    		    	}
    		    	
    		    }
    		})  
	   }
   })
})



</script>
</head>

<body>
<div class="wrap_box">
<!--头部部分开始-->
	<div class="user_center">
		<p style="height: 20px;"></p>
		<p><a class="back" href="${ctxMobile}/userMenu"><span> <  个人信息</span></a></p>
		<p><img src="${mobileuser.imagesId }"></p>
		<p style="text-align: center; color: #FFFFFF; margin-top: 20px;">欢迎你，<span onclick="window.location.href='${ctxMobile}/userInfo'" style="border-bottom: 1px solid #FFFFFF;">${mobileuser.name }</span></p>
	</div>
	
	<ul class="ly_box">
	    <div class="ly_text">
	         <p>姓名：</p>
	         <p>性别：</p>
	         <p>手机号码：</p>
	         <p>家庭号码：</p>
	         <p>QQ号：</p>
	         <p>身份证号：</p>
	         <p>楼栋号：</p>
	         <p>所在小区：</p>
	         <p>个人简介：</p>
	    </div>
	    <div class="ly_input">
	    <form id="form">
	       <input type="text" readonly="readonly" name="name" value="${resident.name }">
	       <input type="text" readonly="readonly" name="gender" value="${fns:getDictLabel(resident.gender, 'gender', '')}">
	       <input type="text" id="telphone" name="telphone" value="${resident.telphone }">
	       <input type="text" id="phone" name="phone" value="${resident.phone }">
	       <input type="text" id="qq" name="qqNo" value="${resident.qqNo}">
	       <input type="text" readonly="readonly" name="identityNo" value="${resident.identityNo }">
	       <input type="text"  id="buildingNo" name="buildingNo"  value="${resident.buildingNo }">
	       <sys:treeselectFront id="office" name="belongOrg.id" value="${resident.belongOrg.id}" labelName="belongOrg.name" labelValue="${resident.belongOrg.name}"
								title="社区" url="/res/orgTreeData?type=2" extId="${belongOrg.id}" cssClass="required" notAllowSelectParent="true"/>
	       <textarea class="ly_content" name="personDesc">${resident.personDesc }</textarea>
	   </form>
	    </div>
	    
	</ul>
    
    <div class="ly_submit">
    <button type="submit" id="submit" style="font-size: 16px;" >提交</button> 
	 <button type="submit" style="font-size: 16px;" onclick="window.location.href='${ctx}/mobile/exits'">退出</button> 
	</div>
    
</div>
</body>
</html>