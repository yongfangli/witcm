﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>家属${not empty family.id?'修改':'添加'}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/userFamilyAdd.css" rel="stylesheet" type="text/css">  
         <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
         <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
    <style>
    .c-message{
      margin-left: -145px !important;
    }
    .form{
    width:90%;
    margin:0 auto;
            background-color: #F8F8F8;
        padding: 10px 0px;
    }
    .sub{
    justify-content:center;
    }
    .submit{
    padding:8px;
        background: red;
    color: white;
        width: 100%;
    }
   label{
     width:120px;
      text-align: right;
   }
   input {
    border: none;
    border-radius: 2px;
   }
   textarea{
    border: none;
        border-radius: 2px;
   }
    .cln{
    display:flex;
    line-height:30px;
    margin-top:10px;
    }
    .notice{
        width: 90%;
    color: red;
    margin: 0 auto;
    text-align: center;
    text-indent: 28px;
    }
    </style>
    <script>
    var houserMaster='${family.houserMaster}';
    var gender='${family.gender}';
    var deformity='${family.deformity}';
    var helpPoor='${family.helpPoor}';
    var correct='${family.correct}';
    var pension='${family.pension}';
    $(function(){
    	if(gender!=''){
    		var that=getRadio("gender",gender);
    		that.attr("checked",true);
    	}
    	if(houserMaster!=''){
    		var that=getRadio("houserMaster",houserMaster);
    		that.attr("checked",true);
    	}
    	if(deformity!=''){
    		var that=getRadio("deformity",deformity);
    		that.attr("checked",true);
    	}
    	if(helpPoor!=''){
    		var that=getRadio("helpPoor",helpPoor);
    		that.attr("checked",true);
    	}
    	if(correct!=''){
    		var that=getRadio("correct",correct);
    		that.attr("checked",true);
    	}
    	if(pension!=''){
    		var that=getRadio("pension",pension);
    		that.attr("checked",true);
    	}
    	//当输入框值变化的时候隐藏提示信息
    	var inputs=$("input");
    	for(var i=0;i<inputs.length;i++){
    		$(inputs[i]).change(function(){
    			var msg=$(this).parent(".cln").next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    		})
    	}
    	//提交
    	$("#form").submit(function(){
    		//校验
    		var name=$("input[name='name']").val();
    		var nparent=$("input[name='name']").parent(".cln");
    		if(name==""||name==undefined){
    			var msg=nparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			nparent.after("<div class='notice'>请输入家属名称</div>");
    			return false;
    		}
    		
    		var gender=$('input[name="gender"]:checked').val();
    		var gparent=$('input[name="gender"]').parent(".cln");
    		if(gender==""||gender==undefined){
    			var msg=gparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			gparent.after("<div class='notice'>请选择性别</div>");
    			return false;
    		}
    		
    		var birthday=$('input[name="birthday"]').val();
    		var bparent=$('input[name="birthday"]').parent(".cln");
    		if(birthday==""||birthday==undefined){
    			var msg=bparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			bparent.after("<div class='notice'>请输入生日</div>");
    			return false;
    		}
    		
    		var identityNo=$('input[name="identityNo"]').val();
    		var iparent=$('input[name="identityNo"]').parent(".cln");
    		 var idcard=/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/;
    		if(identityNo==""||identityNo==undefined){
    			var msg=iparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			iparent.after("<div class='notice'>请输入身份证号</div>");
    			return false;
    		}else if(!idcard.test(identityNo)){
    			var msg=iparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			iparent.after("<div class='notice'>请输入正确的身份证号</div>");
    			return false;
    		}
    		
    		var telphone=$('input[name="telphone"]').val();
    		var tparent=$('input[name="telphone"]').parent(".cln");
    		var mobile =  /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    		if(telphone==""||telphone==undefined){
    			var msg=tparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			tparent.after("<div class='notice'>请输入联系方式</div>");
    			return false;
    		}else if(!mobile.test(telphone)){
    			var msg=tparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			tparent.after("<div class='notice'>请输入正确的联系方式</div>");
    			return false;
    		}
    		
    		var houserMaster=$('input[name="houserMaster"]:checked').val();
    		var hparent=$('input[name="houserMaster"]').parent(".cln");
    		if(houserMaster==""||houserMaster==undefined){
    			var msg=hparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			hparent.after("<div class='notice'>请选择是否业主</div>");
    			return false;
    		}
    		
    		var deformity=$('input[name="deformity"]:checked').val();
    		var dparent=$('input[name="deformity"]').parent(".cln");
    		if(deformity==""||deformity==undefined){
    			var msg=dparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			dparent.after("<div class='notice'>请选择是否残疾</div>");
    			return false;
    		}
    		var helpPoor=$('input[name="helpPoor"]:checked').val();
    		var hpahrent=$('input[name="helpPoor"]').parent(".cln");
    		if(helpPoor==""||helpPoor==undefined){
    			var msg=hpahrent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			hpahrent.after("<div class='notice'>请选择是否扶贫对象</div>");
    			return false;
    		}
    		
    		
    		var correct=$('input[name="correct"]:checked').val();
    		var cparent=$('input[name="correct"]').parent(".cln");
    		if(correct==""||correct==undefined){
    			var msg=cparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			cparent.after("<div class='notice'>请选择是否矫正人员</div>");
    			return false;
    		}
    		
    		
    		var pension=$('input[name="pension"]:checked').val();
    		var pparent=$('input[name="pension"]').parent(".cln");
    		if(pension==""||pension==undefined){
    			var msg=pparent.next();
    			if(msg.attr("class")=="notice"){
    				msg.remove();
    			}
    			pparent.after("<div class='notice'>请选择是否养老对象</div>");
    			return false;
    		}
    		
    		$.ajax({
    			url:'${ctxMobile}/familySave.json',
    		    method:"post",
    		    data:$("#form").serializeArray(),
    		    success:function(result){
    		    	
    		    	if(result.result==true){
    		    		$.message({
					        message:'操作成功',
					        type:'success',
					        time:'1500',
					        onClose:function(){
					        	window.opener.location.reload();  
        			        	window.close();
        			        }
					    });
    		    	}else{
    		    		$.message({
					        message:result.msg,
					        type:'error',
					        time:'1500',
					        onClose:function(){
					        	window.opener.location.reload();  
        			        	window.close();
        			        }
					    });
    		    	}
    		    	
    		    }
    		})
    		return false;
    	})
    })
    function getRadio(select,val){
    	var radios=$('input[name='+select+']');
    	for(var i=0;i<radios.length;i++){
    		var that=$(radios[i]);
    		if(that.val()==val){
    			return that;
    		}
    	}
    	}

    </script>
