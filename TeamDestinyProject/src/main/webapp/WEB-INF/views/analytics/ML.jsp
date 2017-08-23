<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="../js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
   </script>

<title>DAIA Platform</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">


<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
   rel="stylesheet" type="text/css">
   
<style type="text/css">
.radiobutton {
    height: 150px;
}

<!-- Fonts -->
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nti100 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 100;
}
.nti300 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nti400 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 400;
}
.nti500 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 500;
}
.nti700 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 700;
}
.nti900 {
    font-family: 'Noto Sans KR', sans-serif;
    color: #1e1e1e;
    font-weight: 900;
}

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
<script type="text/javascript">
$(document).ready(function() {
   $('#저장').click(function() {   
      var num = /^[0-9]{2}$/; 
      
      if(num.test($('#1').val()) == true && num.test($('#2').val()) == true){
         var tmp = "성공 -> "+ $('#1').val() +" : "+ $('#2').val();
         alert(tmp);
      }
      else{
         alert("두자리 숫자만을 입력해 주세요");
      }
         
      
    });
   $('#result').click(function() {   
      if (confirm("정말 "+$('input[name=Algorithm]:checked').val()+"를 선택 하시겠습니까?" ) == true){    //확인
          document.form.submit();
      }else {   //취소
         return false;
      }   
    });       
}); 

</script>
<body>
<main>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container" style="font-family:'Noto Sans KR', sans-serif; font-weight:400; color: #1e1e1e;">

   <div style="border-bottom: 1px solid #1e1e1e; width:80%">
      <h3>머신러닝</h3>
   </div>
   <div class="blank">&nbsp;</div>
   
   <div style="border: 1px solid #1e1e1e; border-radius: 3px; width:80%; ">
      <h4>&nbsp;데이터 명 : [ ${fileName} ]</h4>
   </div>
   <div class="blank">&nbsp;</div>
   
    <div style="overflow-x: auto;">  
    <table id="result_table" border="1">
         <thead>
            <tr>
               <c:forEach var="colName" items="${list.colNames}">
                  <c:forEach var="colNameValue" items="${colName}">
                     <th style="text-align: center;"><input class="chkCol" name="chkColnames" type="checkbox"
                        value="${colName}"> <label class="chkCol"
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
   </div>
   
   <div style="border-bottom: 1px solid #1e1e1e; width:80%">
      <h3>Training set 설정</h3>   
   </div>
   <div class="blank">&nbsp;</div>
   <div>
      <table>
      <tr>
         <td><input type="text" id="1" placeholder="70" style="width: 50px; height: 40px; font-size: 20px; text-align: center;"></td>
         <td><label style="font-size: 20px;">&nbsp; : &nbsp; </label></td>
         <td><input type="text" id="2" placeholder="30" style="width: 50px; height: 40px; font-size: 20px; text-align: center;"></td>
         <td>&nbsp;&nbsp;&nbsp;</td>
         <td><button id="저장" class="btn btn-success" style="width: 60px; height: 40px; font-size: 17px;" value="저장">저장</button></td>
         
      </tr>
      </table>      
   </div>
   <div class="blank">&nbsp;</div>
   <div class="blank">&nbsp;</div>
      
   <div style="border-bottom: 1px solid #1e1e1e; width:80%">
      <h3><label for="inputAlgorithm"><b>알고리즘 선택</b>
         </label></h3>
   </div>
   <div class="blank">&nbsp;</div>
   <div>
      <table>
         <tr style="font-size: 16px;">
            <td style="width: auto;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Algorithm" id="1" value="회귀" checked></td>
            <td style="width: auto; text-align: left;"><label class="radio-inline" for="optionsRadios1">Regression / 회귀</label></td>
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr style="font-size: 16px;">
            <td style="width: auto;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Algorithm" id="2" value="분류"></td>
            <td style="width: auto; text-align: left;"><label class="radio-inline" for="optionsRadios2">Classfication   / 분류</label></td>               
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr style="font-size: 16px;">
            <td style="width: auto;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Algorithm" id="3" value="연관"></td>
            <td style="width: auto; text-align: left;"><label class="radio-inline" for="optionsRadios3">Association / 연관</label></td>            
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr style="font-size: 16px;">
            <td style="width: auto;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Algorithm" id="4" value="군집"></td>
            <td style="width: auto; text-align: left;"><label class="radio-inline" for="optionsRadios4">Cluster Analysis / 군집</label></td>                        
         </tr>
      </table>
   </div>
   <div class="blank">&nbsp;</div>
   <div>
      <a href="/destiny/analytics/analysis"><button class="btn btn-primary" id="result" value="결과 보기" style="width: auto; height: 40px; font-size: 17px;">결과 보기</button></a>
   </div>
   <div class="blank">&nbsp;</div>
   
   
   
</div> <!-- End Container -->
</main>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>