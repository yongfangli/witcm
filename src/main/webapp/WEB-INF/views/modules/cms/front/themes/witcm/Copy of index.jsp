<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/index.css" type="text/css" rel="stylesheet" />
	<style>
	a{
	text-decoration:none;color:black;
	}
	.groundImg{
	width: 219px; 
    height: 80px;
    margin-left: 28px;
    font-size: 1.1em;
    font-weight: 600;
        line-height:80px;
	}
	</style>
	<script type="text/javascript">
	   function fuwu(obj,href){
		   $("#toggle").attr("href",href);
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
		
		function up_td_img(img){
			 var imgss='${ctxStaticTheme}'+"/images/fuwuRed.png";
			 var img=$(img).children(".groundImg");
			 $(img).css ("background", "url("+imgss+")");
		}
		
		function out_td_img(img){
			 var imgss='${ctxStaticTheme}'+"/images/fuwuyel.png";
			 var img=$(img).children(".groundImg");
			 $(img).css ("background", "url("+imgss+")");
		}
	</script>
</head>
<body>
    <!--中间内容-->
		<div style="height:25px"></div>
		<div class="middle_content">
        	<!--中间1-->	
        	<div class="middle1_con">
               <div class="middle2_con">
              <c:forEach items="${fnc:getMainNavList('1')}" var="category" end="0" varStatus="status">
           	  	 <c:forEach items="${fnc:getArticleList('1', category.id,1, '')}" var="article">
           	  	   <c:if test="${article.image!=null&&article.image!='' }">
           	  	     <a href="${ctx}/news-view-${article.id}${fns:getUrlSuffix()}" target="_blank"><img style="width: 373px;" src="${article.image}"></a>
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
                 	<img  src="${ctxStatic}/client/img/sqnews.png" class="img_center">
                 	 ${category.name}
                                                           
                    <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-news${fns:getUrlSuffix()}">更多> >&emsp;</a></div>
                 	<c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                       <div class="sqxnews">
                        <a href="${ctx}/news-view-${article.id}${fns:getUrlSuffix()}" target="_blank">
                          <div style="float:left">●&nbsp;</div>
                          <div class="sqnewscon">${fns:abbr(article.title,120)}</div>
                          <div style="float:right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                        </a>
                       </div>
                       </c:forEach>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 1}">
                 	<img src="${ctxStatic}/client/img/sqdongtai.png" class="img_center">
                 	 ${category.name }
                                                           
                    <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-trends${fns:getUrlSuffix()}">更多> >&emsp;</a></div>
                 	 <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                       <div class="sqxnews">
                        <a href="${ctx}/trends-view-${article.id}${fns:getUrlSuffix()}" target="_blank">
                          <div style="float:left">●&nbsp;</div>
                          <div class="sqnewscon">${fns:abbr(article.title,80)}</div>
                          <div style="float:right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                      </a>
                       </div>
                       </c:forEach>
                 	</c:if>
                 			 <c:if test="${status.index eq 3}">
                 	<img src="${ctxStatic}/client/img/banshi.png" class="img_center">
                 	 ${category.name }
                                                           
                    <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-guide${fns:getUrlSuffix()}">更多> >&emsp;</a></div>
                 	     <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                       <div class="sqxnews">
                        <a href="${ctx}/guide-view-${article.id}${fns:getUrlSuffix()}" target="_blank">
                          <div style="float:left">●&nbsp;</div>
                          <div class="sqnewscon">${fns:abbr(article.title,80)}</div>
                          <div style="float:right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                      </a>
                       </div>
                       </c:forEach>
                 	</c:if>
                                                          
                       <div style="height:5px"></div>
                      
                  
                   
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
								<div class="pic"><a target="_blank" href="${ctx}/list1-${category.id}-faces${fns:getUrlSuffix()}"><img src="${article.image}" /></a></div>
							</li>
					 </c:forEach>	
					    </c:if>	 
                  </c:forEach>
						</ul>
						<a class="sNext" href="javascript:void(0)"></a>
					</div><!-- slideBox End -->
			      </div><!-- parBd End -->
			      <script type="text/javascript">
					jQuery(".slideGroup .slideBox").slide({ mainCell:"ul",vis:5,prevCell:".sPrev",nextCell:".sNext",effect:"leftLoop",autoPlay:true});
				
					/* 外层tab切换 */
				   jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"});
					</script>
		        </div>
               </div>
               <!--中间3服务切换--> 
               <div style="height:25px"></div>
               <div class="mar">
                <div class="middle_fuwu_tab">
                  	<div class="fuwu" onClick="fuwu(1,'${ctx}/business-list1-6${fns:getUrlSuffix()}')">
                       <img src="${ctxStaticTheme}/images/fuwu.png" class="img_center">
                 	    周边商家 
                       </div>
                     <div class="phone" onClick="fuwu(2,'${ctx}/convenient-list1-8${fns:getUrlSuffix()}')">
                       <img src="${ctxStaticTheme}/images/phone.png" class="img_center">
                                                            便民热线
                     </div>
                     <div class="more"><a target="_blank" href='${ctx}/business-list1-6${fns:getUrlSuffix()}' id="toggle" style="text-decoration:none;color:black">更多> ></a></div>
                     <div class="content_li">
               	    <table class="table_fuwu">
               	    
                            <tr>
                            <c:forEach items="${bTypeList}" var="cv" end="2" varStatus="status">
                            	<td><a onMouseMove="up_td_img(this)" onMouseOut="out_td_img(this)" target="_blank" href="${ctx}/business-list1-6.html?typeId=${cv.id}"><div class="groundImg" style="background:url(${ctxStaticTheme}/images/fuwuyel.png)">${cv.name}</div></a></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach items="${bTypeList}" var="cv" begin="3" end="5" varStatus="status">
                            	<td><a onMouseMove="up_td_img(this)" onMouseOut="out_td_img(this)" target="_blank" href="${ctx}/business-list1-6.html?typeId=${cv.id}"><div class="groundImg" style="background:url(${ctxStaticTheme}/images/fuwuyel.png)">${cv.name}</div></a></td>
                            </c:forEach>
                            </tr>
                    
                        </table>
                       <div class="temp">
                          <c:forEach items="${cvList}" var="cv" end="3" >
                          <div class="addr">
                              > ${cv.name }&emsp;&emsp; 电话：${cv.phone }
                              <p>地址：${cv.address}</p>
                            </div>
                          </c:forEach>
                       </div> 
                  </div>
                </div>
                <div class="sales">
                     <div class="fuwu2">
                       <img src="${ctxStaticTheme}/images/chuxiao.png" class="img_center">
                                                            促销信息
                     </div>
                     <div class="more"><a target="_blank" href='${ctx}/promotion-list-1${fns:getUrlSuffix()}'>更多> ></a></div>
                     <div class="content_li">
                     <c:forEach items="${ppage.list}" var="pro" >
                        <div class="chuxiao_news"><a href='${ctx}/promotionDetail-${pro.id}${fns:getUrlSuffix()}' target="_blank"> > ${fns:abbr(pro.titles,75)}</a></div>
                     </c:forEach>  
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
                 	 ${category.name}
                 	 <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-legal${fns:getUrlSuffix()}" target="_blank">更多> >&emsp;</a></div>
                 	<c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                     <div class="shishi_news_div">
                        <a target="_blank" href="${ctx}/legal-view-${article.id}${fns:getUrlSuffix()}"> <div style="float:left">●&nbsp;</div>
                         <div class="news_con">${fns:abbr(article.title,100)}</div>
                         <div style="float:right;"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                        </a>
                     </div>
                      </c:forEach>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 5}">
                 	<img src="${ctxStatic}/client/img/shishi.png" class="img_center">
                 	 ${category.name }
                 	 <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-facts${fns:getUrlSuffix()}">更多> >&emsp;</a></div>
                 	  <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                     <div class="shishi_news_div">
                        <a target="_blank" href="${ctx}/facts-view-${article.id}${fns:getUrlSuffix()}"> <div style="float:left">●&nbsp;</div>
                         <div class="news_con">${fns:abbr(article.title,100)}</div>
                         <div style="float:right;"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                        </a>
                     </div>
                      </c:forEach>
                 	</c:if>
                 	 		 <c:if test="${status.index eq 6}">
                 	<img src="${ctxStatic}/client/img/shishi.png" class="img_center">
                 	 ${category.name }
                    <div class="more"><a target="_blank" style="text-decoration:none;color:black" href="${ctx}/list1-${category.id}-activity${fns:getUrlSuffix()}">更多> >&emsp;</a></div>
                 	  <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                     <div class="shishi_news_div">
                        <a target="_blank" href="${ctx}/activity-view-${article.id}${fns:getUrlSuffix()}"> <div style="float:left">●&nbsp;</div>
                         <div class="news_con">${fns:abbr(article.title,100)}</div>
                         <div style="float:right;"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></div>
                        </a>
                      </div>
                      </c:forEach>
                 	</c:if>
                       
               		  </div>
                   </div>
                    </c:forEach>
              
             
               </div>
              </div> 
		<!--中间结束-->
</body>
</html>