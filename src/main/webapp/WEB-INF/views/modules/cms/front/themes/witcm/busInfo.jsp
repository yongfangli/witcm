<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>商户中心－商户信息</title>
	<meta name="decorator" content="cms_center_${site.theme}"/>
	<meta name="description" content="jinggangshan ${site.description}" />
	<meta name="keywords" content="jinggangshan ${site.keywords}" />
	<link href="${ctxStaticTheme}/css/center.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=sbar7CPmezMLDTkNsEXIPyTgydvuAvab"></script> 
	<style>
	.anchorBL{display:none;}
	</style>
	<script type="text/javascript">
	   $(function(){
		   $("#busInfo").addClass("dvCheck");
		   
		   var msg = "${message}";
		   if(msg!=null && msg!=""){
			   showTip(msg);
		   }
		   
		   $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
	   });
	</script>
</head>
<body>
    <div id="dvMain">
    <div id="dvContent">
        
        <!-- menu -->
        <jsp:include page="busMenu.jsp" />
        
        <div id="dvContentRight">
        <div class="center_title">商户信息</div>
        <form:form id="inputForm" modelAttribute="business" enctype="multipart/form-data" action="${ctx}/bus/busInfoSave" method="post" class="form-horizontal">
        	<form:hidden path="id"/>
	        <form:hidden path="logoId"/>
        	<table id="contentTable" class="table_bor">
	        	<tr>
	        		<td class="table_form_f1">商户类别:</td>
	        		<td class="table_form_f2" colspan="2">
	        			<sys:treeselectFront id="businessTypes" name="types.id" value="${business.types.id}" labelName="types.name" labelValue="${business.types.name}"
							title="类别" url="/bus/busTreeData" extId="${types.id}" cssClass="required"/>
							<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        		<td class="table_form_f2" rowspan="4">
						<div style="text-align: center;width: 100%;">
	        				<img src="${business.logoId }" width="90px" height="110px"/>
							<input type="file" id="logoId" name="file" class="isimages"/>
	        			</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">商户全称:</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:input path="fullName" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">商户简称:</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:input path="shortName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">手机号:</td>
	        		<td class="table_form_f2" colspan="2">
	        			<form:input path="telphone" maxlength="30" class="input-xlarge " readonly="true"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">电话:</td>
	        		<td class="table_form_f2">
	        			<form:input path="phone" htmlEscape="false" maxlength="30" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        		<td class="table_form_f1">联系人:</td>
	        		<td class="table_form_f2">
	        			<form:input path="linkMan" htmlEscape="false" maxlength="30" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font></span>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">商户地址:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:input path="address" htmlEscape="false" maxlength="200" class="input-xlarge " style="width:460px;"/>
					<input id="btnMap" class="btn btn-primary" type="button" value="搜索地图" onclick="searchMap(document.getElementById('address').value);"/>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">地图标记:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<div style="width: 580px;height: 300px;overflow: hidden;" id="container_map"></div>
						<script type="text/javascript">
							//在指定的容器内创建地图实例
							var lgtude = "${business.longitude}";
							var lttude = "${business.latitude}";
							if(lgtude==null || lgtude==""){
								lgtude = '114.297662';
							}
							if(lttude==null || lttude==""){
								lttude = '26.751383';
							}
							var map = new BMap.Map("container_map");
					
							map.setDefaultCursor("crosshair");//设置地图默认的鼠标指针样式
							map.enableScrollWheelZoom();//启用滚轮放大缩小，默认禁用。
							//创建点坐标
							var point = new BMap.Point(lgtude, lttude);
							//初始化地图，设置中心点坐标和地图级别
							map.centerAndZoom(point, 13);
							var gc = new BMap.Geocoder();
							//向map中添加--------------------------------------控件
							//OverviewMapControl 缩略地图控件，默认位于地图右下方，是一个可折叠的缩略地图
							map.addControl(new BMap.OverviewMapControl());
							//ScaleControl：比例尺控件，默认位于地图左下方，显示地图的比例关系。
							map.addControl(new BMap.ScaleControl());
							//CopyrightControl：版权控件，默认位于地图左下方
							map.addControl(new BMap.CopyrightControl());
					
							// 创建标注  
							var marker = new BMap.Marker(point);   
							// 将标注添加到地图中
							map.addOverlay(marker);
							//点击事件
							marker.addEventListener("click", function(e){  
							 document.getElementById("longitude").value = e.point.lng; 
							 document.getElementById("latitude").value = e.point.lat; 
							}); 
							//marker的enableDragging和disableDragging方法可用来开启和关闭标注的拖拽功能。
							marker.enableDragging();
							//监听标注的dragend事件来捕获拖拽后标注的最新位置
							marker.addEventListener("dragend",function(e){
							  gc.getLocation(e.point, function(rs){  
							        	showLocationInfo(e.point, rs); 
										document.getElementById("longitude").value = e.point.lng; 
										document.getElementById("latitude").value = e.point.lat; 
							    	});  
							});
					
							//*****************************信息窗口
							//显示地址信息窗口  
							function showLocationInfo(pt, rs){  
							    var opts = {  
							      width : 140,     //信息窗口宽度  
							      height: 60,     //信息窗口高度  
							      title : "当前位置:"  //信息窗口标题  
							    };  
							    
							    var addComp = rs.addressComponents;  
							    var addr = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " +addComp.streetNumber;  
							      
							    var infoWindow = new BMap.InfoWindow(addr, opts);  //创建信息窗口对象  
							    marker.openInfoWindow(infoWindow);  
							} 
					
							map.addEventListener("click", function(e){//地图单击事件
								if(!e.overlay){
									document.getElementById("longitude").value = e.point.lng; 
									document.getElementById("latitude").value = e.point.lat; 
					
									var nextMarker = new BMap.Marker(e.point);
									nextMarker.enableDragging();
									nextMarker.addEventListener("dragend",function(e){
									  gc.getLocation(e.point, function(rs){  
												showLocationInfo(e.point, rs); 
												document.getElementById("longitude").value = e.point.lng; 
												document.getElementById("latitude").value = e.point.lat; 
											});  
									});
									map.removeOverlay(marker);  
									map.addOverlay(nextMarker);  
									marker=nextMarker;
								}
							    
							});
					
							//TrafficLayer：交通流量图层
							// 创建交通流量图层实例  
							var traffic = new BMap.TrafficLayer();     
							// 将图层添加到地图上  
							map.addTileLayer(traffic);                    
					
							function iploac(result){//根据IP设置地图中心
							    var cityName = result.name;
							    //map.setCenter(cityName);
							}
							var myCity = new BMap.LocalCity();
							myCity.get(iploac);
							function searchMap(result){//地图搜索
								if(result==null || result==""){
									$("#longitude").val("");
									$("#latitude").val("");
									return false;
								}
								gc.getPoint(result, function(point){  
									if (point) {     
										document.getElementById("longitude").value = point.lng; 
										document.getElementById("latitude").value = point.lat; 
										map.centerAndZoom(point, 16);     
										var nextMarker = new BMap.Marker(point);
										nextMarker.enableDragging();
										nextMarker.addEventListener("dragend",function(e){
										  gc.getLocation(e.point, function(rs){  
													showLocationInfo(e.point, rs); 
													document.getElementById("longitude").value = e.point.lng; 
													document.getElementById("latitude").value = e.point.lat; 
												});  
										});
										map.removeOverlay(marker);  
										map.addOverlay(nextMarker);  
										marker=nextMarker;     
									} 
								}); 
					
							}
						</script>
						<div style="margin-top: 5px;font-size: 12px" >
							经度:<form:input path="longitude" htmlEscape="false" maxlength="30" readonly="true" class="input-medium"/>
							纬度:<form:input path="latitude" htmlEscape="false" maxlength="30" readonly="true" class="input-medium"/>
						</div>
	        		</td>
	        		
	        	</tr>
	        	<tr>
	        		<td class="table_form_f1">商户简介:</td>
	        		<td class="table_form_f2" colspan="3">
	        			<form:textarea path="describes" htmlEscape="false" rows="6" style="width:570px;" maxlength="2000" class="input-xxlarge "/>
	        		</td>
	        	</tr>
	        </table>
	       
			<div class="form-actions">
				<input class="btn" type="submit" value="提 交"/>&nbsp;
			</div>
        
        </form:form>
        
        </div>
    </div>
</div>
</body>
</html>