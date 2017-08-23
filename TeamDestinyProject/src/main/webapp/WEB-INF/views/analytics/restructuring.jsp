<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>DAIA Platform</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<style type="text/css">
html, body{
position:static;
margin:0;
padding:0;
height:100%;
}
body {
	display: flex;
	flex-flow: column;
	min-height: 100vh;
}
main {
	flex: 1;
}
footer{
    position:relative;
    bottom:0;
    width:100%;
}
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.nt100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 100;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nt400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 400;
}
.nt500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 500;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 700;
}
.nt900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 900;
}
.blank{
margin-top:5px;
margin-bottom:5px;
}
.blank1{
margin-top:10px;
margin-bottom:10px;
}
th {
padding: 5px !important;
}
html{
margin:0;
padding:0;
height:100%;
}
footer{
    position:relative;
    margin-bottom: 0px;
    width:100%;
}
</style>
</head>


<body>
<main>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container" style="font-family:'Noto Sans KR', sans-serif; font-weight:400; color: #1e1e1e;">
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

      

         <div style="border-bottom: 1px solid #1e1e1e; width:80%">
         <h3>선택한 열 정보</h3>
         </div>
         
         <div class="blank">&nbsp;</div>
         
         <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" style="width: auto; height: 35px; font-size: 15px;">파일 목록</button>
         <a href = "/destiny/analytics/restructuring"><input type="button" class="btn btn-default" value ="취소" style="width: auto; height: 35px; font-size: 15px;"></a>
         
         <div class="blank">&nbsp;</div>
         <h4> 파일명 : [ ${fileName} ] </h4>
         <div class="blank">&nbsp;</div>

         
      <div style="overflow-x: auto; width: 90%;">
         <table id="sum_table" border="1">
            <thead>
               <tr>
                  <c:forEach var="colName" items="${list.colNames}">
                     <c:forEach var="colNameValue" items="${colName}">
                        <th style="text-align: center;"><input class="chkCol" name="chkColnames"
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
                        <th>
                        <input class="chkCol" name="chkColnames" type="checkbox"> 
                        <label class="chkCol" for="chkColnames">${colName}</label></th>
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
         

      
   </form>

   <!-- 재구조화 열 저장 버튼 -->
   <div>
   <div class="blank">&nbsp;</div>
      <input class="btn btn-primary" type="button" id="show_all2" value="저장" style="margin-right: 2%; width: auto; height: 35px; font-size: 15px;"/> 
      <input class="btn btn-warning" type="reset" id="reset" value="리셋" style="margin-right: 2%; width: auto; height: 35px; font-size: 15px;"/>
   <!-- 재구조화 타입 설정 및 테이블 출력 -->
      <input class="btn btn-default" type="button" id="export" value="melt" style="margin-right: 2%; width: auto; height: 35px; font-size: 15px;"/> 
      <input class="btn btn-default" type="submit" id="cast" value="cast" style="margin-right: 2%; width: auto; height: 35px; font-size: 15px;"/> 
      <input class="btn btn-default" type="submit" id="split" value="split" style="width: auto; height: 35px; font-size: 15px;"/>
   </div>

   <div>
		<div style="border-bottom: 1px solid #1e1e1e; width:80%">   	
      	<h3>재구조화 데이터 테이블</h3>
      	</div>

      <div class="blank">&nbsp;</div>
      <div style="overflow-x: auto; width: 90%;">
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
            <td><a href="/destiny/analytics/handling"><input class="btn btn-default" type="button"
                  value="이전 단계로" style="width: auto; height: 35px; font-size: 15px;"/></a>            
            	<a href="/destiny/analytics/ML"><input class="btn btn-default" type="button"
                  value="분석 단계로" style="width: auto; height: 35px; font-size: 15px;"/></a> 
                <a href="/destiny/analytics/visual"><input class="btn btn-default" type="button" 
                  value="시각화 단계로" style="width: auto; height: 35px; font-size: 15px;"/></a>
            </td>
         </tr>
      </table>
      <div class="blank">&nbsp;</div>
   </div>
   
</div> <!-- End Container -->
</main> 
  
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>