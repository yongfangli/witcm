<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	 <link rel="stylesheet" href="${ctxStaticTheme}/css/index.css" />
	<script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
</head>
<body>
 
		<div class="cur_locat">
			<a href="${ctx}">首页</a>&gt;&gt;<a href="javasctipt:void(0)">便民服务</a>
		</div>
		
		<div class="middle_content" >
		 <c:forEach items="${page.list}" var="cv" varStatus='status' >
         <c:if test="${status.index%2==0}">
        <div class="Giv_div">
     <!--左边联系人-->
             <div class="Giv_div_img">
                   <div class="Giv_div_imgs">
                     <img src="${ctxStaticTheme}/images/phone.png" class="Giv_img">
                   </div>
                   <div class="Giv_kongge"></div>
                   <p style="font-size:20px">${cv.name}</p>
               <p>电话：${cv.phone}</p>
               <p>地址：${cv.address}</p>
              </div>
         <!--右边联系人-->  
           <c:if test="${page.list[status.index+1]!=null}"> 
               <div class="Giv_right">
               		<div class="Giv_div_img">
                   <div class="Giv_div_imgs">
                     <img src="${ctxStaticTheme}/images/phone.png" class="Giv_img">
                   </div>
                   <div class="Giv_kongge"></div>
                   <p style="font-size:20px">${page.list[status.index+1].name}</p>
               <p>电话：${page.list[status.index+1].phone}</p>
               <p>地址：${page.list[status.index+1].address}</p>
               </div>
            </div>
             
            </c:if>
            </div>
             
         </c:if>
         <div style="height:20px"></div>
        </c:forEach>
            
           <div style="height:25px"></div>  
       <div class="box" id="box"></div>
	
	<script type="text/javascript">
	
	var talpage=${page.last};
	var nowpage=${page.pageNo};
     $('#box').paging({
    	    initPageNo: ${page.pageNo}, // 初始页码
    	    totalPages: ${page.last}, //总页数
    	    totalCount:'共：'+ ${page.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
    	$("#pageSelect li").click(function(){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/convenient-list"+pageNo+"-8"+'${fns:getUrlSuffix()}';
    		 window.location.href=url;
    	});
    	$("#nextPage").click(function(){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/convenient-list"+pageNo+"-8"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#prePage").click(function(){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/convenient-list"+pageNo+"-8"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    		}
    	})
    	$("#firstPage").click(function(){
    			var pageNo=1;
    			 var url='${ctx}'+"/convenient-list"+pageNo+"-8"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	$("#lastPage").click(function(){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/convenient-list"+pageNo+"-8"+'${fns:getUrlSuffix()}';
        		 window.location.href=url;
    	})
    	
     </script> 
 
        </div> 
		<!--中间结束-->
    
          
</body>
</html>