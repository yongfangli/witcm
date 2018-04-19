<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>商户统计</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/chart/Chart.js"></script>
<script type="text/javascript" src="${ctxStatic}/chart/utils.js"></script>
<style>
 canvas{
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
*{
margin:0;
padding:0;
}   
.num{
  width:600px;
  height:600px;
  padding:20px
}
.num p{
 text-align:center;
  color: #080808;
    font-size: large;
}
</style>
</head>
<body>
<div class="contain" >
<div class="num">
<p>最近${fn:length(visitSum)}个月网站流量统计图</p>
<canvas id="canvas" ></canvas>
</div>
</div>
<script>
       
        var config = {
            type:'bar',
            data: {
                labels: [
<c:forEach items="${visitSum}" var="e">
'${e.month}',
</c:forEach>
                         ],
                datasets: [
<c:forEach items="${visitSum}" var="e">
{
    label: "${e.month}",
    backgroundColor: "#00a000",
    data: [
${e.count}
    ],
},

</c:forEach>     
                           
                          ]
            },
            options: {
                responsive: true,
                title:{
                    display:true,
                    text:''
                },
                legend:{
                	display:false
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: '月份'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: '人次'
                        }
                    }]
                }
            }
        };

        window.onload = function() {
            var ctx = document.getElementById("canvas").getContext("2d");
            window.myLine = new Chart(ctx, config);
        };
   </script>
</body>
</html>