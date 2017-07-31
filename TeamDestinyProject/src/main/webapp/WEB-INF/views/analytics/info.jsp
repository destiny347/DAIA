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
	            $("input[name=chkColnames]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chkColnames]").prop("checked",false);
	        }
	    })
	   
	  	
	    //체크박스 값 테이블 열 생성
	    $("#confirm").click(function() {
	    	var list = $("input[name=chkColnames]:checked");
	    	var result = "";
	    	$("#selectCol").show();	
	    	$("#col_table > th").remove(); //열 추가 체크시에 기존 선택값들을 지워줘야 중복체크되지 않는다.
	    	
    		for(var i = 0; i < list.length; i++){
        		result = $(list[i]).next().text(); 
            	$("#col_table").append("<th>" + result +"</th>");
        		}	    	
    		});	    
	    	
		//초기화버튼 클릭이벤트
		$("#reset").click(function() {
			$("#col_table > th").remove();
			$("#selectCol").hide()
		})		
	});
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
							<th><input id="chkColnames" name="chkColnames" type="checkbox" data-toggle="checkbox" value="${colName}">
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
		
			<input class="btn" type="button" id="confirm" name="confirm" value="확인"/>		
			<input class="btn" type="reset" id="reset" value="초기화" />
			<a href="/destiny/upload/list"><input class="btn" type="button" value="취소" /></a>
		
		<div id="selectCol" style="display:none">
		<h1>선택한 열 정보</h1>
		<h3>데이터 명 : <input type="text" id="dataName"></h3>
			<div>			
			<table id="col_table" border=1>
				<tr></tr>			
			</table>
			<br>
				<a href="<c:url value="/analytics/handling"/>"><input type="submit" value="다음"/></a>
				<a href="/destiny/upload/list"><input type="button" value="취소"/></a>
			</div>
		</div>
	
</body>
</html>