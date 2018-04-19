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
    <link href="${ctxStaticMobile}/css/community.css" rel="stylesheet" type="text/css"> 
        <link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script> 
         <link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
          <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
     <style>
       .c-message{
      margin-left: -145px !important;
    }
       .more{
        position:relative;
        margin-top: 10px;
    }
    .nav_box{
       display:flex;
       justify-content:spance-around;
    }
    .operation{
        padding-left: 10px;
    }
    .cancel{
    padding: 2px;
    position: relative;
    top: 30%;
    background: #e63e0b;
    color: white;
    border-radius: 2px;
    }
    .comment{
      padding: 2px;
      position: relative;
      top: 30%;
      background: #70ca2c;
      color: white;
      border-radius: 2px;
    }
    .commentDiv{
    display:none;
    position: absolute;
    top: 45%;
    left: 15%;
    opacity: 1;
    background: #e0e0e0;
    padding: 15px 18px;
    border-radius: 3px;
    border: 1px solid #CDDC39;
       
    }
    .btn{
    padding: 2px;
    background: #117da7;
    color: #fff;
    border-radius: 2px;
    }
    .cln{
    display: flex;
    line-height: 50px;
    justify-content: space-between;
    align-items: center;
    }
    .cln1{
    line-height: 50px;
    justify-content: space-around;
    display: flex;
        margin-top: 20px;
    }
    #star span{
        font-size: 20px;
    margin-left: 15px;
    }
    .selected{
    color:red;
    }
    
     </style>
    <script>
    var status='全部';
	   var pageNo=1;
	   var pageSize=8;
	   function renderData(delay){
		     $.ajax({
		        type: 'GET',
		        url: '${ctxMobile}/userOrder.json',
		        dataType: 'json',
		        data:{'pageNo':pageNo,'pageSize':pageSize,'status':encodeURIComponent(status)},
		        success: function(data){
		            var html = '';
		            pageNo++;
		            data.forEach(function( val, index ) {
		            	var stutas=val.status;
		            	if(stutas=='0'){//增加取消按钮
		            		html=html+"	<div class='nav_box' style='margin-top: 0.16rem;height: 2.5rem;'>"+
			    			"<div style='float: left;'><img src='"+val.goods.imagesId+"' style='width: 2rem;margin-top: .2rem;'></div> "+
			    			"<div class='bus_order' >"+
			    				"<span style='font-size: 0.3rem;'><a href='${ctx}/mobile/userOrderDetail?id="+val.id+"'>"+val.goods.fullName+"</a></span>"+
			    				"<p>订单编号:"+val.code+"</p>"+
			    				"<p>下单时间:"+val.createDate+"</p>"+
			    				"<p>数量:"+val.numbers+"</p>"+
			    				"<p>订单状态:"+val.statusString+"</p>"+
			    			"</div>"+
			    				"<div class='operation'><input class='cancel' type='button' onclick='cancel(\""+val.id+"\")' value='取消'></div>"+
			    				"</div>";
		            	}else if(stutas=='3'){//增加评论按钮
		            		html=html+"	<div class='nav_box' style='margin-top: 0.16rem;height: 2.5rem;'>"+
			    			"<div style='float: left;'><img src='"+val.goods.imagesId+"' style='width: 2rem;margin-top: .2rem;'></div> "+
			    			"<div class='bus_order' >"+
			    				"<span style='font-size: 0.3rem;'><a href='${ctx}/mobile/userOrderDetail?id="+val.id+"'>"+val.goods.fullName+"</a></span>"+
			    				"<p>订单编号:"+val.code+"</p>"+
			    				"<p>下单时间:"+val.createDate+"</p>"+
			    				"<p>数量:"+val.numbers+"</p>"+
			    				"<p>订单状态:"+val.statusString+"</p>"+
			    			"</div>"+
			    				"<div class='operation'><input class='comment' onclick='comment(\""+val.id+"\")' type='button' value='评价'></div>"+
			    				"</div>";
		            	}else{
		            	html=html+"	<div class='nav_box' style='margin-top: 0.16rem;height: 2.5rem;'>"+
		    			"<div style='float: left;'><img src='"+val.goods.imagesId+"' style='width: 2rem;margin-top: .2rem;'></div> "+
		    			"<div class='bus_order' >"+
		    				"<span style='font-size: 0.3rem;'><a href='${ctx}/mobile/userOrderDetail?id="+val.id+"'>"+val.goods.fullName+"</a></span>"+
		    				"<p>订单编号:"+val.code+"</p>"+
		    				"<p>下单时间:"+val.createDate+"</p>"+
		    				"<p>数量:"+val.numbers+"</p>"+
		    				"<p>订单状态:"+val.statusString+"</p>"+
		    			"</div></div>";
		            	}
		            })
		            if(html==''){
		            	$(".more").text("已经是最后一页了");
		            }else{
		            	if(delay>0){
		            setTimeout(function(){
		            	$('.list').append(html);
		                // 每次数据加载完，必须重置
		            },delay);
		           }
		           else{
		        	   $('.list').append(html);
		          }
		         }
		            }
		     })
		 }
   $(function(){
	   $(".title div").click(function(){
		   status=$(this).children("p").text();
		   pageNo=1;
		   $(this).removeClass("community2").addClass("community");
		   $(this).siblings().removeClass("community").addClass("community2");
		   $('.list').empty();
		   $(".more").text("加载更多");
		   renderData();
	   })
	   
   })
   
  renderData();
