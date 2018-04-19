﻿<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>智慧社区</title>
     <%@ include file="/WEB-INF/views/client/include/head.jsp"%>
     <link rel="stylesheet" href="${ctxStatic}/client/css/index.css" />
</head>
<body>
   <!--最大的div-->
   <div style="width:100%">
	   <!--头部-->
	   <div class="top">
			<div class="top_left">
			<img src="${ctxStatic}/client/img/logo.png" class="top_left_img">
				<b class="img_font">井冈山智慧社区</b>
			</div>
			
			<div class="top_right">
			   <div class="top_right_login" style="padding-left: 460px;">
					<!-- <input type="text" placeholder="请输入搜索内容" class="content"> 
					<img src="${ctxStatic}/client/img/check.png" class="picimg">-->
					<input type="button" value="登录" class="top_login"/>
					<input type="button" value="注册" class="top_reg"/>
				</div>	
				
				<div class="top_right_img">
				  <div class="top_weixin">
					<img src="${ctxStatic}/client/img/weixin.png">
				  </div>	
				  <div style="float:right">
					<img src="${ctxStatic}/client/img/app.png" style="float:right">
				  </div>	
				</div>
				
			</div>
	   </div>
		<!--轮播图-->
		<div class="mar">
            <div class="js-silder">
   				<div class="silder-scroll">
				  <div class="silder-main">
					 <div class="silder-main-img">
				       <img src="${ctxStatic}/client/img/lunbo-01.png" class="lun_mar">
			         </div>
		        	 <div class="silder-main-img">
					   <img src="${ctxStatic}/client/img/lunbo-01.png" class="lun_mar">
					 </div>
			  		 <div class="silder-main-img">
				       <img src="${ctxStatic}/client/img/lunbo-01.png" class="lun_mar">
			   		 </div>
				  </div>
				</div>
			</div>
		</div>
		<!--导航条-->
		<div class="navi_div">
			<div class="navi_middle">
				<ul>
				  <a><li class="li"><div style="height:16px"></div>首页</li></a>
				 <c:forEach items="${fnc:getMainNavList('1')}" var="category" varStatus="status">
				  <c:if test="${status.index == 0}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityNews"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  <c:if test="${status.index == 1}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityTrends"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 2}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityGuide"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 3}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityFaces"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 4}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityLegal"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  <c:if test="${status.index == 5}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityFacts"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				 <c:if test="${status.index == 6}">
				  <a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityTrends"><li class="li"><div style="height:16px"></div>${category.name}</li></a>
				 </c:if>
				  </c:forEach>
				</ul>
			</div>
		</div>
		<!--中间内容-->
		<div style="height:25px"></div>
		<div class="middle_content">
        	<!--中间1-->	
        	<div class="middle1_con">
              <div class="middle2_con">
              <c:forEach items="${fnc:getMainNavList('1')}" var="category" end="0" varStatus="status">
           	  	 <c:forEach items="${fnc:getArticleList('1', category.id,1, '')}" var="article">
           	  	   <c:if test="${article.image!=null&&article.image!='' }">
           	  	   <img src="${article.image}">
           	  	   </c:if>
           	  	   <c:if test="${article.image==null||article.image=='' }">
           	  	   <img src="${ctxStatic}/client/img/new-01.png">
           	  	   </c:if>
           	  	 </c:forEach>
           	  </c:forEach>
              </div>
               <c:forEach items="${fnc:getMainNavList('1')}" var="category" end="3" varStatus="status">
              <c:if test="${status.index != 2 }">
              <div class="middle1_1">
              	 <div class="news_div_top">
                 	
                 	 		 <c:if test="${status.index eq 0}">
                 	<img src="${ctxStatic}/client/img/sqnews.png" class="img_center">
                 	 ${category.name }
                                                           
                    <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityNews" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 1}">
                 	<img src="${ctxStatic}/client/img/sqdongtai.png" class="img_center">
                 	 ${category.name }
                                                           
                    <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityTrends" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                 			 <c:if test="${status.index eq 3}">
                 	<img src="${ctxStatic}/client/img/banshi.png" class="img_center">
                 	 ${category.name }
                                                           
                    <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityGuide" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                                                          
                       <div style="height:5px"></div>
                      
                       <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                       <div class="sqxnews">
                          <div style="float:left">●&nbsp;</div>
                          <div class="sqnewscon">${fns:abbr(article.title,28)}</div>
                          <div style="float:right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                       </div>
                       </c:forEach>
                   
                 </div>
              </div>
                </c:if>	
                 </c:forEach>
              </div>
               <!--中间2轮播图-->
              
               <div style="height:25px"></div>
               <div class="carousel">
               	 <div class="slideGroup">
			       <div class="parBd">
					<div class="slideBox">
						<a class="sPrev" href="javascript:void(0)"></a>
						<ul>
						  <c:forEach items="${fnc:getMainNavList('1')}" var="category" end="3" varStatus="status">
                       <c:if test="${status.index eq 2 }">
                  <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                          
							<li>
								<div class="pic"><a href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityFaces&pageSize=8" target="_blank"><img src="${article.image}" /></a></div>
							</li>
					 </c:forEach>	
					    </c:if>	 
                  </c:forEach>
             
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->
			      </div><!-- parBd End -->
		        </div>
               </div>
               
               <!--中间3服务切换--> 
               <div style="height:25px"></div>
               <div class="mar">
                <div class="middle_fuwu_tab">
                  	<div class="fuwu" onClick="fuwu(1)">
                       <img src="${ctxStatic}/client/img/fuwu.png" class="img_center">
                 	    周边服务 
                       </div>
                     <div class="phone" onClick="fuwu(2)">
                       <img src="${ctxStatic}/client/img/phone.png" class="img_center">
                                                          便民热线
                     </div>
                     <div class="more">更多> ></div>
                     <div class="content_li">
               	    <table class="table_fuwu">
                            <tr>
                            	<td><img src="${ctxStatic}/client/img/fuwu-1.png" onMouseMove="up_td_img(1,this)" onMouseOut="up_td_imgs(1,this)"></td>
                                <td><img src="${ctxStatic}/client/img/fuwu-2.png" onMouseMove="up_td_img(2,this)" onMouseOut="up_td_imgs(2,this)"></td>
                                <td><img src="${ctxStatic}/client/img/fuwu-3.png" onMouseMove="up_td_img(3,this)" onMouseOut="up_td_imgs(3,this)"></td>
                            </tr>
                            <tr>
                            	<td><img src="${ctxStatic}/client/img/fuwu-4.png" onMouseMove="up_td_img(4,this)" onMouseOut="up_td_imgs(4,this)"></td>
                                <td><img src="${ctxStatic}/client/img/fuwu-5.png" onMouseMove="up_td_img(5,this)" onMouseOut="up_td_imgs(5,this)"></td>
                                <td><img src="${ctxStatic}/client/img/fuwu-6.png" onMouseMove="up_td_img(6,this)" onMouseOut="up_td_imgs(6,this)"></td>	
                            </tr>
                        </table>
                       <div class="temp">
                       		<div class="addr">
                              > 江西池泉科技有限公司&emsp;&emsp; 电话：0791-88888888
                              <p>地址：南昌市红谷滩新区红谷中大道1619号国际金融中心A座1618室</p>
                            </div>
                            <div class="addr">
                              > 江西池泉科技有限公司&emsp;&emsp; 电话：0791-88888888
                              <p>地址：南昌市红谷滩新区红谷中大道1619号国际金融中心A座1618室</p>
                            </div>
                            <div class="addr">
                              > 江西池泉科技有限公司&emsp;&emsp; 电话：0791-88888888
                              <p>地址：南昌市红谷滩新区红谷中大道1619号国际金融中心A座1618室</p>
                            </div>
                            <div class="addr">
                              > 江西池泉科技有限公司&emsp;&emsp; 电话：0791-88888888
                              <p>地址：南昌市红谷滩新区红谷中大道1619号国际金融中心A座1618室</p>
                            </div>
                       </div> 
                  </div>
                </div>
                <div class="sales">
                     <div class="fuwu">
                       <img src="${ctxStatic}/client/img/chuxiao.png" class="img_center">
                                                                      促销信息
                     </div>
                     <div class="more">更多> ></div>
                     <div class="content_li">
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                        <div class="chuxiao_news">> 优质大米惊爆价抛售，快来社区商超抢米吧 ！</div>
                     </div>
                 </div>
               </div> 
               <!--中间4-->
           	   <div style="height:25px"></div>
           	   
               <div class="middle1_con">
                <c:forEach items="${fnc:getMainNavList('1')}" var="category" begin="4" varStatus="status">
                  <c:if test="${status.index eq 5}">
                   <div class="law">
                   </c:if>
                   <c:if test="${status.index == 6}" >
                   <div class="news3_div">
                   </c:if>
                        <c:if test="${status.index == 4}" >
                   <div class="middle_bottom">
                   </c:if>
                   		<div class="news_div_top">
                   		 <c:if test="${status.index eq 4}">
                 	<img src="${ctxStatic}/client/img/falv.png" class="img_center">
                 	 ${category.name }
                 	 <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityLegal" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 5}">
                 	<img src="${ctxStatic}/client/img/shishi.png" class="img_center">
                 	 ${category.name }
                 	 <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityFacts" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 6}">
                 	<img src="${ctxStatic}/client/img/shishi.png" class="img_center">
                 	 ${category.name }
                    <div class="more"><a style="text-decoration:none;color:black" href="${ctxClient}/articleList${fns:getUrlSuffix()}/${category.id}/?pageName=communityActivity" target="_blank">更多> >&emsp;</a></div>
                 	</c:if>
                                 
                    <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                     <div class="shishi_news_div">
                         <div style="float:left">●&nbsp;</div>
                         <div class="news_con">${fns:abbr(article.title,28)}</div>
                         <div style="float:right;"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                      </div>
                      </c:forEach>
                       
               		  </div>
                   </div>
                    </c:forEach>
              </div> 
		<!--中间结束-->
         <!--友情链接-->
               <div style="height:25px"></div>
               <div class="friend_link">
                   <ul>
                      <li class="lianjieli">友情链接：</li>
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                      <li class="lianjieli"><a>政府官网</a></li> 
                   </ul>
               </div>
             <!--底部-->  
             <div class="company_bottom">
                   <div style="height:20px"></div>
                   井冈山红星街道办版权所有@2017-2021<br/>
					江西电信信息产业有限公司&技术支持
             </div>
   <!--最大div结束-->
   </div>
