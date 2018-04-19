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
    <link href="${ctxStaticMobile}/css/travel.css" rel="stylesheet" type="text/css"> 
    <link href="${ctxStaticMobile}/css/common.css" rel="stylesheet" type="text/css"> 
    <script src="${ctxStatic}/client/js/jquery-1.11.3.min.js" type="text/javascript"></script> 
</head>
<script>
var pageNo=1;
var pageSize=8;
var categoryId='${cone.id}';
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
            data=data.list;
            data.forEach(function( val, index ) {
            	if(index%2==0){
	    			 html=html+"<div class='travel_leftimg opacity'>"+
	    		  	  "<img src='"+val.image+"' style='width:100%'>"+
	    	       	  "<p style='margin-top:2vh'>"+val.title+"</p></div>";
	    		 }else{
	    			 html=html+"<div class='travel_rightimg opacity'>"+
	    		  	  "<img src='"+val.image+"' style='width:100%'>"+
	    	       	  "<p style='margin-top:2vh'>"+val.title+"</p></div>";
	    			html=html+"<div style='clear:both;height:4vh'></div>";
	    	     }
	    		 
             })
             if(data.lenght%2==0){
             html=html+"<div style='clear:both;height:4vh'></div>";
             }
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
	$.get('${ctxMobile}/categoryToggleJson.json',{'id':categoryId},function(data){
	      if(data.result=='success'){
	    	  if($("#des")){
	    	 $("#des").empty().html(data.category.description);
	    	  }
	      }
	})
	$(".more").text("加载更多");
	$('.list').empty();
	renderData();
}

</script>
<body>
<div class="wrap_box">
   <div class="nav_box">
     <a class="back_but" href="${ctxMobile}"><</a>
     <p class="nav_title">${category.name}</p>
   </div>
   <div class="title">
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
   <div id="child">
    <c:forEach items="${categoryListc}" var="c" varStatus="sta">
    <c:if test="${sta.index==0}">
      <input type="button" value="${c.name}" categoryId="${c.id}" class="comm_type2" onclick="toggleContent(this,'${c.id}')">
      </c:if>
      <c:if test="${sta.index!=0}">
      <input type="button" value="${c.name}" categoryId="${c.id}" class="comm_type" onclick="toggleContent(this,'${c.id}')">
      </c:if> 
   </c:forEach>
   </div>
   <div class="interval"></div>
   
   
   
   
   <c:if test="${cone.showModes!='3'}">
     	<div class="content drop">
     	<div class="list">

        </div>
        
        <div style="clear:both;height:4vh"></div>
        <div class="more" onclick="more()">加载更多</div>
       <div style="clear:both;height:4vh"></div>
   </div>
   </c:if>
   
   
   
   
   
   
   
   <c:if test="${cone.showModes=='3'}">
  	<div class="news_title_box">
       <h1 class="news_title">景点介绍</h1>
   </div>
   <div class="content">
     <p id="des" style="text-indent:2em">${cone.description}
     </p>
   </div>
   <div class="news_title_box">
       <h1 class="news_title">景点风貌</h1>
   </div>
   <div class="content drop">
   <div class="list">

      </div>
      <div style="clear:both;height:4vh"></div>
       <div class="more" onclick="more()">加载更多</div>
       <div style="clear:both;height:4vh"></div>
   </div>
 </c:if>  
   
   
   
   
   
</div>
</body>
</html>





