function more(){
	renderData(1000);
}
function cancel(id){
	top.$.jBox.confirm("确认删除该订单吗!","等待确认",function(v,h,f){
		if(v=="ok"){
			$.ajax({
		        type: 'GET',
		        url: '${ctxMobile}/orderDelete.json',
		        dataType: 'json',
		        data:{'id':id},
		        success: function(data){
		        	if(data.msg=='true'){
		        		pageNo=1;
		        		$('.list').empty();
		        		renderData(0);
		        	}else if(data.msg=='nologin'){
		        		alert("请先登录");
		        	}else{
		        		alert("服务器未响应");
		        	}
		        }
		 });
		}
	},{buttonsFocus:1});
	top.$('.jbox-body .jbox-icon').css('top','55px');
}
function clear(){
	$(".commentDiv").hide();
	$("#comment").val("");
	var spans=$("#star span");
	for(var i=0;i<spans.length;i++){
		$(spans[i]).removeClass("selected");
	}
}
function comment(id){
	$(".commentDiv").show();
	$("#remove").click(function(){
		clear();
	})
	$("#commit").click(function(){
		var comment=$("#comment").val();
		var spans=$(".selected");
		var num;
		if(spans=='undefined'){
			num=0;
		}else
			{
			num=spans.length;
			}
		if(comment==''||comment=='undefined'){
			$.message({
		        message:'请填写评论内容',
		        type:'error',
		        time:'1500'
		    });
		}else{
		  $.ajax({
				type:"post",
				async:false,
				url:"${ctxMobile}/resOrderUpdComSt.do",
				data:{"stars":num,'oid':id,"remarks":comment},
			    cache:false,
				success: function(data){
					if(data && data.result){
						$.message({
		                     message:'评论成功',
		                     type:'success',
		                     time:'1500',
		                     onClose:function(){
		                    	 clear();
	        			        }
		                 });
					}else{
						$.message({
		                     message:data.msg,
		                     type:'error',
		                     time:'1500',
		                     onClose:function(){
		                    	 clear();
	        			        }
		                 });
					}
				}
			});
		}
	})
}
$(function(){
	$("#star span").click(function(e){
		var spans=$("#star span");
		var index=jQuery.inArray(e.target,spans);
		for(var i=0;i<=index;i++){
			$(spans[i]).addClass("selected");
		}
		for(var i=index+1;i<spans.length;i++){
			$(spans[i]).removeClass("selected");
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
		<p><a class="back" href="${ctxMobile}/userMenu"><span> <  预订商家</span></a></p>
		<p><img src="${mobileuser.imagesId }"></p>
		<p style="text-align: center; color: #FFFFFF; margin-top: 20px;">欢迎你，<span style="border-bottom: 1px solid #FFFFFF;">${mobileuser.name }</span></p>
	</div>
	
	<div class="title" style="height: auto;">
       <div class="community" style="height: 6vh;">
           <p style="font-size: 1em;line-height: 6vh;">全部</p>
       </div>
       <div class="community2" style="height: 6vh;">
           <p style="font-size: 1em;line-height: 6vh;">预定中</p>
       </div>
       <div class="community2" style="height: 6vh;">
           <p style="font-size: 1em;line-height: 6vh;">已收货</p>
       </div>
       <div class="community2" style="height: 6vh;">
           <p style="font-size: 1em;line-height: 6vh;">已取消</p>
       </div>
       
   </div>
	   <div class="list">
 
</div>
<div class="more" onclick="more()">加载更多</div>
	
    
</div>
<div class="commentDiv">
<div class="cln"><label>星级：</label><div id="star"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div></div>
<div class="cln"><label>评价：</label><textarea rows="4" cols="15" id="comment"></textarea></div>
<div class="cln1"><input class="btn" type="button" id="commit" value="提交"><input class="btn" type="button" id="remove" value="取消"></div>
</div>
</body>
</html>