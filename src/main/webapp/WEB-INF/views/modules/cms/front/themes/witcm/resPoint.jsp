<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心－个人积分</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	
	<link href="${ctxStaticTheme}/css/point.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
		$(function(){
		   $("#resPoint").addClass("dvCheck");
		   
		   var totalPoints = "${resident.totalPoints}";
		   var usedPoints = "${resident.usedPoints}";
		   var usablePoints = "${resident.usablePoints}";
		   if(totalPoints!=null && totalPoints!="" && totalPoints!=0){
			   $("#bar1Div").css("width", (totalPoints/6).toFixed(2)+"%");
			   $("#bar1Span").html(totalPoints);
		   }else{
			   $("#bar1Div").css("width", "0%");
			   $("#bar1Span").html("0");
		   }
		   
			if(usedPoints!=null && usedPoints!="" && usedPoints!=0){
				$("#bar2Div").css("width", (usedPoints/6).toFixed(2)+"%");
			   	$("#bar2Span").html(usedPoints);
			}else{
			   	$("#bar2Div").css("width", "0%");
			   	$("#bar2Span").html("0");
			}
			if(usablePoints!=null && usablePoints!="" && usablePoints!=0){
				$("#bar3Div").css("width", (usablePoints/6).toFixed(2)+"%");
			   	$("#bar3Span").html(usablePoints);
			}else{
			   	$("#bar3Div").css("width", "0%");
			   	$("#bar3Span").html("0");
			}
		 });
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="resMenu.jsp" />
        
        <div id="dvContentRight">
        	<div class="center_title">个人积分</div>
            <div id="dvInner">
                <table>
                    <tr>
                        <td class="title">总积分</td>
                        <td>
	                        	<!--<c:if test="${not empty resident.totalPoints && resident.totalPoints!=0 }">
	                        		<input type="text" disabled="disabled" id="txtCount" style="width:${resident.totalPoints }px; " value="${resident.totalPoints }" />
	                        	</c:if>
	                            <c:if test="${empty resident.totalPoints || resident.totalPoints==0 }">0</c:if>-->
	                            
	                            <div class="Bar1"> 
								    <div id="bar1Div"> 
								        <span id="bar1Span">0</span> 
								    </div> 
								</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">已用积分</td>
                        <td>
                            <div class="Bar2"> 
							    <div id="bar2Div" style="width: 20%;"> 
							        <span id="bar2Span">20</span> 
							    </div> 
							</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">可用积分</td>
                        <td>
                            <div class="Bar3"> 
							    <div id="bar3Div"> 
							        <span id="bar3Span">0</span> 
							    </div> 
							</div>
                        </td>
                    </tr>
                    <!-- <tr>
                        <td colspan="2" class="tb_btn">
                            <button class="conis">积分兑换</button>
                        </td>
                    </tr> -->
                </table>

            </div>
        </div>
    </div>
</div>
</body>
</html>