</body>
<script type="text/javascript">
	/* if(navigator.userAgent.indexOf('Firefox') >= 0){
	}else{
		$(".pic").css("margin-top", "-18px");  
	}*/
	/* 内层图片滚动切换 */
	jQuery(".slideGroup .slideBox").slide({ mainCell:"ul",vis:5,prevCell:".sPrev",nextCell:".sNext",effect:"leftLoop",autoPlay:true});

	/* 外层tab切换 */
   jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"});	
   function fuwu(obj){
		if(obj==1){
			$(".table_fuwu").show();
			$(".temp").hide();
			$(".fuwu").css("background", "#ec3b3b");  
			$(".phone").css("background", "#666666");  
		}else{
			$(".table_fuwu").hide();
			$(".temp").show();
			$(".fuwu").css("background", "#666666");  
			$(".phone").css("background", "#ec3b3b"); 
		}
	}
	
	function up_td_img(obj,img){
		 var imgss='${ctxStatic}'+'/client/'+"img/fuwu2-"+obj+".png";
		 $(img).attr ("src", ""+imgss+"");
	}
	
	function up_td_imgs(obj,img){
		var imgss='${ctxStatic}'+'/client/'+"img/fuwu-"+obj+".png";
		 $(img).attr ("src", ""+imgss+"");
	}
	 	
	$(function (){
		$(".js-silder").silder({
			auto: true,//自动播放，传入任何可以转化为true的值都会自动轮播
			speed: 20,//轮播图运动速度
			sideCtrl: true,//是否需要侧边控制按钮
			bottomCtrl: true,//是否需要底部控制按钮
			defaultView: 0,//默认显示的索引
			interval: 300000,//自动轮播的时间，以毫秒为单位，默认3000毫秒
			activeClass: "active",//小的控制按钮激活的样式，不包括作用两边，默认active
		});
	});
</script>
</html>
