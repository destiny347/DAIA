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
	    //$("#confirm").click(function() {
	    	
			//$("#selectCol").show();			
		//});
	
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

	<form id="select_col">
	<div><h3>파일명 : [${fileName}]</h3></div>
		<div id="checkboxArea">
		<p>전체 선택<input type="checkbox" id="checkAll" /></p>
			<table border="1">
				<tr>
					<c:forEach var="colName" items="${rData.colNames}">						
						<c:forEach var="colNameValue" items="${colName}">
							<th><input id="colnames" name="colnames" type="checkbox" data-toggle="checkbox" value="${colName}">
								<label for="colnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="0" end="${fn:length(rData.data[0])-1}">					
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
		</form>
		<br>	
		
			<input type="submit" id="confirm" name="confirm" form="select_col" value="확인"/>		
			<input type="reset" id="reset" value="초기화" />
			<a href="/myapp/upload/list"><input type="button" value="취소" /></a>
		
		<div id="selectCol">
		<h1>선택한 열 정보</h1>
		<h3>데이터 명 : <input type="text" id="dataName"></h3>
			<div>			
			<table border=1>
				<thead>
					<c:forEach items="${clickChkbox}" var="chkbox" varStatus="status">
						<th>${chkbox}</th>
					</c:forEach>
				</thead>				
			</table>
			<br>
				<a href="<c:url value="/analytics/ML"/>"><input type="submit" value="다음"/></a>
				<a href="/myapp/upload/list"><input type="button" value="취소"/></a>
			</div>
		</div>
	
</body>
</html>