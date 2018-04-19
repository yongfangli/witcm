<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/businessDetail.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStaticTheme}/css/commentReview.css"/>
	<link href="${ctxStaticTheme}/css/cpaging.css" type="text/css" rel="stylesheet" />
	
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	
	<script src="${ctxStaticTheme}/js/paging.min.js" type="text/javascript"></script>
	<style>
	.hid{
	  display:none;
	}
	.cgcolor{
	      background: #ec3b3b;

	}
	.grade span{
	font-size:15px;
	}
	.orderi{
		width: 330px;
		height: 30px;
		margin-left: 20px;
	}
	.orderi input[type="text"]{
		border-radius: 4px;
		background-color: #fff;
		border: 1px solid #ccc;
		width:200px;
		height: 22px;
	}
	.orderi input[readonly]{
		background-color: #f3f3f3;
	}
	</style>
	<script>

	$(function(){
		var _divs=$(".review_div");
		if(window.tagFlag=='0'){
			_divs.eq(0).removeClass("hid");
			_divs.eq(1).addClass("hid");
		}else{
			_divs.eq(1).removeClass("hid");
			_divs.eq(0).addClass("hid");
		}
		$(".communt").click(function(){
			$(".communt").addClass("cgcolor");
			$(".tiesre").removeClass("cgcolor");
			_divs.eq(0).removeClass("hid");
			_divs.eq(1).addClass("hid");
			window.tagFlag='0';
		});
		$(".tiesre").click(function(){
			$(".tiesre").addClass("cgcolor");
			$(".communt").removeClass("cgcolor");
			_divs.eq(1).removeClass("hid");
			_divs.eq(0).addClass("hid");
			window.tagFlag='1';
		});
	});
	
	//预订
	function orders(gname,gprice,gid){
		gprice = "￥"+gprice;
		var orderHtml = "<div class='orderi' style='margin-top:10px;'>商品名称：<input type='text' id='gname' name='gname' readonly='readonly' value='"+gname+"'></div>";
			orderHtml += "<div class='orderi'>商品价格：<input type='text' id='gprice' name='gprice' readonly='readonly' value='"+gprice+"'></div>";
			orderHtml += "<div class='orderi'>预订数量：<input type='text' id='gnumber' name='gnumber' value='1' maxlength='6'></div>";
		var orderSubmit = function(v,h,f){
		   if(v==1){
			   return true;
		   }else if(v==0){
			   var gnum = f.gnumber;
			   if(gnum==null || gnum==""){
				   $.message({
				        message:'请输入预订数量',
				        type:'warning',
				        time:'1000'
				    });
				   return false;
			   }
			   
			   if(!/^[1-9][0-9]*$/.test(gnum)){
				   $.message({
				        message:'请输入非0开头的整数',
				        type:'warning',
				        time:'1500'
				    });
				   return false;
			   }
			   
			   $.ajax({
					type:"post",
					async:false,
					url:"${ctx}/res/resOrderSave.do?gnum="+gnum+"&gid="+gid,
					cache:false,
					success: function(data){
						if(data && data.result){
							$.message({
						        message:'预订成功，请到个人中心查看详情。',
						        type:'success',
						        time:'1500'
						    });
							return true;
						}else{
							$.message({
						        message:'请使用居民账户登录后再预定商品',
						        type:'error',
						        time:'1500'
						    });
							return false;
						}
					}
				});
		   }
	   };
		$.jBox(orderHtml, {title:"商品预订",submit:orderSubmit, buttons:{"确认":0,"关闭":1}});
	}
	
	</script>
