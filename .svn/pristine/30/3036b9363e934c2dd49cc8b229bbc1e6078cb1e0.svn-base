<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>${category.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" /><!--只是或者请求的消息不能缓存-->
    <meta name="viewport" content="width=device-width" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /><!--强制让文档与设备的宽度保持 1:1 ；
    文档最大的宽度比列是1.0（ initial-scale 初始刻度值和 maximum-scale 最大刻度值）；user-scalable 定义用户是否可以手动缩放（ no 为不缩放），使页面固定设备上面的大小；-->
    <meta name="apple-mobile-web-app-capable" content="yes" /><!--网站开启对 web app 程序的支持-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" /><!--（改变顶部状态条的颜色）-->
    <link href="${ctxStaticMobile}/css/Community_affairs.css" rel="stylesheet" type="text/css">  
<link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
     <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
     <link href="${ctxStaticMobile}/css/street.css" rel="stylesheet" type="text/css"> 
    <script src="${ctxStaticItv}/js/demoUtils.js" type="text/javascript"></script> 
        <link href="${ctxStaticMobile}/css/comm.css" rel="stylesheet" type="text/css">
    <link href="${ctxStaticMobile}/css/Community_affairs.css" rel="stylesheet" type="text/css">
    <style>
    .more{
        position:relative;
        margin-top: 10px;
    }
   </style>
 <script type="text/javascript">


 var pageNo=1;
 var pageSize=8;
 var categoryId='${category.id}';
 function renderData(delay){
      $.ajax({
         type: 'GET',
         url: '${ctxMobile}/articleMoreJson.json',
         dataType: 'json',
         data:{'categoryId':categoryId,'pageNo':pageNo,'pageSize':pageSize},
         success: function(data){
         	if(data.result=='success'){
             var html = '';
             pageNo++;
             var type=data.category.module;
             var allowComment=data.category.allowComment;
             var name=data.category.name;
             data=data.list;
             
             data.forEach(function( val, index ) {
             	var date=val.createDate;
             	var title=val.title;
             	if(title.length>35){
             		title=title.substring(0,35)+"...";
             	}
             	html=html+" <a href='${ctxMobile}/articleView?id="+val.id+"' >"+
             	"<li class='show_box' ><img src='"+val.image+"'/>"+
             	"<div class='cgal_list_text'>"+
                 "<p>"+title+"</p>"+
                 "<div style='color:#999'>发布人："+val.user.name+
                 "<br/>发布时间："+date+"</div></div></li></a>";
              })
             if(html==''){
             	$(".more").text("已经是最后一页了");
             }else{
             	if(delay>0){
             setTimeout(function(){
             	$('.cgal_list').append(html);
                 // 每次数据加载完，必须重置
             },delay);
            }
            else{
         	   $('.cgal_list').append(html);
           }
          }
             
        }
         },
     })//ajax end
 }
 renderData();
 function more(){
 	renderData(1000);
 }


 function toggleContent(tagert,categoryId){
     pageNo=1;
 	$(".more").text("加载更多");
 	$('.cgal_list').empty();
 	renderData();
 }


</script>
</head>
<body>
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but" href="${ctxMobile}"><</a>
     <p class="nav_title">${category.name}</p>
   </div>
  <!---内容开始-->
<ul class="cgal_list">


</ul>
 <div class="more" onclick="more()">加载更多</div>
</div>
</body>
</html>





















