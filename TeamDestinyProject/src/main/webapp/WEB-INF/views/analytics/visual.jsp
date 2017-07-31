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

	<!-- 그래프 표시부 -->

		<h3>그래프 표시부</h3>
		<div class="graph_type">
		<div class="col-sm-3" style="background-color:lavender;">
		이 곳에 그래프가 위치합니다 <br>
		<br>
	 	<br>
		<br>
		<br>
		</div>
		</div>
		
	<div class="col-sm-8"></div>
	<div class="col-sm-4">
	<br>
	<input type="submit" value="SAVE">	<input type="reset" value="RESET">
</div>
</body>
</html>