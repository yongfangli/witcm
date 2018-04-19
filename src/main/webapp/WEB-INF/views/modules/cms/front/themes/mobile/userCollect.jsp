<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>


<html>
<head>
    <title>便民服务</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/mark.css" rel="stylesheet" type="text/css">  
      <link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
   <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script> 
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<style>
div.jbox .jbox-container {
    background-color: #fff;
    border: 1px solid #FF9800;
}
.list{
  display:flex;
  display: -webkit-flex; 
  flex-wrap:  wrap ;
}
  .more{
        margin-top: 10px;
        position:relative;
    }
.collect{

     background: beige;
    width: 40%;
    margin: 15px;
    border-top: 3px dashed #2a8e09;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
}
.collect div{
    display:flex;
    align-items:center;
    justify-content: center;
}
.delete{
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
img{
    width: 30vw;
}
</style>
<script>
var pageNo=1;
var pageSize=8;
function renderData(delay,isDelete){
     $.ajax({
        type: 'GET',
        url: '${ctxMobile}/userCollect.json',
        dataType: 'json',
        data:{'pageNo':pageNo,'pageSize':pageSize},
        success: function(data){
            var html = '';
            pageNo++;
            data.forEach(function( val, index ) {
            	html=html+"<div class='collect'><span class='delete' onclick='remove(\""+val.id+"\")'>&times;</span> <a href='${ctxMobile}/businessDetail?id="+val.business.id+"'><div class='top'><span>"+val.business.fullName+"</span></div><div class='next'><img src='"+val.business.logoId+"'/></div></a></div>";
            })
            if(html==''){
            	if(isDelete){
            	pageNo=pageNo-2;
            	renderData(0,false);
            	}else{
            		$(".more").text("已经是最后一页了");
            	}
            } 
            else{
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
renderData(0,false);
function more(){
	renderData(1000,false);
}
function remove(id){
	top.$.jBox.confirm("确认删除该收藏吗!","等待确认",function(v,h,f){
		if(v=="ok"){
			$.ajax({
		        type: 'GET',
		        url: '${ctxMobile}/collectDelete.json',
		        dataType: 'json',
		        data:{'id':id},
		        success: function(data){
		        	if(data.msg=='true'){
		        		pageNo=pageNo-1;
		        		$('.list').empty();
		        		renderData(0,true);
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
</script>
</head>
<body>
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but" href="${ctxMobile}/userMenu"><</a>
     <p class="nav_title">我的收藏</p>
   </div>
   <div class="list">
  
   </div>
<div class="more" onclick="more()">加载更多</div>
</div>

 

</body>
</html>