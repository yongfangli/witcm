<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>商户 中心－星级查询</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/point.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
	   $(function(){
		   $("#busStars").addClass("dvCheck");
	   });
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        <div class="center_title">星级排名</div>
       		<div id="dvInner">
                <table>
                    <tr>
                        <td class="title">获得星级：</td>
                        <td>
	                       	<c:forEach begin="1" end="5" step="1" var="num">
								<c:if test="${num gt bususer.star}">
									<span class="color_b">&#9733;</span>
								</c:if>
									<c:if test="${num le bususer.star}">
								<span class="color_r">&#9733;</span>
								</c:if>
							</c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">当前排名：</td>
                        <td>
                            <div class="Bar2"> 
							    <div id="bar2Div"> 
							        <span id="bar2Span">${sortedNum }</span> 
							    </div> 
							</div>
                        </td>
                    </tr>
                </table>

            </div>
        
        </div>
    </div>
</div>
</body>
</html>