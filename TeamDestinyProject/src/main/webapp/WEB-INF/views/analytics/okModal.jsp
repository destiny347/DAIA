<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">

<!-- Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
   rel="stylesheet" type="text/css">

<!-- jQuery -->
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

</head>
<script type="text/javascript">

$(document).ready(function() {
	$('#export').click(function() {

	var outputFile2 = {
		 fileName : $('#dataName').val(),
		 id : $('#dataID').val()
	 } 
	 location.href = 'http://localhost:8080/destiny/analytics/handling/'+$('#dataID').val();
	
	$.ajax({
	   url : 'http://localhost:8080/destiny/analytics/handling/'+ $('#dataID').val(),
	   dataType : 'json',
	   data :JSON.stringify(outputFile2),
	   contentType : 'application/json;charset=UTF-8',
	   type: 'post',
	   success: function(data) {
	       alert("성공:"+data.KEY);
	       //jsp 파일로 저장을하고 
	       console.log(blob);
	   }
	});
});
});
</script>
<body>
	데이터 명 : <input type="text" id="dataName" value="${name}" readonly>
	데이터 Id : <input type="text" id="dataID" value="${id}" readonly>
	<input value="다음" id="export" type="button" />
</body>
</html>