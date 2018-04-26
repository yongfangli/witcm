<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区商超</title>
 	<link rel="stylesheet" href="${ctxStaticItv}/css/businessDetail.css" />
 	 <link rel="stylesheet" href="${ctxStaticItv}/css/common.css" />
 	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
  	<link href="${ctxStaticTheme}/css/message.css" type="text/css" rel="stylesheet" />
  	<script src="${ctxStaticTheme}/js/message.js" type="text/javascript"></script>
  	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
	<style>
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
 /* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
 function placeholderPic(){
  var w = document.documentElement.offsetWidth;
  document.documentElement.style.fontSize=w/100+'px';
 }
 placeholderPic();
 window.onresize=function(){
  placeholderPic();
 };
 $(function(){
	$(".left_pAct").focus();
 });
 
 function collect(bid){
		var url="${ctx}"+'/itv/collect-'+bid+".json";
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
		});
	}
 var flag='${flag}';
 function supermarket(obj){
	 if(obj==1){
		$(".content").show();
		$(".goodsDiv").hide();
		$(".comment").hide();
		$("#seller").attr("class", "seller");
		$("#goods").attr("class", "goods");
		$("#comment").attr("class", "goods");
		$(".last_page").hide();
		flag='0';
	}else if(obj==2){
		$(".content").hide();
		$(".goodsDiv").show();
		$(".comment").hide();
		$("#seller").attr("class", "goods");
		$("#goods").attr("class", "seller");
		$("#comment").attr("class", "goods");
		$(".last_page").show();
		flag='1';
	}else{
		$(".content").hide();
		$(".goodsDiv").hide();
		$(".comment").show();
		$("#seller").attr("class", "goods");
		$("#goods").attr("class", "goods");
		$("#comment").attr("class", "seller");
		$(".last_page").show();
		flag='2';
		}
	
 }
 function prev(obj){
		obj=obj+"&flag="+flag;
		window.location.href=obj;
	}
 
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
					url:"${ctx}/itv/userOrderSave.do?gnum="+gnum+"&gid="+gid,
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
    <script>
        $(function(){
            var winH = $(window).height();
            var winW = $(window).width();
            $(".bigdiv").height(winH);
            $(".list_left").height(winH);
            $(".title").css({
                "height":winH*0.09+"px",
                "lineHeight":winH*0.09 + "px",
                "marginTop":winH*0.04+"px"
            });
            $(".left_p").css({
                "height":winH*0.06+"px",
                "lineHeight":winH*0.06 + "px"
            });
            $(".left_user").css({
                "width":(winW*0.8-2)+"px"
            });
            $(".left_content").css({
                "height":winH*0.88+"px",
                "marginBottom":winH*0.04+"px",
                "marginTop":winH*0.04+"px",
                "paddingTop":winH*0.04+"px"
            });
            $(".markDiv>p").css({"marginBottom":winH*0.02+"px"});
            $(".read").height(winH*0.02);
            $(".seller,.goods").height(winH*0.06);
            $(".content").height(winH*0.53);
            $(".content").css("paddingTop",winH*0.02+"px");
            $(".goodsDiv").css({
                "height":winH*0.68+"px",
                "paddingTop":winH*0.02+"px"
            });
            $(".goodsDivs").css({
                "width":winW*0.2+"px",
                "height":winH*0.55+"px",
                "marginLeft":winH*0.025+"px"
            });
            $(".shang_img").css({
                "width":winW*0.1+"px",
                "height":winH*0.19+"px",
                "padding":winH*0.06+"px"
            });
            $(".money,.names").height(winH*0.05);
            $(".buys").css({
                "width":winW*0.1+"px",
                "height":winH*0.04+"px",
                "marginLeft":winH*0.01+"px"
            });
            $(".comment").css({
                "height":winH*0.53+"px",
                "marginLeft":winH*0.01+"px"
            });
            $(".last_page").css({
                "height":winH*0.53+"px",
                "marginTop":winH*0.02+"px"
            });




        })
    </script>
</head>

<body>
<div class="bigdiv">
    <!--左边列表ll-->
    <div class="list_left">
        <div class="title"><a href="${ctx}/itv " id="itv_back" tabindex="-1"><img class="return" src="${ctxStaticItv }/images/return.png" ></img></a> 周边商户</div>
         <c:forEach items="${typeList}" var="btype" varStatus="status"> 
         <c:if test="${btype.id==type.id}">
        <p class="left_p left_pAct" onclick="window.location.href='${ctx}/itv/businessToggle?businessTypeId=${btype.id}'" tabindex="${status.index+1}">
           <span>${ btype.name}</span>
        </p>
        </c:if>
            <c:if test="${btype.id!=type.id}" >
        <p class="left_p " onfocus="window.location.href='${ctx}/itv/businessToggle?businessTypeId=${btype.id}'" tabindex="${status.index+1}">
           <span>${ btype.name}</span>
        </p>
        </c:if>
        </c:forEach>
    </div>
    <!--右边文章-->
    <div class="left_user">
      <div class="left_content">
        <div class="user_cont">
           <div class="markDiv">
              <p class="markName">
               ${empty business.fullName?business.shortName:business.fullName}
                <c:forEach begin="1" end="5" step="1" var="num">
							<c:if test="${num gt business.star}">
							<span class="grade">★</span>
							</c:if>
							<c:if test="${num le business.star}">
							<span class="grade-ignore">★</span>
							</c:if>
							</c:forEach>
                 <button class="save" onclick="collect('${business.id}')">收藏</button>
              </p>
              <p class="markPhone">电话：${empty business.phone?business.telphone:business.phone}
                 <span style="float:right;">
                 <img src="${ctxStaticItv}/images/liulan.png" class="read" /> ${business.viewCount } &emsp;
                 <img src="${ctxStaticItv}/images/read.png" class="read" /> ${business.collectNum }
                 </span>
               </p>
               <p class="address">地址：${business.address}</p>
           </div>
           <c:if test="${flag=='0' }">
            <button onclick="supermarket(1)" id="seller" class="seller head_focus" tabindex="11">商家介绍</button>
            <button onclick="supermarket(2)" id="goods" class="goods head_focus" tabindex="12">商品</button>
            <button onclick="supermarket(3)" id="comment" class="goods head_focus" tabindex="13">评论</button>
            </c:if>
              <c:if test="${flag=='1' }">
            <button onclick="supermarket(1)" id="seller" class="goods head_focus" tabindex="11">商家介绍</button>
            <button onclick="supermarket(2)" id="goods" class="seller head_focus" tabindex="12">商品</button>
            <button onclick="supermarket(3)" id="comment" class="goods head_focus" tabindex="13">评论</button>
            </c:if>
              <c:if test="${flag=='2' }">
            <button onclick="supermarket(1)" id="seller" class="goods head_focus" tabindex="11">商家介绍</button>
            <button onclick="supermarket(2)" id="goods" class="goods head_focus" tabindex="12">商品</button>
            <button onclick="supermarket(3)" id="comment" class="seller head_focus" tabindex="13">评论</button>
            </c:if>
            <!--商家介绍-->
            <c:if test="${flag=='0' }">
            <div class="content">
            	<p class="font">${business.describes }</p>
            </div>
            <!--商品-->
            <div class="goodsDiv " style="display:none">

             <c:if test="${gpage.count gt 0}">
                 <div classs="clearfix">
            	<c:forEach items="${gpage.list}" var="goods" varStatus="status">

                        <div class="goodsDivs">
                            <img src="${goods.imagesId }" class="shang_img">
                            <p class="money">￥${goods.price }</p>
                            <p class="names">${empty goods.fullName?goods.shortName:goods.fullName}</p>
                            <input type="button" class="buys" value="预订" onclick="orders('${goods.fullName}','${goods.price}','${goods.id}')">
                        </div>
                </c:forEach>
               </div>
                 <div class="clear"></div>
                <div class="last_page" >
   <c:if test="${!gpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.prev}')" href="javascript:void(0)" class="head_focus" tabindex="50">▲</a></c:if>&emsp;${gpage.pageNo}/${gpage.last}&emsp; <c:if test="${!gpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.next}')" href="javascript:void(0)" class="head_focus" tabindex="51">▼</a></c:if>
</div>
</c:if>
<c:if test="${gpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无商品</font>
</c:if>

            </div>
            <!--评论-->
            <div class="comment" style="display:none">
            <c:if test="${cpage.count gt 0}">

               <c:forEach items="${cpage.list}" var="comments" varStatus="status"> 
               <div class="commentDiv">
                 <img src="${comments.resident.imagesId }" class="comImg"/>
                 <div class="contents">
                    <p>${comments.resident.name} ｜ <fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> ｜ ${comments.belongOrg.name}</p>
                    <hr class="comhr"/>
                    <p class="comp">${fns:abbr(comments.contents,350)}</p>
                 </div>
               </div>
               </c:forEach>
               <div class="last_page" >
   <c:if test="${!cpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.prev}&gpageNo=${gpageNo}')" href="javascript:void(0)" class="head_focus" tabindex="52">▲</a></c:if>&emsp;${cpage.pageNo}/${cpage.last}&emsp; <c:if test="${!cpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.next}&gpageNo=${gpageNo}')" href="javascript:void(0)" class="head_focus" tabindex="53">▼</a></c:if>
</div>
</c:if>
<c:if test="${cpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无评论</font>
</c:if>
            </div>
            </c:if>
                  <c:if test="${flag=='1' }">
            <div class="content" style="display:none">
            	<div style="height:2vh;"></div>
            	<p class="font">${business.describes }</p>
            </div>
            <!--商品-->
               <div class="goodsDiv" style="display:none">
             <c:if test="${gpage.count gt 0}">
            	<div style="height:2vh"></div>
            	<c:forEach items="${gpage.list}" var="goods" varStatus="status"> 
            	<div class="goodsDivs">
                    <img src="${goods.imagesId }" class="shang_img">
                    <p class="money">￥${goods.price }</p>
                    <p class="names">${empty goods.fullName?goods.shortName:goods.fullName}</p>
                    <input type="button" class="buys head_focus" value="预订" onclick="orders('${goods.fullName}','${goods.price}','${goods.id}')" tabindex="${status.index+20}">
                </div>
                </c:forEach>
                <div class="last_page" >
   <c:if test="${!gpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.prev}')" href="javascript:void(0)" class="head_focus" tabindex="53">▲</a></c:if>&emsp;${gpage.pageNo}/${gpage.last}&emsp; <c:if test="${!gpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.next}')" href="javascript:void(0)" class="head_focus" tabindex="55">▼</a></c:if>
</div>
</c:if>
<c:if test="${gpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无商品</font>
</c:if>
            </div>
            <!--评论-->
    <div class="comment" style="display:none">
            <c:if test="${cpage.count gt 0}">
               <div style="height:2vh"></div>
               <c:forEach items="${cpage.list}" var="comments" varStatus="status"> 
               <div class="commentDiv">
                 <img src="${comments.resident.imagesId }" class="comImg"/>
                 <div class="contents">
                    <p>${comments.resident.name} ｜ <fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> ｜ ${comments.belongOrg.name}</p>
                    <hr class="comhr"/>
                    <p class="comp">${fns:abbr(comments.contents,350)}</p>
                 </div>
               </div>
               </c:forEach>
               <div class="last_page" >
   <c:if test="${!cpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.prev}&gpageNo=${gpageNo}')" href="javascript:void(0)">▲</a></c:if>&emsp;${cpage.pageNo}/${cpage.last}&emsp; <c:if test="${!cpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.next}&gpageNo=${gpageNo}')" href="javascript:void(0)">▼</a></c:if>
</div>
</c:if>
<c:if test="${cpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无评论</font>
</c:if>
            </div>
            </c:if>
            
               <c:if test="${flag=='2' }">
            <div class="content" style="display:none">
            	<div style="height:2vh"></div>
            	<p class="font">${business.describes }</p>
            </div>
            <!--商品-->
              <div class="goodsDiv" style="display:none">
             <c:if test="${gpage.count gt 0}">
            	<div style="height:2vh"></div>
            	<c:forEach items="${gpage.list}" var="goods" varStatus="status"> 
            	<div class="goodsDivs">
                    <img src="${goods.imagesId }" class="shang_img">
                    <p class="money">￥${goods.price }</p>
                    <p class="names">${empty goods.fullName?goods.shortName:goods.fullName}</p>
                    <input type="button" class="buys" value="预订" onclick="orders('${goods.fullName}','${goods.price}','${goods.id}')">
                </div>
                </c:forEach>
                <div class="last_page" >
   <c:if test="${!gpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.prev}')" href="javascript:void(0)" class="head_focus" tabindex="56">▲</a></c:if>&emsp;${gpage.pageNo}/${gpage.last}&emsp; <c:if test="${!gpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpageNo}&gpageNo=${gpage.next}')" href="javascript:void(0)" class="head_focus" tabindex="57">▼</a></c:if>
</div>
</c:if>
<c:if test="${gpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无商品</font>
</c:if>
            </div>
            <!--评论-->
        <div class="comment" style="display:none">
            <c:if test="${cpage.count gt 0}">
               <div style="height:2vh"></div>
               <c:forEach items="${cpage.list}" var="comments" varStatus="status"> 
               <div class="commentDiv">
                 <img src="${comments.resident.imagesId }" class="comImg"/>
                 <div class="contents">
                    <p>${comments.resident.name} ｜ <fmt:formatDate value="${comments.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> ｜ ${comments.belongOrg.name}</p>
                    <hr class="comhr"/>
                    <p class="comp">${fns:abbr(comments.contents,350)}</p>
                 </div>
               </div>
               </c:forEach>
               <div class="last_page" >
   <c:if test="${!cpage.firstPage}"><a style="color: #101010;" onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.prev}&gpageNo=${gpageNo}')" href="javascript:void(0)" class="head_focus" tabindex="58">▲</a></c:if>&emsp;${cpage.pageNo}/${cpage.last}&emsp; <c:if test="${!cpage.lastPage}"><a style="color: #101010;"  onclick="prev('${ctx}/itv/businessDetail?businessId=${business.id}&cpageNo=${cpage.next}&gpageNo=${gpageNo}')" href="javascript:void(0)" class="head_focus" tabindex="59">▼</a></c:if>
</div>
</c:if>
<c:if test="${cpage.count eq 0}">
<div style="height:2vh"></div>
<font style="font-size:1.8em">暂无评论</font>
</c:if>
            </div>
            </c:if>
            
         </div>
      </div>
    </div>
</div>
</body>
</html>