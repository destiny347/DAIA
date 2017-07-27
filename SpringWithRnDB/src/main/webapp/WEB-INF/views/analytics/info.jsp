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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"">
	</script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//체크박스 전체 선택/해제
		$("#checkAll").click(function(){
	        //클릭되었으면
	        if($("#checkAll").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=colnames]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=colnames]").prop("checked",false);
	        }
	    })
	
	    //체크박스 값 테이블 열 생성
	    $("#complete").click(function() {
			var chk = $("input:checked");
			var result = "";

			$('#selectTable > tr:last').remove();		
			
			for (var i = 0; i < chk.length; i++) {
				result = $(chk[i]).next().text();
				$("#selectTable").append("<th>"+ result + "</th>")				
			}
			$("#selectCol").show();
			
		});
		
		//초기화버튼 클릭이벤트
		$("#reset").click(function() {
			$("#selectCol").hide()
		})
		
	});
</script>

<title>CoderBy</title>

</head>
<body>
	<h1>정보</h1>
	<!-- 
${rData}<p>
${rData.colNames}<p>
${rData.data}<p>
-->

	<form name="f">
		<div id="checkboxArea">
		<p>전체 선택<input type="checkbox" id="checkAll" /></p>
			<table border="1">
				<tr>
					<c:forEach var="colName" items="${rData.colNames}">
						<!-- 열의 이름들을 반복문으로 하나씩 출력 -->
						<c:forEach var="colNameValue" items="${colName}">
							<th><input id="colnames" name="colnames" type="checkbox"
								value="${colName}"><label
								for="colnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="0" end="${fn:length(rData.data[0])-1}">
					<!-- R데이터에 담긴 데이터를 0번째부터 행의 길이만큼 반복 출력 -->
					<c:if test="${i le 4}">
						<c:set var="row" value="${rData.data}" />
						<tr>
							<c:forEach var="data" items="${row}">
								<td>${data[i]}</td>
							</c:forEach>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<br>
		<div id="buttonGroups">			
			<input type="button" id="complete" value="완료" />
			<input type="reset" id="reset" value="초기화" />
		</div>


		<div id="selectCol" style="display: none">
		<h1>선택한 열 정보</h1>
		<h3>데이터 명 : <input type="text"></h3>
		<div>
			<table id="selectTable" border="1">
				<tr></tr>
			</table>
		</div>
		</div>
	</form>
</body>
</html>