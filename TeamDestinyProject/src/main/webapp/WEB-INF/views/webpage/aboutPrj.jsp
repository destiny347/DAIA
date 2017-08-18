<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

html, body{
margin:0;
padding:0;
height:100%;
}

.hovbutton{
    background-color: white; 
    border: none;
    color: slateblue;
    padding: 4px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 4px 2px 0;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    }
    
.hovbutton:hover {
background-color: slateblue;
color : white;
}

.button {
    background-color: white; 
    border: none;
    color: slateblue;
    padding: 4px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 4px 2px 0;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}    
.button:hover {
   background-color: slateblue;
   color : white;
} 

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nt100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 100;
}
.nt200 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 200;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 300;
}
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
.nt600 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 600;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 700;
}

</style>


<title>프로젝트 소개</title>
</head>

<body>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>


   <div class="container">
   <div style="font-family:'Noto Sans KR', sans-serif; color: #1e1e1e;">
         <h2>Projects</h2>
   </div>

      <!-- 메인 -->
      
      <!-- Image header -->
         <div>
            <!--  w3-container -->
            <img
               src="http://erotic-chaos.com/wp-content/uploads/2017/08/prj_main.png"
               alt="Jeans" style="width: 100%">    
            </div>
         
      <div><br><br>
      <h3><center>방대한 데이터와 복잡한 분석 과정을<br>DAIA 플랫폼에서 손쉽게 다룰 수 있습니다.</h3><br><br>
      <center>분석 과정에서 사용/변경되는 데이터를 서버와 DB에 저장하고 R의 다양한 분석 기능과 알고리즘을 제공합니다.</center>
      <center>데이터 통계에 대한 시각화 차트와 분석 결과에 대한 가이드 라인까지, <br><br><b>인사이트의 발견이 더욱 간편해집니다.</b></center>
      
      </div>
      
      <!-- 동영상 -->

      <div align="center">
      <br>
         <iframe width="560" height="315"
            src="https://www.youtube.com/embed/vyRC1bUAwFE" frameborder="0" allowfullscreen></iframe>
         <a href="project.html"></a>
         <br>
      </div>
      
      <!-- 메뉴바 -->

<p>
      <div align="center">
      <a href="#phase1_detail"><button class="hovbutton" style="width:auto; height: 10%;">파일관리</button></a>
      <a href="#phase2_detail"><button class="hovbutton" style="width:auto;">데이터 전처리</button></a>
      <a href="#phase3_detail"><button class="hovbutton" style="width:auto;">데이터 탐색</button></a>
      <a href="#phase4_detail"><button class="hovbutton" style="width:auto;">데이터 재구조화</button></a>
      <a href="#phase5_detail"><button class="hovbutton" style="width:auto;">분석 및 가이드라인</button></a>
      </div>