</head>
<body>
	<div class="cur_locat">
		<a href="${ctx}">首页</a>&gt;&gt;<a href="${ctx}/business-list1-6${fns:getUrlSuffix()}">周边商家</a>&gt;&gt;<a href="javasctipt:void(0)">商家详情</a>
	</div>
   <div id="dvContent">
    <div class="shapping">
        <div class="market_logo">
   	 		 <img src="${business.logoId}" class="logo"/>
             <input type="button" class="collect" onclick="collect('${business.id}')" value="收藏"/>
             <div style="height:10px;"></div>
       		 <img src="${ctxStaticTheme}/images/liulan.jpg" class="browse"/>
             <p class="market_con">${business.viewCount}</p>
             <img src="${ctxStaticTheme}/images/weixin.jpg" class="browse"/>
             <p class="market_con">${business.commentNum}</p>
       </div>
      <div class="mar_jiao">
        <p class="chaoshiming"><span>${business.fullName}</span>
        <span style="color:#ec3b3b"> 
        <c:forEach begin="1" end="5" step="1" var="num">
							
							<c:if test="${num gt business.star}">
							<span class="color_b">&#9733;</span>
							</c:if>
							<c:if test="${num le business.star}">
							<span class="color_r">&#9733;</span>
							</c:if>
							</c:forEach>
		</span>
        </p>
        <p class="mar_tem">电话：${business.phone}</p>
        <p class="add_mar">地址：${business.address}</p>
      
      </div>
     
     </div>
      
   </div>
   <div style="padding: 0px 350px;"><p class="mar_con">${business.describes}</p></div>
   <div class="review">
     <c:if test="${tagFlag=='0'}">
     	<input type="button" value="商品" class="communt cgcolor">
     	<input type="button" value="评论" class="tiesre">
     </c:if>
     <c:if test="${tagFlag=='1'}">
     	<input type="button" value="商品" class="communt">
     	<input type="button" value="评论" class="tiesre cgcolor">
     </c:if>
     <div class="review_div">
         <!--商品循环结束--> 
         <!--商品循环-->
         <c:forEach items="${goodsPage.list}" var="bz"  varStatus="status">
         	<div class="goods">
         		<img src="${bz.imagesId}"/>
         		<p class="goods_money">￥${bz.price }</p>
         		<p class="com_variety">${bz.fullName}</p>
         		<input type="button" class="goods_book" value="预订" onclick="orders('${bz.fullName}','${bz.price}','${bz.id}')"/>
         	</div>
         </c:forEach>
         <!--商品循环结束--> 
         <!--商品循环-->
		 <div class="pagination">
			 <div class="box business" id="box"></div>
		 </div>

	<script type="text/javascript">
	window.tagFlag='${tagFlag}';
	var commentPageNo=${page.pageNo};
	var talpage=${goodsPage.last};
	var nowpage=${goodsPage.pageNo};
     $('.business').paging({
    	    initPageNo: ${goodsPage.pageNo}, // 初始页码
    	    totalPages: ${goodsPage.last}, //总页数
    	    totalCount:'共：'+ ${goodsPage.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
   //如果只有一页
     if(nowpage==talpage){
    	 $("#firstPage").attr("disabled", true); 
    	 $("#lastPage").attr("disabled", true); 
		}
    	$("#pageSelect li").click(function(){
    		if(window.tagFlag=='0'){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/business-detail-${business.id}"+"-"+pageNo+"-"+commentPageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
    		 window.location.href=url;
    		}
    	});
    	$("#nextPage").click(function(){
    		if(window.tagFlag=='0'){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+pageNo+"-"+commentPageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    		}
    	})
    	$("#prePage").click(function(){
    		if(window.tagFlag=='0'){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+pageNo+"-"+commentPageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    		}
    	})
    	$("#firstPage").click(function(){
    		if(window.tagFlag=='0'){
    			var pageNo=1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+pageNo+"-"+commentPageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    	})
    	$("#lastPage").click(function(){
    		if(window.tagFlag=='0'){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+pageNo+"-"+commentPageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    	})
	
    	
     </script> 
          </div>
         <!--商品循环结束--> 
         <!--评论框开始：循坏-->
         <div class="review_div hid">
         <c:forEach items="${page.list}" var="comment"  varStatus="status">
          <div class="commu_img">
              <img src="${comment.resident.imagesId}" class="commu_img_logo"/>
              <div class="right_con">
               <span class="grade">
                       <c:forEach begin="1" end="5" step="1" var="num">
							
							<c:if test="${num gt comment.stars}">
							<span class="color_b">&#9733;</span>
							</c:if>
							<c:if test="${num le comment.stars}">
							<span class="color_r">&#9733;</span>
							</c:if>
							</c:forEach>
               </span>
               <span class="com_name">
               ${comment.resident.name}&nbsp;｜&nbsp;<fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp;${comments.belongOrg.name}</span>
               <div class="con_text">${comment.contents}</div>
               <div style="height:15px"></div>
              </div>
          </div>
          </c:forEach>
            <div class="c-box comment" id="c-box"></div>
	<script src="${ctxStaticTheme}/js/cpaging.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	var bpage=${goodsPage.pageNo};
	var talpage=${page.last};
	var nowpage=${page.pageNo};
     $('.comment').cPaging({
    	    initPageNo: ${page.pageNo}, // 初始页码
    	    totalPages: ${page.last}, //总页数
    	    totalCount:'共：'+ ${page.count}+'条数据', // 条目总数
    	    slideSpeed: 600, // 缓动速度。单位毫秒 
    	    callback: function(page){
    	    	
    	    }
    	});
   //如果只有一页
     if(nowpage==talpage){
    	 $("#c-firstPage").attr("disabled", true); 
    	 $("#c-lastPage").attr("disabled", true); 
		}
    	$("#c-pageSelect li").click(function(){
    		if(window.tagFlag=='1'){
    		var pageNo=this.innerText;
    		 var url='${ctx}'+"/business-detail-${business.id}"+"-"+bpage+"-"+pageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
    		 window.location.href=url;
    		}
    	});
    	$("#c-nextPage").click(function(){
    		if(window.tagFlag=='1'){
    		if(nowpage==talpage){
    			return;
    		}
    		else{
    			var pageNo=nowpage+1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+bpage+"-"+pageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    		}
    	});
    	$("#c-prePage").click(function(){
    		if(window.tagFlag=='1'){
    		if(nowpage==1){
    			return;
    		}
    		else{
    			var pageNo=nowpage-1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+bpage+"-"+pageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    		}
    	});
    	$("#c-firstPage").click(function(){
    		if(window.tagFlag=='1'){
    			var pageNo=1;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+bpage+"-"+pageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    	});
    	$("#c-lastPage").click(function(){
    		if(window.tagFlag=='1'){
    			var pageNo=talpage;
    			 var url='${ctx}'+"/business-detail-${business.id}"+"-"+bpage+"-"+pageNo+'${fns:getUrlSuffix()}'+"?tagFlag="+window.tagFlag;
        		 window.location.href=url;
    		}
    	});
	
    	
     </script> 
          </div>
         <!--评论框结束-->
      </div>
 <div id="orderBox" style="display: none;">
	<form id="orderForm" method="post" style="text-align:center;height: 130px;"><br/>
		<div class="orderi">商品名称：<input type="text" id="gname" readonly="readonly"></div>
		<div class="orderi">商品价格：<input type="text" id="gprice" readonly="readonly"></div>
		<div class="orderi">预订数量：<input type="text" id="gnumber"></div>
	</form>
</div>  
</body>
</html>