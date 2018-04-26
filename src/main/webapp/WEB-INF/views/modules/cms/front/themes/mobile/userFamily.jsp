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
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script> 
      <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
    <style>
      .c-message{
      margin-left: -135px !important;
    }
    div.jbox .jbox-container {
    background-color: #fff;
    border: 1px solid #FF9800;
}
    .del{
        margin-left: 10px;
    display: flex;
    float: right;
    font-size: 1.1em;
    align-items: center;
    justify-content: center;
    width: 15px;
    height: 15px;
    background: #ec0606;
    color: #fff;
    border-radius: 7.5px;
    text-align: center;
}
    
    </style>
    <script>
    function editOrAdd(id){
    	var title="家属修改";
    	if(id==""||id==undefined){
    		id="";
    		title="家属添加";
    	}
      window.open("${ctxMobile}/userFamilyAdd?id="+id,title, "width=300px, height=300px,top=400px,left=500px,location=no,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");  
    }
    function del(id){
    	event.preventDefault();
    	event.stopPropagation();
    	top.$.jBox.confirm("确认删除该家庭成员吗!","等待确认",function(v,h,f){
    		if(v=="ok"){
    			$.ajax({
    		        type: 'GET',
    		        url: '${ctxMobile}/delFamily.do',
    		        dataType: 'json',
    		        data:{'id':id},
    		        success: function(data){
    		        	if(data.result==true){
    		        		$.message({
    					        message:"已成功删除",
    					        type:'success',
    					        time:'1500',
    					        onClose:function(){
    					        	window.location.reload();
            			        }
    					    });
    		        	}else {
    		        		$.message({
    					        message:data.msg,
    					        type:'error',
    					        time:'1500',
    					        onClose:function(){
            			        }
    					    });
    		        	}
    		        }
    		 });
    		}
    	},{buttonsFocus:1});
    	top.$('.jbox-body .jbox-icon').css('top','55px');
    }
    </script>  
</head>
<body>
<!-- 
<div style="width: 100vw; height: 100vh;background:rgba(0, 0, 0, 0.6); position: absolute; z-index: 99;">
	<div style="background: #F8F8F8; width: 1.8rem; height: 1.8rem;border-radius:1rem;margin: 0px auto;margin-top: 5rem">
		<img src="${ctxStaticMobile}/images/edit_user_info.png" style="width: 0.5rem;margin: 0px auto;padding-top: 0.4rem;padding-bottom: .1rem;">
		<p style="font-size: .1rem; text-align: center;">编辑成员信息</p>
	</div>
	<div style="height: .4rem;"></div>
	<div style="background: #F8F8F8; width: 1.8rem; height: 1.8rem;border-radius:1rem;margin: 0px auto;">
		<img src="${ctxStaticMobile}/images/delete_user_info.png" style="width: 0.5rem;margin: 0px auto;padding-top: 0.4rem;padding-bottom: .1rem;">
		<p style="font-size: .1rem; text-align: center;">删除成员信息</p>
	</div>
	<div style="height: .4rem;"></div>
	<div style="margin: 0px auto;"><img src="images/close.png" style="width: .6rem; margin:0px auto;"></div>
</div> -->
<div class="wrap_box" style="z-index: 1;">
<!--头部部分开始-->
	<div class="user_center">
		<p style="height: 20px;"></p>
		<p><a class="back" href="${ctxMobile}/userMenu"><span> <  家庭档案</span></a></p>
		<p><img src="${mobileuser.imagesId }"></p>
		<p style="text-align: center; color: #FFFFFF; margin-top: 20px;">欢迎你，<span onclick="window.location.href='${ctxMobile}/userInfo'" style="border-bottom: 1px solid #FFFFFF;">${mobileuser.name }</span></p>
	</div>
	
	<div class="nav_box" style="margin-top: 0.16rem;height: .8rem;">
		<p onclick="editOrAdd()" style="color: #EC3B3B ;line-height: .8rem;text-align: center;">添加家庭成员&nbsp;&nbsp;<span><!--⊕-->㊉</span></p>
    </div>
	
	<div class="nav_box" style="margin-top: 0.16rem;height: auto;">
		<ul class="rczp_box">
		<c:forEach items="${page.list}" var="family">
			<li onclick="editOrAdd('${family.id}')" class="rczp_show"><div style="float: left;">${family.name}<span>&nbsp;&nbsp;${family.telphone}</span><p>${family.identityNo}</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><%-- <span onclick="editOrAdd('${family.id}')">┆</span> --%><c:if test="${family.residentFlag!='1'}"><sapn class='del' onclick="del('${family.id}')">&times;</sapn></c:if></div></li>
		</c:forEach>
		   
		   <!-- <li class="rczp_show"><div style="float: left;">张BB<span>&nbsp;&nbsp;母亲</span><p>362427199110052648</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><span></span></div></li>
		   <li class="rczp_show"><div style="float: left;">吴CC<span>&nbsp;&nbsp;岳父</span><p>362427199110052648</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><span></span></div></li>
		   <li class="rczp_show"><div style="float: left;">罗DD<span>&nbsp;&nbsp;岳母</span><p>362427199110052648</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><span></span></div></li>
		   <li class="rczp_show"><div style="float: left;">蔡EE<span>&nbsp;&nbsp;老婆</span><p>362427199110052648</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><span></span></div></li>
		   <li class="rczp_show"><div style="float: left;">李FF<span>&nbsp;&nbsp;自己</span><p>362427199110052648</p></div><div style="float: right;font-size: 21px;padding-top: 10px;"><span></span></div></li>
		 -->
		</ul>
     	<div style="height: 10px;"></div>
    </div>
    
</div>
</body>
</html>