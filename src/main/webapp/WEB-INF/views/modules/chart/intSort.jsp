<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户积分统计</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/chart/Chart.js"></script>
<script type="text/javascript" src="${ctxStatic}/chart/utils.js"></script>

    	  <style>
    canvas{
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    .contain{
        display: flex;
        justify-content:space-around;
        
    }
    .bus{
    margin:0;
    list-style-type:none;
    }
    .chart{
    width:500px;
    height:500px;
    }
    .bus li{
        color: orange;
    margin-top:20px;
    }
    .sort{
        padding: 20px;
    }
    .sort label{
        font-size: large;
        color: #080808;
    }
    .chart{
      padding: 20px;
    }
    .chart label{
        font-size: large;
        color: #080808;
    }
    </style>
</head>
<body>
<div class="contain" >
<div class="sort">
<label>居民积分排名前${top}</label>
<ul class="bus">
<c:forEach items="${residents}" var="b" varStatus='status'>
<li><span>${status.index+1}</span>&nbsp;${b.name}&nbsp;&nbsp;<span style="color:#468e11">${b.usablePoints==null?0:b.usablePoints}</span></li>
</c:forEach>

</ul>
</div>
<div class="chart">
<label></label>
<canvas id="chart-area" width="400" height="400"></canvas> 

<script>
    

    var config = {
        type: '${config.type}',
        data: {
            datasets: [{
                data: [
<c:forEach items="${config.datasets}" var="e">
 <c:forEach items="${e.data}" var="d">${d},
 </c:forEach>
</c:forEach>
                ],
                backgroundColor: [
<c:forEach items="${config.datasets}" var="e">
<c:forEach items="${e.colorList}" var="d">'${d}',
</c:forEach>
</c:forEach>
                ],
                label: ''
            }],
            labels: [
<c:forEach items="${config.labels}" var="d">'${d}',
</c:forEach>
            ]
        },
        options: {
            responsive: true
        }
    };

    window.onload = function() {
        var ctx = document.getElementById("chart-area").getContext("2d");
        window.myPie = new Chart(ctx, config);
    };
    </script>
</div>
</div>
</body>
</html>