</p>
      
      
      <div class="blank">&nbsp;</div>

      <!-- 프로젝트 소개 상세 -->
      <div class="aboutprj">
      
         <div id="phase1_detail">
            <h3>사용자 맞춤 분석환경 | 파일관리와 데이터조회</h3>
            <hr size=1 noshade="noshade" align="left" width=100% color="#dcdcdc">
            <table border=0 cellpadding=0 width=100%>
            <tr>
            <td>
                <img src="http://erotic-chaos.com/wp-content/uploads/2017/06//phase1.png" width="300">
            </td>
            <td align="left">
            <br><b>분석 파일을 csv 형식으로 업로드 해 주세요.</b>
            <br><b>DB에 저장된 파일의 목록을 언제든지 조회할 수 있습니다.</b><br>
            
            <br>데이터 분석 과정에 사용할 수 있도록 테이블 형식으로 변형하여<br>구조를 보기 쉽게 화면에 출력해 줍니다. 
            <br>테이블의 열을 체크하여 변수 각각에 대한 전처리 작업을 빠르게 진행할 수 있습니다. 
            <br>분석 단계마다 도출된 결과를 DB에 저장하여 변경 내용을 조회하고,
            <br>다른 데이터와의 결합에도 사용할 수 있습니다. </td>
            </tr>
            </table>
            </div>
        
        <div class="blank">&nbsp;</div>

         <div id="phase2_detail" align="right">
            <h3>섬세한 데이터 정제 | 다양한 전처리 기능</h3>
            <hr size=1 noshade="noshade" align="left" width=100% color="#dcdcdc">
       <table border=0 cellpadding=0 width=100%>
       <tr>
       <td>
       <br>데이터의 각 변수에 대한 기초 통계 정보를 통해<br>이상치와 결측치를 확인할 수 있습니다. 
       <br>전처리 작업을 진행할 열을 선택하고 함수를 적용하세요.
       <br>해당 열의 값을 그룹별 평균으로, NA 값을 지정한 숫자로 변형시키는 함수 등<br>이상치와 결측치를 처리하기 위한 다양한 함수를 제공합니다.
       <br>데이터와 함수 선택만으로 전처리를 완료함으로써<br>복잡한 수식 적용으로 인한 시간과 오류를 대폭 줄일 수 있습니다.
       </td>
       <td><img src="http://www.rayvatbpo.com/wp-content/uploads/2016/06/data-processing-service.jpg" width="350"></td>
       </tr>
       </table>
       </div>
       
       <div class="blank">&nbsp;</div>

         <div id="phase3_detail">
            <h3>직관적 탐색 | 시각화 차트</h3>
            <hr size=1 noshade="noshade" align="left" width=100% color="#dcdcdc">
            <table border=0 cellpadding=0 width=100%>
            <tr>
            <td><img
                  src="http://www.vectiv.com/images/portfolio/recent/item21.png"
                  width="350">
            </td>
            <td>
            <br>관계를 파악하고 싶은 데이터 열과 그래프 형태를 선택해 주세요.
            <br>데이터 간의 관계를 한 눈에 알아볼 수 있는 그래프를 제공합니다. 
            </td>
            </tr>
            </table>            
         </div>
         
         <div class="blank">&nbsp;</div>
         
         <div id="phase4_detail" align="right">
            <h3>데이터의 통합 | 테이블 재구조화</h3>
            <hr size=1 noshade="noshade" align="left" width=100% color="#dcdcdc">
            <table border=0 cellpadding=0 width=100%>
            <tr>
            <td>
            <br>테이블 구조를 변형 시키기 위한 기능을 제공합니다.
               <br>split, pivot, unpivot할 열을 선택하고 재구조화 방법을 선택하거나 
               <br>결합하고자 하는 데이터를 불러와 두 개의 테이블을 결합합니다.<br>
               <br>분석에 용이한 형태로 테이블의 구조를 변형함으로써<br>쉽게 파악하지 못했던 데이터간의 유의미한 관계를 도출할 수 있습니다.
               <br>
               <br>
            </td>
            <td>
            <img
                  src="http://media.cutimes.com/cutimes/article/2017/06/22/mergerpieces64-crop-600x338.jpg"
                  width="350">
            </td>
            </tr>
            </table>
         </div>
         
         <div class="blank">&nbsp;</div>

         <div id="phase5_detail">
            <h3>인사이트 도출 | 머신러닝 알고리즘과 검정 통계량</h3>
            <hr size=1 noshade="noshade" align="left" width=100% color="#dcdcdc">
            <table border=0 cellpadding=0 width=100%>
            <tr>
            <td>
            <img
                  src="https://pbs.twimg.com/profile_images/688735459892195329/v8sHaWSG.jpg"
                  width="300">
            </td>
            <td>
            <br>다양한 분석 방법과 머신러닝 알고리즘을 제공합니다. 분석에 사용할 알고리즘을 선택해 주세요.
               <br>머신러닝을 실행하기 위해 데이터를 train set과 test set으로 샘플링 해 주세요. 각 샘플에 대한 추출 비율을 직접 설정할 수 있습니다.  
               <br>분석 결과 뿐만 아니라 업무에 용이하게 사용될 수 있도록 해석에 대한 가이드라인을 지원합니다.
            </td>
            </tr>
            </table>
         </div>
         <div class="blank">&nbsp;</div>

      </div>


</div>
</body>

<footer><jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include></footer>
</html>