<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

	<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">

	<!-- chart.js 적용시켜보기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

<!-- graph test -->


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
		
		<canvas id="myChart"></canvas>
	
	<script>
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
	</script>
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