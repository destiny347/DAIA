<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Fonts -->
<style>
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
footer{
    position:relative;
    bottom:0;
    width:100%;
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
h {
    font-family: 'Noto Sans KR', sans-serif;
    color: #696969;
    font-weight: 400;
}
.t1{
 	font-size: 16px;
	text-align: left;
	border-style: solid;
	border-width: 1px;
	border-color: #696969;
	padding : 8px;
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

<!-- Bootstrap Core CSS -->

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
   
<!-- jQuery -->
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<!-- 그냥 하이차트로 행복하기 -->
<script src="https://code.highcharts.com/highcharts.js" defer></script>
<script src="https://code.highcharts.com/highcharts-3d.js" defer></script>
<script src="https://code.highcharts.com/modules/exporting.js" defer></script>

<script>
   $(document).ready(function() {
      $("#blackContainer").hide(); <!--숨겨놓음-->
      
      console.log("사랑은 봄비처럼");
      
      $("#show").click(function() {
         
         console.log("이별은");
         
           $.ajax({
            url:'black',
               type: 'get',
               async : true,
               dataType : "JSON",
            success : function(data){
               console.log("겨울비처럼");
               console.log(JSON.stringify(data));
                  $(function(){
                     new Highcharts.Chart({
                         chart: {
                             renderTo: 'blackContainer',
                             type: 'column',
                             options3d: {
                                 enabled: true,
                                 alpha: 25,
                                 beta: 20,
                                 depth: 30,
                                 viewDistance: 25
                             }
                         },
                         colors: ['#b97bec', '#6642d1', '#ff357f', '#ff8cb6', '#8085e9', 
                                  '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
                         
                         title: {
                             text: '검정은 Black'
                         },
                         subtitle: {
                             text: '분석 알고리즘에 따른 F-measure값 비교'
                         },
                         plotOptions: {
                             column: {
                                 depth: 25
                             }
                         },
                              xAxis: {
                                  categories: ['분석 알고리즘']
                              },
                         series: data
                     });
                     function showValues() {
                         $('#alpha-value').html(chart.options.chart.options3d.alpha);
                         $('#beta-value').html(chart.options.chart.options3d.beta);
                         $('#depth-value').html(chart.options.chart.options3d.depth);
                     }
                  })   
               $("#blackContainer").show();
            }
         });
      $("#hide").click(function() {
         $("#blackContainer").hide();
      });
	
      $("#pdf").click(function() {
          location.href = "http://localhost:8080/destiny/analytics/downloadPDF";
       });
      
   });
   });
</script>

<title>Destiny</title>

</head>

<body>
<main>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div class="container" style="font-family:'Noto Sans KR', sans-serif; font-weight:400; color: #1e1e1e;">

   <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>
   <div style="border-bottom: 1px solid #1e1e1e; width:80%">
		<h3>검정통계량</h3>
   </div>
   <div class="blank">&nbsp;</div>
   
   <div class="col-lg-4 col-md-4 col-sm-12" style="height:150px; text-align: left;">
      <table class="t1 ntv300">
        <tr class="t1">
           <td class="t1">XG_Boost 검정값</td>
           <td class="t1">0.5254054054054055</td>
        </tr>
        <tr class="t1">
           <td class="t1">NNET 검정값</td>
           <td class="t1">0.4954545454545455</td>
        </tr>
        <tr class="t1">
           <td class="t1">E1071 검정값</td>
           <td class="t1">0.0459363957597173</td>
        </tr>
      </table>             
   </div>

 
   
	<div class="col-sm-12" style="border-bottom: 1px solid #1e1e1e; width:80%">
		<h3>검정통계량 그래프</h3>
   </div>
   <div class="blank">&nbsp;</div>
   
<div class="col-lg-12 col-md-12 col-sm-12 ntv400" id="graph" style="margin-top: 5px">
   <div class="blank">&nbsp;</div>
      <div class="col-lg-4 col-md-4 col-sm-9" id="blackContainer" style="border-style: dotted; border-width: 1px; border-color: pink;">
   </div>
</div>
		
	<div style="clear: both;">
		<div class="blank">&nbsp;</div>
		&nbsp;&nbsp;&nbsp;
		<input class="btn btn-info" type="button" id="show" value="보임" style="width: auto; height: 35px; font-size: 15px;">
		&nbsp;
		<input class="btn btn-info" type="button" id="hide" value="숨김" style="width: auto; height: 35px; font-size: 15px;">
	</div>
	

   <!-- 저장/리셋 -->
   <div class="col-sm-12" style="border-bottom: 1px solid #1e1e1e; width:80%">
		<h3>&nbsp;</h3>
   </div>
   	<div style="clear: both;">
		<div class="blank">&nbsp;</div>
		&nbsp;&nbsp;&nbsp;
		<input class="btn btn-primary" type="button" id="pdf" value="저장" style="width: auto; height: 35px; font-size: 15px;">
		&nbsp;
		<a href="/destiny/upload/list">
			<input class="btn btn-default" type="button" value="처음으로" style="width: auto; height: 35px; font-size: 15px;"/>
		</a>
	</div>
	<div class="blank">&nbsp;</div>
</div> <!-- End Container -->
</main>

</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>