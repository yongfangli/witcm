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
    <script src="${ctxStaticItv}/js/iscroll.js" type="text/javascript"></script> 
     <link href="${ctxStaticMobile}/css/street.css" rel="stylesheet" type="text/css"> 
    <script src="${ctxStaticItv}/js/demoUtils.js" type="text/javascript"></script> 
        <link href="${ctxStaticMobile}/css/comm.css" rel="stylesheet" type="text/css">
    <link href="${ctxStaticMobile}/css/Community_affairs.css" rel="stylesheet" type="text/css">
    <style>
    .more{
        position:relative;
        margin-top: 10px;
    }
#wrapper {
	position: relative;
	z-index: 1;
	 height: 10vh;
    background: rgb(232, 232, 232)
	overflow: hidden;
	-ms-touch-action: none;
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
</style>
 <script type="text/javascript">

 var myScroll;
 $(function(){
 	myScroll = new IScroll('#wrapper', { eventPassthrough: true, scrollX: true, scrollY: false, preventDefault: false });
 	var index=parseFloat(${index}+1);
 	if(index>=3){
 		var select="#scroller div:nth-child("+index+")";
 	myScroll.scrollToElement(document.querySelector(select), 1200, null, null, null);
     }
 })

 var pageNo=1;
 var pageSize=8;
 var categoryId='${curId}';
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
             
            if(type=='special'){
             	$(".more").hide();
             }else{
             	$(".more").show();
             }
             
             data.forEach(function( val, index ) {
             	var date=val.createDate;
             	var title=val.title;
             	if(title.length>35){
             		title=title.substring(0,35)+"...";
             	}
             	if(type=='article'||type=='news'){
             		if(allowComment=='1'){
             			html=html+" <a href='${ctxMobile}/articleView?id="+val.id+"' >"+
             			"<div class='interval'></div><div class='username'>"+
             	   		"<img src='"+val.image+"' class='userlogo'><div class='right_con'>"+
             	       	  "<div style='height:2vh'></div>  <p style='font-size: 1.2em;height: 10vh;overflow: hidden;'>"+title+"</p>"+
             	         "<p class='comm'>"+val.user.name+" ｜ "+date+"｜"+name+" </p>"+
             	         " <p class='comm'><img src='${ctxStaticMobile}/images/yulan1.png' class='read1'> <span class='number'>"+val.hits+"</span>"+
             	          "  <img src='${ctxStaticMobile}/images/yulan2.png' class='read2'> <span class='number'>"+val.comments+"</span> </p> </div>"+
             	       " <div style='clear:both'></div></div></a>";
             		}else{
             	html=html+" <a href='${ctxMobile}/articleView?id="+val.id+"' >"+
             	"<li class='show_box' ><img src='"+val.image+"'/>"+
             	"<div class='cgal_list_text'>"+
                 "<p>"+title+"</p>"+
                 "<div style='color:#999'>发布人："+val.user.name+
                 "<br/>发布时间："+date+"</div></div></li></a>";
             		}
             		}else if(type=='special'){
             		html=html+"<div class='news_title_box'>"+
             	       "<h1 class='news_title'>"+val.title+"</h1></div>"+
             	       "<div style='width:90%;margin:0px auto'>"+
             	       "<p style='text-indent:2em'>"+val.articleData.content+"<img src='"+val.image+"' style='width:100%'></p></div>";
             	}
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
 	window.categoryId=categoryId;
 	$(tagert).removeClass("comm_type").addClass("comm_type2");
 	$(tagert).siblings().removeClass("comm_type2").addClass("comm_type");
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
    <div id="wrapper">
   <div id="scroller" style="height: 10vh; background:#E8E8E8">
    <c:forEach items="${categoryList}" var="c" varStatus="sta">
   <c:if test="${curId==c.id}">
       <div class="community">
           <a style="color:#333333" href="${ctxMobile}/categoryToggle?id=${c.id}"><p>${c.name }</p></a>
       </div>
       </c:if>
      <c:if test="${curId!=c.id}"> 
       <div class="community2">
           <a style="color:#333333" href="${ctxMobile}/categoryToggle?id=${c.id}"> <p>${c.name }</p></a>
       </div>
       </c:if>
       </c:forEach>
   </div>
   </div>
  <!---内容开始-->
<ul class="cgal_list">


</ul>
 <div class="more" onclick="more()">加载更多</div>
</div>
</body>
</html>





















