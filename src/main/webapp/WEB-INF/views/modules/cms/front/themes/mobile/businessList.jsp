<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>周边商户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/mark.css" rel="stylesheet" type="text/css">  
     <script src="${ctxStaticItv}/js/iscroll.js" type="text/javascript"></script> 
    <script src="${ctxStaticItv}/js/demoUtils.js" type="text/javascript"></script> 
     <link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
    <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
    <script src="${ctxStatic}/client/js/message.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/client/css/message.css"/>
     <style>
      .c-message{
      margin-left: -145px !important;
    }
    .more{
        margin-top: 10px;
        position:relative;
    }
#wrapper {
	position: relative;
	z-index: 1;
	    height: 10vh;
	background: #ccc;
	overflow: hidden;
	-ms-touch-action: none;
}
.color_r {
    color: #666;
}
.color_b {
    color:#EC3B3B;
}
#scroller {
display:flex;
	position: absolute;
	z-index: 1;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
	-o-text-size-adjust: none;
	text-size-adjust: none;
}
.detail{
       color: #6E7D8B;
    text-decoration: none;
        color: #333333;
}
</style>
    <script type="text/javascript">

var myScroll;
$(function(){
	myScroll = new IScroll('#wrapper', { eventPassthrough: true, scrollX: true, scrollY: false, preventDefault: false });
	var index=parseFloat(${index}+1);
	if(index>=4){
		var select="#scroller div:nth-child("+index+")";
	myScroll.scrollToElement(document.querySelector(select), 1200, null, null, null);
    }
})
var pageNo=1;
var pageSize=8;
var typeId='${current.id}';
function render(delay){
	$.ajax({
        type: 'GET',
        url: '${ctxMobile}/businessList.json',
        dataType: 'json',
        data:{'typeId':typeId,'pageNo':pageNo,'pageSize':pageSize},
        success: function(data){
        	if(data){
        		var html="";
        		 pageNo++;
        		if(data.length==0){
        			$(".more").text("已经是最后一页了");	
        		}else{
        		  data.forEach(function( val, index ) {
        			  var text="";
        			  for(i=1;i<=5;i++){
        				  if(i<=val.star){
        					 text=text+"<span class='color_b'>&#9733;</span>"; 
        				  }else{
        					  text=text+"<span class='color_r'>&#9733;</span>";
        				  }
        			  }
        			  html=html+"<a class='detail' href='${ctxMobile}/businessDetail?id="+val.id+"'> <div class='commercial'>"+
        			    "<img src='"+val.logoId +"' class='markimg'>"+
        			   " <div class='right_info'>  <p style='font-size:1.2em'>"+val.shortName+"<span style='float:right'><input onclick='collect(\""+val.id+"\")' type='button' class='save' value='收藏'></span></p>"+
        			    "   <p>电话："+val.phone +"</p>  <p>地址："+val.address+"</p>"+
        			      " <p style='color:#ec3b3b'>"+text+" <span class='readDiv'> <img src='${ctxStaticMobile}/images/yulan1.png' class='read1'> "+
        			           "<span class='read2'>"+val.viewCount +"</span>  <img src='${ctxStaticMobile}/images/yulan2.png' class='read3'> "+
        			            "<span class='read4'>"+val.commentNum+"</span></span></p> </div> </div></a> <div style='height:1vh'></div>";
        		  })
        		  $('.list').append(html);
        		  }
        	}
         }
	})
}
render();
function more(){
	render();
}
function toggleContent(tagert,typeId){
    pageNo=1;
	window.typeId=typeId;
	$(tagert).removeClass("community2").addClass("community");
	$(tagert).siblings().removeClass("community").addClass("community2");
	$(".more").text("加载更多");
	$('.list').empty();
	render();
}
function collect(bid){
	event.stopPropagation();
	event.preventDefault(); 
	var url="${ctxMobile}"+'/collect-'+bid+".json";
	$.get(url,function(data){
		if(data.msg=='nologin'){
			$.message({
		        message:'请先使用居民账户登录后再收藏该商户',
		        type:'warning',
		        time:'1000'
		    });
		}
		else if(data.msg=='true'){
				$.message({
			        message:'收藏成功',
			        type:'success',
			        time:'1000'
			    });
			}else{
				$.message({
			        message:'你已经收藏了该商家',
			        type:'error',
			        time:'1000'
			    });
			}
	})
}
</script>
</head>
<body>
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but" href="${ctxMobile}/discover"><</a>
     <p class="nav_title">周边商户</p>
   </div>
   <div id="wrapper">
   <div id="scroller" style=height:10vh; background:#E8E8E8">

   <c:forEach items="${typeList}" var="t" varStatus="sta"> 
   <c:if test="${t.id==current.id}" > 
       <div class="community" onclick="toggleContent(this,'${t.id}')">
           <p>${t.name }</p>
       </div>
       </c:if>
        <c:if test="${t.id!=current.id}" > 
           <div class="community2" onclick="toggleContent(this,'${t.id}')"> 
           <p>${t.name }</p>
       </div>
        </c:if>
       </c:forEach>
  
   </div>
   </div>
   <div class="list">
 
</div>
<div class="more" onclick="more()">加载更多</div>


 

</body>
</html>





















