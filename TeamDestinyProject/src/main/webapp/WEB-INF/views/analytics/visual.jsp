<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.ntv300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 300;
}

.ntv400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 400;
}

.ntv700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 700;
}
</style>

<!-- jQuery -->

<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">

<!-- 그냥 하이차트로 행복하기 -->
<script src="https://code.highcharts.com/highcharts.js" defer></script>
<script src="https://code.highcharts.com/highcharts-3d.js" defer></script>
<script src="https://code.highcharts.com/modules/exporting.js" defer></script>

<!-- 선택한 것만 보기 -->

<script>
$(document).ready(function(){
   
   $('#show').click(function(){
      
      console.log("데스티니");
      
      if($('#barcheck').is(':checked')) {
         
         console.log("barcheck");
         
         $.ajax({
            url:'bar',
            type: 'get',
            async : true,
            dataType : "JSON",

            success : function(data){
                console.log(JSON.stringify(data));
              $(function() {
                 new Highcharts.chart({
                     chart: {
                        renderTo : 'barChartContainer',
                        type : 'column'
                     },
                     
                     title: {
                         text: 'bar는 ChocoBar'
                     },
                     colors: ['#ff357f', '#ff8cb6', '#b97bec', '#6642d1', '#8085e9', 
                         '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
                     xAxis: {
                         categories: ["미혼사기자", "기혼사기자"],
                     },
                     
                  series: [ {
                     data: data
                  }]
                 });
              })
               $("#barChartContainer").show();
            }
         }); 

      }
      $("#hide").click(function() {
         
         console.log("뜨든!");
         
         if($('#barcheck').is(':checked')){
            console.log("숨기기 준비!")
            $("#barChartContainer").hide();
         }
      });
   });
 
   $('#show').click(function(){
      
         console.log("데스티니");
   
      if($('#piecheck').is(':checked')) {

         console.log("piecheck");
         $.ajax({
            url: 'pie',
            pie: 'get',
            async : true,
            dataType : "JSON",
            
            success : function(data){
               console.log(data);
               console.log(JSON.stringify(data));
               $(function() {
                  new Highcharts.chart({
                        chart: {
                           renderTo : 'pieChartContainer',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie'
                        },
                              
                        title: {
                            text: 'pie는 ApplePie'
                        },
                        
                        colors: ['#b97bec', '#6642d1', '#ff357f', '#ff8cb6', '#8085e9', 
                            '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
                            
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true
                                },
                                showInLegend: true
                            }
                        },
                         series: [{name: '사기자 백분율',
                               colorByPoint : true,
                               data : data
                         }]
                 });
                 });
               $("#pieChartContainer").show();
            }
         }); 
         
      }
      $("#hide").click(function() {
         
         console.log("뜨든!");
         
         if($('#piecheck').is(':checked')){
            console.log("숨기기 준비!")
            $("#pieChartContainer").hide();
         }
      });
 });
 
   $('#show').click(function(){
      
         console.log("데스티니");
   
      if($('#linecheck').is(':checked')){
         $('black').toggle();
         console.log("클릭")
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
         
      }
      $("#hide").click(function() {
         
         console.log("뜨든!");
         
         if($('#linecheck').is(':checked')){
            console.log("숨기기 준비!")
            $("#blackContainer").hide();
         }
      });
 });   

   });


</script>


<title>visual</title>
</head>



<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
   <!-- 시각화하려는 변수를 선택하는 부분 -->

   <div class="col-sm-12 ntv400">

      <h3>
         변수 선택 : <input type="text" id="dataName" readonly>
      </h3>

   </div>
   <br>
   <table id="result_table" border="1" >
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
   <br>

   <!-- 그래프 타입 선택 -->

   <div class="col-sm-12 ntv400">
      <h3>그래프 타입 선택</h3>
      <input type="checkbox" id="barcheck"> 막대 그래프 <br> <input
         type="checkbox" id="piecheck"> 파이 그래프 <br> <input
         type="checkbox" id="linecheck"> 3D 그래프 <br> <br> 
    <input type="button" id="show" value="보임">
      <input type="button" id="hide" value="숨김"><br>
   </div>
   <br>

   <!-- 그래프 표시부  -->

   <div class="col-sm-12 ntv400" id="graph" style="margin-top: 5px">
      <h3>그래프 표시부</h3>

      <br>
      <div class="col-sm-4" id="barChartContainer"
         style="border-style: solid; border-width: 1px; border-color: pink; display: none">
         <!-- <div id="bar"></div> -->
      </div>
      <div class="col-sm-4" id="pieChartContainer"
         style="border-style: solid; border-width: 1px; border-color: pink; display: none">
         <!-- <div id="pie"></div>  -->
      </div>
      <div class="col-sm-4" id="blackContainer"
         style="border-style: solid; border-width: 1px; border-color: pink; display: none">
         
         <!-- <div id="line"></div> -->
      </div>
   </div>

      <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>

   <!-- 저장/리셋 -->
   <div class="col-sm-12 ntv400" align="center">
      <input type="submit" value="SAVE"> 
      <input type="reset" value="RESET">
   </div>

      <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>
   
   <div class="col-sm-12 ntv400" align="right">
      <a href="/destiny/analytics/ML" class="ntv400"><input type="button"
         value="다음 단계로" /></a>
   </div>
   
</div> <!-- End Conatiner -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>