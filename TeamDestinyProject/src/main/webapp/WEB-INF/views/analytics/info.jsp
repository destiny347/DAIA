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
	    	 	
	    	$("#selectCol").show();
	    	$("#col_table > tbody > tr > th").remove(); //열 추가 체크시에 기존 선택값들을 지워줘야 중복체크되지 않는다.
	    		    	
    		for(var i=0; i<list.length; i++){
        		str = $(list[i]).next().text();
            	$("#col_table > tbody > tr:nth-child(1)").append("<th>" + str + "</th>");
            	//$("#col_table > tbody > tr:nth-child(2)").append("<td>" + "ex" + "</td>");
            	//$("#col_table > tbody > tr:nth-child(3)").append("<td>" + "ex" + "</td>");
            	
    		}
	    	    		
	    })
	    
	    //행출력 테스트
	    $("#confirm2").click(function() {
	    	var val = $("tr:nth-child()").
	    	console.log(val);
	    	
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
	
//------------------------------------------------------
	 $(document).ready(function () {
	            console.log("HELLO")
	            function exportTableToCSV($table, filename) {
	                var $headers = $table.find('tr:has(th)')
	                    ,$rows = $table.find('tr:has(td)')
	                    // Temporary delimiter characters unlikely to be typed by keyboard
	                    // This is to avoid accidentally splitting the actual contents
	                    ,tmpColDelim = String.fromCharCode(11) // vertical tab character
	                    ,tmpRowDelim = String.fromCharCode(0) // null character
	                    // actual delimiter characters for CSV format
	                    ,colDelim = '","'
	                    ,rowDelim = '"\r\n"';
	                    // Grab text from table into CSV formatted string
	                    var csv = '"';
	                    csv += formatRows($headers.map(grabRow));
	                    csv += rowDelim;
	                    csv += formatRows($rows.map(grabRow)) + '"';
	                    // Data URI
	                    var csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);
	                $(this)
	                    .attr({
	                    'download': filename
	                        ,'href': csvData
	                        //,'target' : '_blank' //if you want it to open in a new window
	                });
	                //------------------------------------------------------------
	                // Helper Functions 
	                //------------------------------------------------------------
	                // Format the output so it has the appropriate delimiters
	                function formatRows(rows){
	                    return rows.get().join(tmpRowDelim)
	                        .split(tmpRowDelim).join(rowDelim)
	                        .split(tmpColDelim).join(colDelim);
	                }
	                // Grab and format a row from the table
	                function grabRow(i,row){
	                     
	                    var $row = $(row);
	                    //for some reason $cols = $row.find('td') || $row.find('th') won't work...
	                    var $cols = $row.find('td'); 
	                    if(!$cols.length) $cols = $row.find('th');  
	                    return $cols.map(grabCol)
	                                .get().join(tmpColDelim);
	                }
	                // Grab and format a column from the table 
	                function grabCol(j,col){
	                    var $col = $(col),
	                        $text = $col.text();
	                    return $text.replace('"', '""'); // escape double quotes
	                }
	            }
	            // This must be a hyperlink
	            $("#export").click(function (event) {
	                // var outputFile = 'export'
	                var outputFile = window.prompt("What do you want to name your output file (Note: This won't have any effect on Safari)") || 'export';
	                outputFile = outputFile.replace('.csv','') + '.csv'
	                 
	                // CSV
	                exportTableToCSV.apply(this, [$('#dvData>table'), outputFile]);
	                
	                // IF CSV, don't do event.preventDefault() or return false
	                // We actually need this to be a typical hyperlink
	            });
	        });
</script>

<title>Destiny</title>

	

</head>
<body>
	<h1>정보</h1>

		<c:forEach var="j" begin="0" end="${rData.size()-1}">
			
			<div>
				<h3>파일명 : [${fileName.get(j)}]</h3>
			</div>
			<div id="show_col_sum">
				<p>
					<label class="chkColnames" for="checkAll">전체 선택</label><input type="checkbox" class="chkColnames" id="checkAll" />
				</p>
				<input type="button" id="show_all" value="테이블 전체보기">
				<table id="sum_table" border="1">
					<tr>
						<c:forEach var="colName" items="${rData.get(j).colNames}">
							<c:forEach var="colNameValue" items="${colName}">
								<th><input class="chkColnames" id="chkColnames" name="chkColnames"
									type="checkbox">
									<label class="chkColnames" for="chkColnames">${colName}</label></th>
							</c:forEach>
						</c:forEach>
					</tr>
					<c:forEach var="i" begin="0" end="${fn:length(rData.get(j).data[0])-1}">
						<c:if test="${i le 4}">
							<c:set var="row" value="${rData.get(j).data}" />
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
					<c:forEach var="colName" items="${rData.get(j).colNames}">
						<c:forEach var="colNameValue" items="${colName}">
							<th><label for="colnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="0" end="${fn:length(rData.get(j).data[0])-1}">
					<c:if test="${i le 1000}">
						<c:set var="row" value="${rData.get(j).data}" />
						<tr>
							<c:forEach var="data" items="${row}">
								<td>${data[i]}</td>
							</c:forEach>
						</tr>
					</c:if>
				</c:forEach>
	
			</table>
		</div>
	</c:forEach>

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
		<div id ="dvData">
			<table id="col_table" border=1>
				<thead>
					<tr></tr>
				</thead>
				<tbody>
					<tr></tr>
				</tbody>
			</table>
			<br> <a href="<c:url value="/analytics/handling"/>">
				<input value="다음" id ="export" type="button"/></a> 
				<a href="/destiny/upload/list">	<input type="reset" value="취소" /></a>
		</div>
	</div>

</body>
</html>