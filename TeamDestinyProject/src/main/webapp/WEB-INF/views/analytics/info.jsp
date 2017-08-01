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
 	<link href="../../css/bootstrap.css" rel="stylesheet">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<!-- jQuery -->
	<script src="../../js/jquery.js"></script>
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
	    	var str = "";	    	
	    	
	    	//var rowStr = [];
	    	//var rowList = $("input[name=chkColnames]:checked").parent().parent().parent().children(2).children("td");
	    	//$("#sum_table > tbody > tr:nth-child(2) > td");
	    	
	    	//console.log(rowList);
	    	
	    		    		    	
	    	$("#selectCol").show();	
	    	$("#col_table > thead > tr > th").remove(); //열 추가 체크시에 기존 선택값들을 지워줘야 중복체크되지 않는다.
	    	
    		for(var i = 0; i < list.length; i++){
        		str = $(list[i]).next().text();
            	$("#col_table > thead > tr:last").append("<th>" + str + "</th>");        	
            	
            }	
	    	
	    	//for(var j=0; j<rowList.length; j++) {
	    		
	    	//		rowStr = $(rowList[j]).text();
            //		//console.log(rowStr);
            //		$("#col_table > tbody > tr:last").append("<td>" + rowStr + "</td>");
	    		
	    	//}
	    	
	    	
	    })
	    	
	    	
	    	
		//초기화버튼 클릭이벤트
		$("#reset").click(function() {
			$("#col_table > th").remove();
			$("#selectCol").hide()
		})	
		
		//업로드 테이블 전체 보기
		$("#show_all").click(function() {
			$("#show_col_sum").hide()
			$("#show_col_all").show()
			
			if($("#hide_all").click){
				$("#show_all").show()
			}else {
				$("#show_all").hide()
			}
		})
		
		//업로드 테이블 요약 보기
		$("#hide_all").click(function() {
			$("#show_col_sum").show()
			$("#show_col_all").hide()
			
			if($("#show_all").click){
				$("#hide_all").show()
			}else {
				$("#hide_all").hide()
			}
		})	
		
	});
</script>

<title>Destiny</title>

	

</head>
<body>
	<h1>정보</h1>
	<!-- 
${rData}<p>
${rData.colNames}<p>
${rData.data}<p>
-->


	<div>
		<h3>파일명 : [${fileName}]</h3>
	</div>
	<div id="show_col_sum">
		<p>
			<label class="chkColnames" for="checkAll">전체 선택</label><input type="checkbox" class="chkColnames" id="checkAll" />
		</p>
		<input type="button" id="show_all" value="테이블 전체보기">
		<table id="sum_table" border="1">
			<tr>
				<c:forEach var="colName" items="${rData.colNames}">
					<c:forEach var="colNameValue" items="${colName}">
						<th><input class="chkColnames" id="chkColnames" name="chkColnames"
							type="checkbox">
							<label class="chkColnames" for="chkColnames">${colName}</label></th>
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


	<div id="show_col_all" style="display: none">

		<input type="button" id="hide_all" value="테이블 요약보기(5행)">
		<table border="1">
			<tr>
				<c:forEach var="colName" items="${rData.colNames}">
					<c:forEach var="colNameValue" items="${colName}">
						<th><label for="colnames">${colName}</label></th>
					</c:forEach>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="0" end="${fn:length(rData.data[0])-1}">
				<c:if test="${i le 1000}">
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

	<input class="btn" type="button" id="confirm" name="confirm" value="확인" />
	<input class="btn" type="reset" id="reset" value="초기화" />
	<a href="/destiny/upload/list"><input class="btn" type="button"
		value="취소" /></a>

	<div id="selectCol" style="display: none">
		<h1>선택한 열 정보</h1>
		<h3>
			데이터 명 : <input type="text" id="dataName">
		</h3>
		<div>
			<table id="col_table" border=1>
				<thead>
					<tr></tr>
				</thead>
				<tbody>
					<tr></tr>
				</tbody>
			</table>
			<br> <a href="<c:url value="/analytics/handling"/>"><input
				type="submit" value="다음" /></a> <a href="/destiny/upload/list"><input
				type="button" value="취소" /></a>
		</div>
	</div>

</body>
</html>