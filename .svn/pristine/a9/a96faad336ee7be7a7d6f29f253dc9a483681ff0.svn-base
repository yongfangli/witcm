<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	/* 长宽占位 rem算法, 根据root的rem来计算各元素相对rem, 默认html 320/20 = 16px */
	 function placeholderPic(){
	 	var w = document.documentElement.offsetWidth;
	 	document.documentElement.style.fontSize=w/100+'px';
	 }
	 placeholderPic();
	 window.onresize=function(){
	 	placeholderPic();
	 };
	 
	 //天气获取
	 /**
	 window.onload=function(){
		 var inter;
	   var storage=window.localStorage;
	    //取缓存
	    if(storage.getItem('weather')){
	    	var weather=JSON.parse(storage.getItem('weather'));
	    	//天气数据时间校验
	    	var store_date=Date.parse(weather.saveTime);
	    	var time=new Date().getTime()-store_date;
	    	//判断小时数
	    	var leave1=time%(24*3600*1000);
	    	var hours=Math.floor(leave1/(3600*1000));

	    	//一小时刷新一次数据可能会碰到数据不准的时候，这个以后再优化
	    	if(hours<=1){
	    		var content=weather.date.split(" ");
		    	var week=content[0];
		    	var date=new Date();
		    	var date_info=date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate();
		    	var time_info=date.getHours()+":"+date.getMinutes().length==1?"0"+date.getMinutes():date.getMinutes();
		    	 clearInterval(inter);
		    	function showTime(){
		    		date=new Date();
		    		var min=date.getMinutes();
			    	min= min.toString();
			    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
		    		$("#time").empty().html(time_info);
		    	}
		    	inter=setInterval(showTime,60*1000);
		    	var min=date.getMinutes();
		    	min= min.toString();
		    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
		    	$("#temp").empty().html(weather.temperature);
		    	$("#weather").empty().html(weather.weather);
		    	$("#date").empty().html(date_info);
		    	$("#week").empty().html(week);
		    	$("#city").empty().html(weather.city);
		    	$("#time").empty().html(time_info);
		     }else{
		    	 var url="http://api.jirengu.com/weather.php";
				  $.get(url,function(data){
				   if(data){
				   var json=eval("("+data+")");
				   if(json.status== 'success'){
				     var weather=json.results[0].weather_data[0];
				     var city=json.results[0].currentCity;
				    	 weather.saveTime=new Date();
				    	 weather.city=city;
				        storage.setItem('weather',JSON.stringify(weather));
				       
				     var content=weather.date.split(" ");
				    	var week=content[0];
				    	var date=new Date();
				    	var date_info=date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate();
				    	var min=date.getMinutes();
				    	min= min.toString();
				    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
				    	 clearInterval(inter);
				    	function showTime(){
				    		date=new Date();
				    		var min=date.getMinutes();
					    	min= min.toString();
					    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
				    		$("#time").empty().html(time_info);
				    	}
				    	inter=setInterval(showTime,60*1000);
				    	var min=date.getMinutes();
				    	min= min.toString();
				    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
				    	$("#temp").empty().html(weather.temperature);
				    	$("#weather").empty().html(weather.weather);
				    	$("#date").empty().html(date_info);
				    	$("#week").empty().html(week);
				    	$("#city").empty().html(weather.city);
				    	$("#time").empty().html(time_info);
	                 }
				   }
				});
		     }
	    }else{
		 var url="http://api.jirengu.com/weather.php";
		  $.get(url,function(data){
		   if(data){
		   var json=eval("("+data+")");
		   if(json.status== 'success'){
		     var weather=json.results[0].weather_data[0];
		     var city=json.results[0].currentCity;
		    	 weather.saveTime=new Date();
		    	 weather.city=city;
		        storage.setItem('weather',JSON.stringify(weather));
		     var content=weather.date.split(" ");
		    	var week=content[0];
		    	var date=new Date();
		    	var date_info=date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate();
		    	var min=date.getMinutes();
		    	min= min.toString();
		    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
		    	 clearInterval(inter);
		    	function showTime(){
		    		date=new Date();
		    		var min=date.getMinutes();
			    	min= min.toString();
			    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
		    		$("#time").empty().html(time_info);
		    	}
		    	inter=setInterval(showTime,60*1000);
		    	var min=date.getMinutes();
		    	min= min.toString();
		    	var time_info=date.getHours()+":"+(min.length==1?("0"+date.getMinutes().toString()):date.getMinutes());
		    	$("#temp").empty().html(weather.temperature);
		    	$("#weather").empty().html(weather.weather);
		    	$("#date").empty().html(date_info);
		    	$("#week").empty().html(week);
		    	$("#city").empty().html(weather.city);
		    	$("#time").empty().html(time_info);
		     }
		   }
		});
	    }};
	    **/
	    
	</script>