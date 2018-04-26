<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>密码修改</title>
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
      margin-left: -130px !important;
    }
    .form{
    width: 90%;
    margin: 0 auto;
     background-color: #F8F8F8;
    padding: 10px 0px;
    color: #060606;
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
    outline: none;
    border: none;
    border-radius: 2px;
   }
   textarea{
   outline: none;
    border: none;
    border: 1px solid beige;
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
    <script type="text/javascript">
	$(function(){
		   $("#resPswd").addClass("dvCheck");
		   var msg = "${message}";
		   if(msg!=null && msg!=""){
			   $.message({
			        message:msg,
			        type:'error',
			        time:'1500'
			    });
		   }
	});
	
	//修改密码
	function updPswd(){
		var oldpswd = $("#oldpswd").val();
		var newpswd = $("#newpswd").val();
		var cnewpswd = $("#cnewpswd").val();
		if(oldpswd==null || oldpswd==""){
			$.message({
		        message:'旧密码不能为空',
		        type:'error',
		        time:'1500'
		    });
			return false;
		}
		if(newpswd==null || newpswd==""){
			$.message({
		        message:'新密码不能为空',
		        type:'error',
		        time:'1500'
		    });
			return false;
		}
		if(cnewpswd==null || cnewpswd==""){
			$.message({
		        message:'确认密码不能为空',
		        type:'error',
		        time:'1500'
		    });
			return false;
		}
		if(newpswd!=cnewpswd){
			$.message({
		        message:'两次输入的密码不一致，请重新输入',
		        type:'error',
		        time:'1500'
		    });
			return false;
		}
		$.ajax({
			type:"post",
			async:false,
			url:"${ctxMobile}/resPswdUpd.do?oldpswd="+oldpswd+"&newpswd="+newpswd,
			cache:false,
			success: function(data){
				if(data && data.result){
					$.message({
				        message:"密码修改成功",
				        type:'success',
				        time:'1500',
				        onClose:function(){
				        	window.location.reload();  
    			        }
				      
				    });
					$("#oldpswd").val("");
					$("#newpswd").val("");
					$("#cnewpswd").val("");
				}else{
					$.message({
				        message:data.msg,
				        type:'error',
				        time:'1500'
				    });
				}
			}
		});
	}
    </script>
</head>
<body>
<div class="wrap_box">
<div class="nav_box">
     <a class="back_but" href="javascript:history.back(-1)"><</a>
     <p class="nav_title">密码修改</p>
</div>
<div class="form">
<form id="form" >
<div class="cln"><label>原密码：</label><input type="password" id="oldpswd"  /></div>
<div class="cln"><label>新密码：</label><input type="password" id="newpswd" name="email" /></div>
<div class="cln"><label>确认密码：</label><input type="password" id="cnewpswd" /></div>
<div class="cln sub"><input class="submit" type="button" onclick="updPswd();" value="提交"></div>
</form>
</div>
</div>
</body>
</html>





















