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
    <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
    <style>
      .more{
        margin-top: 10px;
        position:relative;
    }
    .items{
    display:flex;
            padding: 5px;
    background: #efe8bd;
    width: 90%;
    margin: 0 auto;
    border-radius: 10px;
        margin-top: 5px;
          box-shadow: 10px 10px 5px #888888;
        }
        .emhance a{
         color: #de4343;
    font-size: 20px;
        }
        .titles a{
            font-style: italic;
            color: green;
           
        }
        .titles{
         padding-top:10px;
        }
        .lef{
            padding-left: 10px;
            width: 40%;
        }
        .rig{
            padding: 5px;
            width:60%;
        }
        .date{
            display:block;
            padding-left: 21px;
        }
       
</style>
  <script>
var pageNo=1;
var pageSize=8;
function renderData(delay){
     $.ajax({
        type: 'GET',
        url: '${ctxMobile}/promotionList.json',
        dataType: 'json',
        data:{'pageNo':pageNo,'pageSize':pageSize},
        success: function(data){
            var html = '';
            pageNo++;
            data.forEach(function( val, index ) {
            	html=html+"  <div class='items'>"+
            	   "<div class='lef'><span class='emhance'><a href='${ctxMobile}/businessDetail?id="+val.business.id+"'>"+val.business.fullName+"</a></span>"+
            	   "<span class='date'>"+val.relativeTime+"</span></div>"+
            	  "<div class='rig'><span class='titles'><a href='${ctxMobile}/promotionDetail?id="+val.id+"'>"+val.titles+"</a></span></div>"+
            	  "</div>";
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
renderData();
function more(){
	renderData(1000);
}
</script>
</head>
<body>
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but" href="${ctxMobile}/discover"><</a>
     <p class="nav_title">促销信息</p>
   </div>
   <div class="list">
 
   </div>
<div class="more" onclick="more()">加载更多</div>
</div>

 

</body>
</html>





















