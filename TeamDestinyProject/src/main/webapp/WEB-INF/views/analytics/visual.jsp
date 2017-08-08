<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- jQuery -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">

<!-- 그냥 하이차트로 행복하기 -->
<script src="https://code.highcharts.com/highcharts.js" defer></script>
<script src="https://code.highcharts.com/modules/exporting.js" defer></script>


<!-- 밍구차트 -->
<script type="text/javascript">
$(function() {

	Highcharts.chart('bar', {
	    chart: {
	    	type : 'bar'
	    },
	    colors: ['#ff357f', '#ff8cb6', '#b97bec', '#6642d1', '#8085e9', 
	    	   '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
		
		<!-- 표제목 -->
	    title: {
	        text: 'bar는 ChocoBar'
	    },
	    
	    <!-- x축 -->
	    xAxis: {
	        categories: ["setosa", "versicolor", "virginica"],
	    },
	    
    series: <%=request.getAttribute("irisData")%>,
	});
});
</script>

<script type="text/javascript">
$(function() {
	Highcharts.chart('pie', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    
	    colors: ['#ff357f', '#ff8cb6', '#b97bec', '#6642d1', '#8085e9', 
	    	   '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
	    
	    title: {
	        text: 'pie는 ApplePie'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true
	            },
	            showInLegend: true
	        }
	    },
        series: [{name: 'HanHwa',
        		colorByPoint : true,
        		data :<%=request.getAttribute("gcv")%>
        }]
});
});
</script>

<script>
$(function() {
Highcharts.chart('line', {

    title: {
        text: 'Line is a Line'
    },
    colors: ['#ff357f', '#ff8cb6', '#b97bec', '#6642d1', '#8085e9', 
 	   '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],    
    subtitle: {
        text: ''
    },

    yAxis: {
        title: {
            text: 'Number of Employees'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            pointStart: 2010
        }
    },

    series: [{
        name: 'Installation',
        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }, {
        name: 'Manufacturing',
        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
    }, {
        name: 'Sales & Distribution',
        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
    }, {
        name: 'Project Development',
        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    }, {
        name: 'Other',
        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
    }]

});
});
</script>

<title>visual</title>
</head>
<body>

	<!-- 시각화하려는 변수를 선택하는 부분 -->

	<div class="col-sm-12">
		<h3>
			변수 선택 : <input type="text" id="dataName" readonly>
		</h3>

	</div>
	<br>

	<!-- 시각화하려는 변수를 선택하는 부분 -->

	<div class="col-sm-12">
		종속 변수 선택 : <input type="text" id="dataName"><br> 종속 변수 선택
		: <input type="text" id="dataName"><br> 독립 변수 선택 : <input
			type="text" id="dataName"><br>
	</div>
	<br>

	<!-- 그래프 타입 선택 -->

	<div class="col-sm-12">
		<h3>그래프 타입 선택</h3>
		<input type="checkbox" id=""> 막대 그래프 <br> <input
			type="checkbox" id=""> 파이 그래프 <br> <input
			type="checkbox" id=""> 선 그래프 <br>
		<br> <input type="button" id="" value="적용"><br>
	</div>
	<br>

	<!-- 그래프 표시부  -->

	<div class="col-sm-12" style="margin-top: 5px">
		<h3>그래프 표시부</h3>

		<br>
		<div class="col-sm-4"
			style="border-style: solid; border-width: 1px; border-color: pink">
			<div id="bar"></div>
		</div>
		<div class="col-sm-4"
			style="border-style: solid; border-width: 1px; border-color: pink">
			<div id="pie"></div>
		</div>
		<div class="col-sm-4"
			style="border-style: solid; border-width: 1px; border-color: pink">
			<div id="line"></div>
		</div>
	</div>
	<!-- 저장/리셋 -->
	<div class="col-sm-12" align="center">
		<input type="submit" value="SAVE"> <input type="reset"
			value="RESET">
	</div>

	<br>
	<div class="col-sm-12" align="right">
		<a href="/destiny/analytics/ML"><input type="button"
			value="다음 단계로" /></a>
	</div>


</body>
</html>
