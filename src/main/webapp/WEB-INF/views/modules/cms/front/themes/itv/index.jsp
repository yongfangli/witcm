<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
	<link href="${ctxStaticItv}/css/index.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStaticItv}/css/common.css" type="text/css" rel="stylesheet" />
	
	
	 <%@include file="/WEB-INF/views/modules/cms/front/include/head_itv.jsp" %>
	 
	<script src="${ctxStaticItv}/js/common.js" type="text/javascript"></script>
</head>
<body>
    <div class="bigdiv">
   	 <!--头部-->
     <jsp:include page="head.jsp" />
     <div class="clear"></div>
     <!--中间--> 
     <div class="middle">
      <c:if test="${!page.firstPage}">
        <div class="but_left"><a href="${ctx}/itv?pageNo=${page.prev}"><</a></div>
     </c:if>
       <c:if test="${page.firstPage}">
        <div style="width: 2vw;height: 1.5vh;float: left;"></div>
     </c:if>
        <div class="mid_con">
       <c:if test="${page.count>0||picture!=null}">
             <div class="contentList">
             <c:if test="${page.count>0}">
	             <div class="con_top"  style="background:#008BCC" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[0].id}'">
	                 <div class="con_top1">
	                 <img src="${page.list[0].image}" class="content_img" />
	                 <br/><br/>
	              	 <p>${page.list[0].name}</p>
	                  </div>
	              </div>
	              </c:if>
	              <c:if test="${page.count>1}">
             	<div class="con_bom"  style="background:#E25A68" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[1].id}'">
                 <div class="con_top1">
                 <img src="${page.list[1].image}" class="content_img" />
                 <br/><br/>
              	 <p>${page.list[1].name}</p>
                  </div>
               </div>
               </c:if>
             </div>
             <c:if test="${page.count>2}">
             <div class="city" style="background:#FEC200" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[2].id}'">
         	  <img src="${page.list[2].image}" class="cityimg"/>
              <br/><br/>
              <p>${page.list[2].name}</p>
            </div>
            </c:if>
            
            <div class="contentList">
            <c:if test="${page.count>3}">
            	<div class="con_top"  style="background:#4A991C" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[3].id}'">
                 <div class="con_top1">
                 <img src="${page.list[3].image}" class="content_img" />
                 <br/><br/>
              	 <p>${page.list[3].name}</p>
                  </div>
               	</div>
               	</c:if>
               <c:if test="${page.count>4}">
               <div class="con_bom"  style="background:#4A991C" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[4].id}'">
                 <div class="con_top1">
                 <img src="${page.list[4].image}" class="content_img" />
                 <br/><br/>
              	 <p>${page.list[4].name}</p>
                  </div>
              	 </div>
         		</c:if>
            </div>
            
            <div class="contentList">
            <c:if test="${page.count>5}">
            <div class="con_top"  style="background:#3D9972" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[5].id}'">
                 <div class="con_top1">
                 <img src="${page.list[5].image}" class="content_img" />
                 <br/><br/>
              	 <p>${page.list[5].name}</p>
                  </div>
               </div>
               </c:if>
               <c:if test="${page.count>6}">
               <div class="con_bom"  style="background:#FF6606" onclick="window.location.href='${ctx}/itv/categoryList?categoryId=${page.list[6].id}'">
                 <div class="con_top1">
                 <img src="${page.list[6].image}" class="content_img" />
                 <br/><br/>
              	 <p>${page.list[6].name}</p>
                  </div>
               </div>
               </c:if>
            </div>
            
            
             
            </c:if>
           	<c:if test="${!page.lastPage}">
	        	<div class="but_left"><a href="${ctx}/itv?pageNo=${page.next}">></a></div>
	        </c:if>
            
        </div>
       
     </div>
     <!--底部-->
     <jsp:include page="foot.jsp" />
     
   </div>
</body>
</html>