</head>
<body>
<div class="wrap_box">
<div class="nav_box">
     <a class="back_but" href="${ctxMobile}/userFamily"><</a>
     <p class="nav_title">家属${not empty family.id?'修改':'添加'}</p>
</div>
<div class="form">
<form id="form" >
<input type="hidden" name="id" value="${family.id}"> 
<div class="cln"><label>名称：</label><input type="text" name="name" value="${family.name}"></div>
<div class="cln"><label>性别：</label><input type="radio" name="gender" value="0">男
<input type="radio"  name="gender" value="1">女</div>
<div class="cln"><label>出生年月：</label><input type="date" name="birthday" value="<fmt:formatDate value="${family.birthday}" pattern='yyyy-MM-dd'/>"></div>
<div class="cln"><label>身份证号：</label><input type="text" name="identityNo" value="${family.identityNo}"></div>
<div class="cln"><label>电话号码：</label><input type="text" name="telphone" value="${family.telphone}"></div>
<div class="cln"><label>是否业主：</label><input type="radio" name="houserMaster" value="1" >是<input type="radio" name="houserMaster" value="0">否</div>
<div class="cln"><label>是否残疾：</label><input type="radio" name="deformity" value="1">是<input type="radio" name="deformity" value="0">否</div>
<div class="cln"><label>是否扶贫对象：</label><input type="radio" name="helpPoor" value="1">是<input type="radio" name="helpPoor" value="0">否</div>
<div class="cln"><label>是否矫正人员：</label><input type="radio" name="correct" value="1">是<input type="radio" name="correct" value="0">否</div>
<div class="cln"><label>是否养老对象：</label><input type="radio" name="pension" value="1">是<input type="radio" name="pension" value="0">否</div>
<div class="cln"><label>个人简介：</label><textarea  name="usersDesc" rows="3" cols="13" value="${family.usersDesc}"></textarea></div>
<div class="cln sub"><input class="submit" type="submit"  value="提交"></div>
</form>
</div>
</body>
</html>





















