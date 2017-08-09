<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap Core CSS -->

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">

<!-- jQuery -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script type="text/javascript">
$(document).ready(function() {      
	var request = {param : '소모품'};

	$.ajax({
	    url : 'http://localhost:8080/destiny/analytics/handling/data_cust.csv',
	    dataType : 'json',
	    data : JSON.stringify(request),
	    contentType : 'application/json;charset=UTF-8',
	    type: 'POST',
	    success: function(data) {
	        alert("성공:"+data.KEY);
	    },
	    error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"error:"+error);
	    }
	 
	}); 
});
</script>
<style>
.radiobutton {
	height: 150px;
}

footer {
	clear: both;
}
</style>

<title>Destiny</title>

</head>
<body>
	<div class="col-lg-12 col-md-12 col-sm-12">
		<h1>선택한 열 정보</h1>
		<h3>
			데이터 명 : <input type="text" id="dataName" value="${fileName}" readonly>
		</h3>
		<table id="sum_table" border="1">
				<thead>
					<tr>
						<c:forEach var="colName" items="${list.colNames}">
							<c:forEach var="colNameValue" items="${colName}">
								<th><input class="chkCol" name="chkColnames"
									type="checkbox"> <label class="chkCol"
									for="chkColnames">${colName}</label></th>
							</c:forEach>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0"
						end="${fn:length(list.data[0])}">
						<c:if test="${i le 300}">
							<c:set var="row" value="${list.data}" />
							<tr>
								<c:forEach var="data" items="${row}">
									<td>${data[i]}</td>
								</c:forEach>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	<div class="col-lg-3 col-md-6 col-sm-6">
		<h3>결측치</h3>
		<table class="radiobutton">
			<tr>
				<td><input type="radio" name="handling1" value="NaN">NaN</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input type="radio" name="handling1" value="Null">Null</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		<table align=right>
			<tr>
				<td><a href=""><input type="submit" value="변환" /></a></td>
				<td>&nbsp;</td>
				<td><a href="/destiny/upload/list"><input type="button"
						value="취소" /></a></td>
			</tr>
		</table>
	</div>

	<div class="col-lg-3 col-md-6 col-sm-6">
		<h3>이상치</h3>
		<table class="radiobutton">
			<tr>
				<td><input type="radio" name="handling2" value="Min">Min</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input type="radio" name="handling2" value="Max">Max</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input type="radio" name="handling2" value="Min">Avg</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><input type="radio" name="handling2" value="Max">기타 : <input
					type="text"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		<table align=right>
			<tr>
				<td><a href=""><input type="submit" value="변환" /></a></td>
				<td>&nbsp;</td>
				<td><a href="/destiny/upload/list"><input type="button"
						value="취소" /></a></td>
			</tr>
		</table>
	</div>
</body>
<footer class="col-lg-6 col-md-6 col-sm-6" align=right>
	<table>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<a href="/destiny/analytics/restructuring"><input type="button"
		value="다음 단계로" /></a>
</footer>
</html>