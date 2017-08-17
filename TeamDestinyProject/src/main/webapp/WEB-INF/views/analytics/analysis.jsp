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

.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 300;
}

.nt400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 400;
}

.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #696969;
   font-weight: 700;
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

   });
   });
</script>

<title>Destiny</title>

</head>

<body>

   <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>
   
   <div class="col-lg-4 col-md-4 col-sm-12 nt400" style="height:150px; text-align: left;">
      <h3>검정통계량</h3>
      
      <table class="t1 nt300">

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

<!--          <tr>
         <td style="padding:20px;">테스트! 이 자리에는 검정통계량 표가 나와야 합니다.</td>
         </tr>
 -->         
      </table> 
            
   </div>
   
   <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>
 

<div class="col-lg-12 col-md-12 col-sm-12 nt400" id="graph" style="margin-top: 5px">
   <h3>검정통계량 그래프</h3>

      <div class="col-lg-4 col-md-4 col-sm-9" id="blackContainer" style="border-style: dotted; border-width: 1px; border-color: pink;">
   </div>
</div>

   <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
         <tr><td>&nbsp;</td></tr>
      </table>     
   </div>

   <div class="col-lg-6 col-md-6 col-sm-6 nt400" style="margin-top: 5px; display: inline-block;">
      <input type="button" id="show" value="보임">
      <input type="button" id="hide" value="숨김">
   </div>

   <!-- 저장/리셋 -->
   <div class="col-lg-6 col-md-6 col-sm-6 nt400" style="display: inline-block;">
      <input type="submit" value="저장"> 
      <a href="/destiny/upload/list" class="nt400"><input type="reset" value="처음으로"></a>
   </div>
      
</body>
</html>