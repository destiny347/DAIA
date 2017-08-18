<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="../js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	</script>

<title>Destiny</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">


<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

</head>
<script type="text/javascript">
$(document).ready(function() {
	$('#저장').click(function() {	
		var num = /^[0-9]{2}$/; 
		
		if(num.test($('#1').val()) == true && num.test($('#2').val()) == true){
			var tmp = "성공 -> "+ $('#1').val() +" : "+ $('#2').val();
			alert(tmp);
		}
		else{
			alert("두자리 숫자만을 입력해 주세요");
		}
			
		
 	});
	$('#result').click(function() {	
		if (confirm("정말 "+$('input[name=Algorithm]:checked').val()+"를 선택 하시겠습니까?" ) == true){    //확인
		    document.form.submit();
		}else {   //취소
			return false;
		}	
 	}); 		
}); 

</script>
<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div class="container">

	<div>
		<h3>
			데이터 명 : <input type="text" id="dataName" value="${fileName}" readonly>
		</h3>
	</div>
	<br>
	<div>
		<a><b>&nbsp;&nbsp;&nbsp;Training set</b></a>&nbsp;&nbsp;&nbsp;<input
			type="text" id="1" style="width: 30px">&nbsp;&nbsp;:&nbsp;&nbsp;<input
			type="text" id="2" style="width: 30px">&nbsp;&nbsp; <input
			type="button" id="저장" class="btn" style="width: 70px" value="저장">
	</div>
	<br>
	<br>


	<div>
		<label for="inputAlgorithm"><b>&nbsp;&nbsp;&nbsp;&nbsp;알고리즘
				선택</b><br></label>
		<div>
			<br> <label class="radio-inline" for="optionsRadios1"></label>
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Algorithm" id="1"
				value="회귀" checked>&nbsp;Regression / 회귀 <label
				class="radio-inline" for="optionsRadios2"></label> <input
				type="radio" name="Algorithm" id="2" value="분류">&nbsp;Classfication
			/ 분류 <label class="radio-inline" for="optionsRadios3"></label> <input
				type="radio" name="Algorithm" id="3" value="연관">&nbsp;Association
			/ 연관 <label class="radio-inline" for="optionsRadios4"></label> <input
				type="radio" name="Algorithm" id="4" value="군집">&nbsp;Cluster
			Analysis / 군집
		</div>
	</div>
	
	<div class="col-lg-6 col-md-6 col-sm-6">
	<table>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<a href="/destiny/analytics/analysis"><input type="button"
		id="result" value="결과 보기" /></a>
	</div>
	
</div> <!-- End Container -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>