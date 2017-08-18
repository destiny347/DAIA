<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

	$("#show_all2").click(function() {				 
		$("#result_table").show();	 
	})
	$("#table").click(function() {				 
		$("#ddtable").show();	 
	})

		$('#export').click(function() {
			
		 var request = {param : $('#dataName').val()};
		
		 $.ajax({
		   url : '/test',
		   dataType : 'json',
		   data :JSON.stringify(request),
		   contentType : 'application/json;charset=UTF-8',
		   type: 'post',
		   success: function(data) {
		       alert("성공:"+data.KEY);
		       //jsp 파일로 저장을하고 
		       console.log(blob);
		   }

	 	});
		 
		
	}); 


})
</script>
</head>
<body>
	<!-- 
${rData}<p>
${rData.colNames}<p>
${rData.data}<p>
-->

<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
	<form id="select_col">		
		<div class="container">
			<!-- Trigger the modal with a button -->
			

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">File List</h4>
						</div>
						<div class="modal-body">
							<table border="1">
								<tr>
									<th>ID</th>
									<td>경로</td>
									<td>파일명</td>
									<td>크기</td>
									<td>유형</td>
									<td>날짜</td>
									<td>삭제</td>
									<td style="display: none">순서</td>
									<td style="display: none">사용자 id</td>
								</tr>
								<c:forEach var="file" items="${fileList}">
									<tr>
										<td><input type="checkbox" name="fileId"
											id="${file.fileName}" value="${file.fileId}">${file.fileId}</td>
										<td>${file.directoryName}</td>
										<td><c:set var="len" value="${fn:length(file.fileName)}" />
											<c:set var="filetype"
												value="${fn:toUpperCase(fn:substring(file.fileName, len-4, len))}" />
											<c:if
												test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												<img src='<c:url value="/img/${file.fileId}"/>' width="100"
													class="img-thumbnail">
												<br>
											</c:if> <c:if
												test="${!((filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF'))}">
												<a href='<c:url value="/pds/${file.fileId}"/>'>${file.fileName}</a>
												<br>
											</c:if></td>
										<td><fmt:formatNumber value="${file.fileSize/1024}"
												pattern="#,###" />KB</td>
										<td>${file.fileContentType}</td>
										<td>${file.fileUploadDate}</td>
										<td style="display: none">${file.flowNum}</td>

										<td><a
											href='<c:url value="/upload/delete/${file.fileId}"/>'
											class="delete">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="modal-footer">
							<input type="button"  id = "table" class="btn btn-default"
								data-dismiss="modal" value ="확인">
								<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>
			</div>

		</div>

		<div class="col-lg-12 col-md-12 col-sm-12">
			<h1>선택한 열 정보</h1>
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal">파일 목록</button>
			<a href =  "http://localhost:8080/destiny/analytics/restructuring"><input type="button" class="btn btn-info btn-lg" value ="취소"
				></a>
			<h3>
				데이터 명 : <input type="text" id="dataName" value="${fileName}"
					readonly>
			</h3>
		<div style="overflow-x: auto;">
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
					<c:forEach var="i" begin="0" end="${fn:length(list.data[0])}">
						<c:if test="${i le 5}">
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
			<div id="ddtable" style="display: none; oveflow-x: auto;">
			<h3>
				데이터 명 : <input type="text" id="dataName" value="${dd}"
					readonly>
			</h3>
			<table id="ddtable" border="1">
				<thead>
					<tr>
						<c:forEach var="colName" items="${tmp.colNames}">
							<c:forEach var="colNameValue" items="${colName}">
								<th><input class="chkCol" name="chkColnames"
									type="checkbox"> <label class="chkCol"
									for="chkColnames">${colName}</label></th>
							</c:forEach>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="${fn:length(tmp.data[0])}">
						<c:if test="${i le 5}">
							<c:set var="row" value="${tmp.data}" />
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
			</div>
		</div>
	</form>

	<!-- 재구조화 열 저장 버튼 -->
	<div>
		<input type="button" id="show_all2" value="save" /> <input
			type="reset" id="reset" value="reset" />
	</div>

	<!-- 재구조화 타입 설정 및 테이블 출력 -->
	<div>
		<input type="button" id="export" value="melt" /> <input type="submit"
			id="cast" value="cast" /> <input type="submit" id="split"
			value="split" />
	</div>

	<div>
		<h3>재구조화 데이터 테이블</h3>
		<div style="overflow-x: auto;">
		<table id="result_table" border="1" style="display: none">
			<thead>
				<tr>
					<c:forEach var="colName" items="${result.colNames}">
						<c:forEach var="colNameValue" items="${colName}">
							<th><input class="chkCol" name="chkColnames" type="checkbox">
								<label class="chkCol" for="chkColnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="0" end="${fn:length(list.data[0])}">
					<c:if test="${i le 5}">
						<c:set var="row" value="${result.data}" />
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
	</div>

	<!-- 테이블 조인 & 리셋 -->

	<div>
		<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><a href="/destiny/analytics/ML"><input type="button"
						value="분석 단계로" /></a> <a href="/destiny/analytics/visual"><input
						type="button" value="시각화 단계로" /></a></td>
			</tr>
		</table>
	</div>
	
</div> <!-- End Container -->	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>