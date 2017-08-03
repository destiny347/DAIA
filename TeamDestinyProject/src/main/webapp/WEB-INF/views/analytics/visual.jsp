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

	Highcharts.chart('container', {
	    chart: {
	    	type : 'bar'
	    },
	    colors: ['#ff357f', '#ff8cb6', '#edc57d', '#f7a35c', '#8085e9', 
	    	   '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
		
		<!-- 표제목 -->
	    title: {
	        text: ''
	    },
	    
	    <!-- x축 -->
	    xAxis: {
	        categories: ["setosa", "versicolor", "virginica"],
	    },
	    
	    labels: {
	        items: [{
	            html: '',
	            style: {
	                left: '150px',
	                top: '18px',
	                color: (Highcharts.theme && Highcharts.theme.textColor) || 'orange'
	            }
	        }]
	    },
	    series: <%= request.getAttribute("irisData") %>,
	});
});
</script>

<script type="text/javascript">
$(function() {

	Highcharts.chart('pie', {
	    chart: {
	    	type : 'pie'
	    },
	    colors: ['#ff357f', '#ff8cb6', '#edc57d', '#f7a35c', '#8085e9', 
	    	   '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
		
		<!-- 표제목 -->
	    title: {
	        text: ''
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    
	    <!-- x축 -->
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                style: {
	                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                }
	            }
	        }
	    },
	    series: <%= request.getAttribute("getsiu") %>,
	});
});
</script>

<title>visual</title>
</head>
<body>

<!-- 시각화하려는 변수를 선택하는 부분 -->

	<div>
		<h3>
			변수 선택 : <input type="text" id="dataName" readonly>
		</h3>

	</div>
	<br>
	
	<!-- 시각화하려는 변수를 선택하는 부분 -->
	
	<div>
		종속 변수 선택 : <input type="text" id="dataName"><br> 
		독립 변수 선택 : <input type="text" id="dataName"><br>
	</div>
	<br>
	
	<!-- 그래프 타입 선택 -->
	
		<div class="col-sm-6">
		<h3>그래프 타입 선택</h3>
		<input type="checkbox" id=""> 막대 그래프 <br> 
		<input type="checkbox" id=""> 파이 그래프 <br> 
		<input type="checkbox" id=""> 선 그래프 <br><br> 
		<input type="button" id="" value="적용">
		</div>

	<!-- 그래프 표시부  -->

		<h3>그래프 표시부</h3>
		<div class="graph_type">
		<div class="col-sm-6">

		<div id="pie"></div>
		<p>
		<button id="randomizeData">Randomize Data</button>
    	<button id="addDataset">Add Dataset</button>
    	<button id="removeDataset">Remove Dataset</button>
		</p>
		</div>
		</div>

	<!-- 저장/리셋 -->
	<div class="col-sm-8"></div>
	<div class="col-sm-4">
	<br>
	<input type="submit" value="SAVE">	<input type="reset" value="RESET">
</div>

	<div>
		<table>
			<tr><td>&nbsp;</td></tr>
			<tr><td>
			<a href="/destiny/analytics/ML"><input type="button" value="다음 단계로"/></a>
			</td></tr>
		</table>
	</div>
</body>
</html>
