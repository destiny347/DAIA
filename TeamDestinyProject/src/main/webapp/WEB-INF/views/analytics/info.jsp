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
	    	
	    	var str = "";
	    	var list = $("input[name=chkColnames]:checked");
	    	var str2 = "";	    	
	    	
	    	$("#selectCol").show();
	    	$("#col_table > thead > tr > th").remove(); //열 추가 체크시에 기존 선택값들을 지워줘야 중복체크되지 않는다.
	    	$("#col_table > tbody > tr > td").remove();
	    	
	    	  for(var i=0; i<list.length; i++){
	    	    	
	        		str = $(list[i]).next().text();
	            	$("#col_table > thead > tr").append("<th>" + str + "</th>");
	            
	    		}
	    	 
	    	var index = Array();
	    	var chkbox = $(".chkCol");
	    	index.push($("input[name=chkColnames]:checked").index("input[name=chkColnames]"));
			console.log(index);
			
	    	  
    		//체크박스 중 체크된 체크박스만 가져와서 Loop 합니다.
	    	//$("input[name=chkColnames]:checked").each(function(i,elements){
	    		
	    		//index = ($(elements).index("input[name=chkColnames]"));  		 
	    		//console.log(index);
	    		
	    			    		
	    		//for(var k=0; k<5; k++) {
	    			//var list2 = $("#sum_table > tbody > tr:nth-child(1)").nextAll().eq(k).children().eq(index);
	    			//$("#col_table > tbody").append("<tr></tr>")
	    			//console.log(list2.length)
	    	    	
	    			//for(var j=0; j<list2.length; j++) {
	    	    	
	    	    		//str2 = list2.text();
	    	    		
	    	    		//$("#col_table > tbody > tr").append("<td>" + str2 + "</td>")
	    	    	
	    	   // }
	    	    //}
	    	//})
	    })
	    	  
	    		    	
		//초기화버튼 클릭이벤트
		$("#reset").click(function() {
			$("#col_table > thead > tr > th").remove();
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
	 function clickExport() {
	 console.log("test");
	  var titles = [];
	  var data = [];
		var list = $("input[name=chkColnames]:checked");	    	
	    var str = "";
	  /*
	   * Get the table headers, this will be CSV headers
	   * The count of headers will be CSV string separator
	   */
	   
	  
	  $(".col_table > thead > tr:last").each(function() {
	
	   //titles.push($(this).text());
		  for(var i = 0; i < list.length; i++){
      		str = $(list[i]).next().text();
          	$("#col_table > thead > tr:last").append("<th>" + str + "</th>");     
          //	tmp[i] = str;
          	titles.push(str);
          }
	  });

	  /*
	   * Get the actual data, this will contain all the data, in 1 array
	   */
	  $(".col_table tbody>tr:last").each(function() {
	    data.push($(this).text());
	  });
	  
	  /*
	   * Convert our data to CSV string
	   */
	  var CSVString = prepCSVRow(titles, titles.length, '');
	  CSVString = prepCSVRow(data, titles.length, CSVString);

	  /*
	   * Make CSV downloadable
	   */
	  var downloadLink = document.createElement("a");
	  var blob = new Blob(["\ufeff", CSVString]);
	  var url = URL.createObjectURL(blob);
	  downloadLink.href = url;
	  var outputFile = $("#outputFile").val();
	  downloadLink.download = outputFile+".csv";
		console.log(outputFile);
	  /*
	   * Actually download CSV
	   */
	  document.body.appendChild(downloadLink);
	  downloadLink.click();
	  document.body.removeChild(downloadLink);
	  
	  location.href = 'http://localhost:8080/destiny/analytics/handling/'+outputFile +".csv";
	}

	   /*
	* Convert data array to CSV string
	* @param arr {Array} - the actual data
	* @param columnCount {Number} - the amount to split the data into columns
	* @param initial {String} - initial string to append to CSV string
	* return {String} - ready CSV string
	*/
	function prepCSVRow(arr, columnCount, initial) {
	  var row = ""; // this will hold data
	  var delimeter = ","; // data slice separator, in excel it's `;`, in usual CSv it's `,`
	  var newLine = "\r\n"; // newline separator for CSV row

	  /*
	   * Convert [1,2,3,4] into [[1,2], [3,4]] while count is 2
	   * @param _arr {Array} - the actual array to split
	   * @param _count {Number} - the amount to split
	   * return {Array} - splitted array
	   */
	  function splitArray(_arr, _count) {
	    var splitted = [];
	    var result = [];
	    _arr.forEach(function(item, idx) {
	      if ((idx + 1) % _count === 0) {
	        splitted.push(item);
	        result.push(splitted);
	        splitted = [];
	      } else {
	        splitted.push(item);
	      }
	    });
	    return result;
	  }
	  var plainArr = splitArray(arr, columnCount);
	  // don't know how to explain this
	  // you just have to like follow the code
	  // and you understand, it's pretty simple
	  // it converts `['a', 'b', 'c']` to `a,b,c` string
	  plainArr.forEach(function(arrItem) {
	    arrItem.forEach(function(item, idx) {
	      row += item + ((idx + 1) === arrItem.length ? '' : delimeter);
	    });
	    row += newLine;
	  });
	  return initial + row;
	}
	      
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
								<th><input class="chkCol" name="chkColnames"
									type="checkbox">
									<label class="chkCol" for="chkColnames">${colName}</label></th>
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
		<h5>
			데이터 명 : <input type="text" id="dataName">
		</h5>
		<div id ="dvData">
			<table id="col_table" border=1>
				<thead>
					<tr></tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<br> <a href="<c:url value="/analytics/handling"/>">
				<input value="다음" id ="export" type="button"/></a> 
				<a href="/destiny/upload/list">	<input type="reset" value="취소" /></a>
		</div>
	</div>

</body>
</html>