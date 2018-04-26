<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<style>
.h_login{
    /*width: 3.5vw;*/
    /*height: 3.5vh;*/
	width:50px;
	height:34px;
	line-height:34px;
    background: #fff;
    border: 1px;
    font-size:16px;
    color: #000;
    border-radius: 0.5em;
    /*margin-right: 1%;*/
}
</style>

<div class="top">
     <div class="conLe"> 
       <img src="${ctxStaticTheme}/images/logo.png" class="logo"/>
       <span class="top_title" onclick="window.location.href='${ctx}/itv'" tabindex="-1">井冈山智慧社区</span>
     </div>
     <div class="conRi"> 
		
	    <c:if test="${not empty itvuser}">
	    	<a id="itvUserName" href="${ctx}/itv/userMenu" class="head_focus">
	    		<font style="color: #fff;">${itvuser.name }</font>
	    	</a>
	    </c:if>
	    <c:if test="${empty itvuser}">
	    	<input type="button" value="登录" tabindex="99" class="h_login head_focus" onclick="window.location.href='${ctx}/itv/userMenu'">
	    	<a href="${ctx}/itv/userMenu" tabindex="100" class="head_focus">
       			<img src="${ctxStaticItv}/images/login.png" class="loginimg"/>
       		</a>
	    </c:if>
	    <span class="border"></span>
	    <span id="city" class="content"></span>
		 <span id="weather" class="content"></span>
		 <span id="temp" class="content"></span>
	    <%--  <img src="${ctxStaticItv}/images/sunlignt.png" class="loginimg" style="margin-left:0.6vw;"/>  --%>
	    <span class="border"></span>

	    <span id="date" class="content"></span>
	    <span id="week" class="content"></span>
	    <span class="border"></span>
	    <span id="time" class="times"></span>

     </div>
</div>

<script>
    // 获取城市
    var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
    $.getScript(
        cityUrl,
        function() {
            var city = remote_ip_info.city; // 获取城市

            // 获取天气预报
            $.ajax({
                url: "http://api.map.baidu.com/telematics/v3/weather?location=" + city + "&output=json&ak=EGgzZ22dsboWQEcPQ6KDQLknQd3YkkkP",
                type: "get",
                dataType: "jsonp",
                scriptCharset: "gbk",
                success: function(baiduTQ) {
                    try {
                        if (baiduTQ == null || baiduTQ.error != 0 || baiduTQ.status != "success" || baiduTQ.results.count == 0) {
                            document.getElementById("city").innerHTML = "--";
                            document.getElementById("weather").innerHTML = "--";
                            document.getElementById("temp").innerHTML = "--";
                            return;
                        }
                        if (baiduTQ.results[0].weather_data.length > 0) {
                            var data = baiduTQ.results[0].weather_data[0];
                            var split = data.date.split("：");
                            document.getElementById("city").innerHTML = city ;
                            document.getElementById("weather").innerHTML = data.weather;
                            var curTemp = split.pop();
                            document.getElementById("temp").innerHTML = curTemp.substring(0, curTemp.length - 1);
                            //
                            // var imgPath = data.dayPictureUrl;
                            // document.getElementById("cvsToday").src = imgPath;
                        }
                    } catch (err) {
                        alert(err)
                    }
                }
            });
        });


    <%--获取动态时间--%>
	var times = new Date();
	var _y = times.getFullYear();
	var _m = times.getMonth()+1;
	var _d = times.getDate();
	var _wD = times.getDay();//星期
	var _hou =times.getHours();
	var _min = times.getMinutes();

	$("#date").html(_y +'.'+ _m +'.'+ _d);
	$("#time").html(addZero(_hou) +':'+ addZero(_min) );

    weekD(_wD);
    function addZero(obj){
        return obj < 10 ? '0'+ obj : obj;
    }
    function weekD(d){
        switch (d)
        {
            case 0:
                $("#week").html("星期天");
                break;
			case 1:
                $("#week").html("星期一");
                break;
            case 2:
                $("#week").html("星期二");
                break;
            case 3:
                $("#week").html("星期三");
                break;
            case 4:
                $("#week").html("星期四");
                break;
            case 5:
                $("#week").html("星期五");
                break;
            case 6:
                $("#week").html("星期六");
                break;
        }
	}


</script>
