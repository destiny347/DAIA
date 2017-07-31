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
	
<title>Destiny</title>

 	<!-- Bootstrap Core CSS -->
 	<link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

</head>
<body>
<div>
<h3>데이터 명 : <input type="text" id="dataName" readonly></h3>
테스트~
</div><br>
<div>
	<a><b>&nbsp;&nbsp;&nbsp;Training set</b></a>&nbsp;&nbsp;&nbsp;<input type="text" id="" style="width:30px">&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text" id="" style="width:30px">&nbsp;&nbsp;
	<input type="button" id="" class="btn" style="width:70px" value="저장">
</div>
<br><br>


			<div>  				
  				<label for="inputAlgorithm"><b>&nbsp;&nbsp;&nbsp;&nbsp;알고리즘 선택</b><br></label>
    				<div><br>					
    					<label class="radio-inline">
    		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="regression" id="optionsRadios" value="회귀" checked>&nbsp;Regression / 회귀
   						</label>
   						<label class="radio-inline">
   							<input type="radio" name="classification" id="optionsRadios" value="분류">&nbsp;Classfication / 분류
					 	</label>
					 	<label class="radio-inline">
   							<input type="radio" name="association" id="optionsRadios" value="연관">&nbsp;Association / 연관
					 	</label>	
					 	<label class="radio-inline">
   							<input type="radio" name="cluster" id="optionsRadios" value="군집">&nbsp;Cluster Analysis / 군집
					 	</label>				
  					</div>  				
			</div>

</body>
</html>