<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
    <script type="text/javascript" src="${ctxStaticTheme}/myscroll/js/myscroll.js"></script>
	<script type="text/javascript">
    $(function() {
        // 调用
        $('.banner').myscroll({
            picElem: $('#move2'), //图片父级
            ctrlElem: $('#ctrl2'), //控制条父级(包括小圆点和左右箭头)
            isLibs: false, //是否创建底部小圆点(样式均可自定义调整),默认向lib添加单独类名，详情见调用后dom结构
            isArrows: false, //是否创建左右箭头(样式均可自定义调整)
            autoPlay: true, //是否自动播放
            playTime: 2000, //自动播放间隔时间
            playSpeed: 700, //图片切换速度 
            effect: 'top' //轮播的改变方式 top(向上) left(向左) fade(淡入淡出)
        });
    })
    </script>
	<link href="${ctxStaticTheme}/css/index.css" type="text/css" rel="stylesheet" />
	<style>
	a{
	text-decoration:none;color:black;
	}
	.groundImg{
	width: 219px; 
    height: 80px;
    margin-left: 28px;
  line-height:80px;
    font-size: 1.1em;
    font-weight: 600;
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
	<style type="text/css">
/*基础样式*/


.srcoll {
    height: 266px;

    vertical-align: top;
}

.clearfix::after {
    content: "";
    display: table;
    clear: both;
}

ul li {
    list-style: none;
}

/*轮播图样式*/

/*banner的长宽根据图片大小设置*/

.banner {
    position: relative;
    height: 460px;
}

.banner .move {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.move ul,
.move ul li {
    position: absolute;
    margin:-9px;
}

.ctrl {
    position: absolute;
    width: 100%;
    bottom: -30px;
    text-align: center;
}

.ctrl .libs {
    display: inline-block;
    margin-left: 10px;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background-color: #333;
    z-index: 50;
    cursor: pointer;
}

.ctrl span.active {
    background-color: #fff;
}

.ctrl .arrow {
    display: block;
    position: absolute;
    width: 30px;
    height: 60px;
    top: 50%;
    margin-top: -30px;
    background-color: #333;
    cursor: pointer;
    font-family: "宋体";
    opacity: .5;
    line-height: 58px;
    color: #fff;
    font-size: 20px
}

.ctrl .next {
    top: -250px;
    right: 0px;
}

.ctrl .prev {
    top: -250px;
}

.ctrl .arrow:hover {
    opacity: 1;
}



/*如需自定义底部小圆点样式*/


/*.lib1 {
    在此处添加样式
}

.lib2 {
    在此处添加样式

}
以此类推
*/



.desc {
    text-align: center;
}

.desc pre {
    color: #fff;
    display: inline-block;
    text-align: left;
}
</style>
</head>
<body>
    <!--中间内容-->
		<div style="height:25px"></div>
		<div class="middle_content">
        	<!--中间1-->	
        	<div class="middle1_con">
               <div class="middle2_con">
              <c:forEach items="${fnc:getMainNavList('1')}" var="category" end="0" varStatus="status">
           	  	 
           	  	 <div class="banner">
                      <div class="move" id="move2">
                         <ul>
                         <c:forEach items="${fnc:getArticleList('1', category.id,7, '')}" var="article">
                          <c:if test="${article.image!=null&&article.image!='' }">
                          <li><a href="${ctx}/news-view-${article.id}${fns:getUrlSuffix()}" target="_blank"><img class="srcoll"  src="${article.image}"></a></li>
                          </c:if>
                          <c:if test="${article.image==null||article.image=='' }">
                          <li> <img class="srcoll" src="${ctxStatic}/client/img/new-01.png"></li>
                          </c:if>
                          </c:forEach>
                       </ul>
                      </div>
                      <div class="ctrl" id="ctrl2"></div>
                 </div>
           	  	
           	  	 
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