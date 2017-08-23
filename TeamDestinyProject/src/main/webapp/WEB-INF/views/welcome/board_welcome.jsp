<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<title>DAIA Platform</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- W3.CSS Templates -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- BootStrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
   src="/js/search/search-auto-complete.js?v=20170814"></script>

<style>
html, body{
	background-image : url("http://erotic-chaos.com/wp-content/uploads/2017/08/bg_001.jpg");
	margin:0;
	padding:0;
	height:100%;
}

.w3-sidebar a {
   font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
   font-family: "Montserrat", sans-serif;
}

caption {
   font-family: "Montserrat", sans-serif;
   font-size: 20px;
   font-style: oblique;
}

nav {
   float: left;
}

button.accordion {
   background-color: #eee;
   color: #444;
   cursor: pointer;
   padding: 18px;
   width: 100%;
   border: none;
   text-align: left;
   outline: none;
   font-size: 15px;
   transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
   background-color: #ddd;
}

button.accordion:after {
   content: '\002B';
   color: #777;
   font-weight: bold;
   float: right;
   margin-left: 5px;
}

button.accordion.active:after {
   content: "\2212";
}

div.panel {
   padding: 0 18px;
   background-color: white;
   max-height: 0;
   overflow: hidden;
   transition: max-height 0.2s ease-out;
}

html{
	margin:0;
	padding:0;
	height:100%;
}

.faq {
	position: relative;
	margin: 0;
	overflow-y: scroll;
}

footer{
    position:relative;
    margin-bottom: 0px;
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
</style>
<script>
   
</script>
<body class="faq">
   <jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
  

   <div class="container" style="font-family:'Noto Sans KR', sans-serif; color: #1e1e1e; background-color: rgba( 0, 0, 0, 0.7 ); min-height: 769px;">
   <div class="col-sm-12">

      <!-- Overlay effect when opening sidebar on small screens -->
      <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

      <!-- Push down content on small screens -->
      <div class="w3-hide-large" style="margin-top: 83px"></div>
          
      <div>
         <div class="headheadhead" style="font-family:'Noto Sans KR', sans-serif; color: #ebebeb;">
             <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">FAQ</h2>
         </div>
      </div>

         <button class="accordion" style="font-size: 18px;">분석 파일 관리</button>
         <div class="panel" style="font-size: 16px;">
            <p>CSV 형식의 파일을 업로드 해 주세요. 
            	다른 형식의 파일은 업로드 되지 않습니다.
				분석 단계마다 도출된 결과물을 파일로 저장할 수 있으며 저장된 파일 목록과 데이터를 언제든지 조회할 수 있습니다.
				데이터는 모든 변수를 열로 나열한 테이블 형식으로 출력됩니다. </p>
         </div>

         <button class="accordion" style="font-size: 18px;">데이터 선택</button>
         <div class="panel" style="font-size: 16px;">
            <p>전처리, 재구조화, 시각화 등 기능을 적용하고자 하는 데이터 열을 선택해 주세요.
				각 열 이름의 상단에 있는 체크박스를 선택합니다.</p>
         </div>

         <button class="accordion" style="font-size: 18px;">데이터 전처리</button>
         <div class="panel" style="font-size: 16px;">
            <p>분석용 데이터를 구축하기 위해 데이터의 결측치와 이상치를 특정 값으로 대체해 주세요.
				데이터 변수와 적용하고자 하는 전처리 기능을 선택하고 '변환' 버튼을 눌러수세요.</p>
         </div>
         
         <button class="accordion" style="font-size: 18px;">데이터 재구조화</button>
         <div class="panel" style="font-size: 16px;">
            <p>데이터간 관계를 확인하고 재정의하기 위해선 테이블을 다양한 각도로 파악해야 합니다.
				pivot 테이블을 구성하는 'cast', unpivot 형식으로 되돌리는 'melt', 데이터를 분리하는 'split' 기능으로 테이블의 구조를 변환할 수 있습니다.
				재구조화가 필요한 데이터를 목록에서 불러온 뒤 기능을 테이블 재구조 기능을 선택해 주세요.</p>
         </div>
         <button class="accordion" style="font-size: 18px;">데이터 시각화 및 탐색</button>
         <div class="panel" style="font-size: 16px;">
            <p>관계를 파악하고 싶은 데이터 열과 그래프 형태를 선택해 주세요. 
				데이터 간의 관계를 한 눈에 알아볼 수 있는 그래프를 제공합니다.</p>
         </div>
         <button class="accordion" style="font-size: 18px;">머신러닝</button>
         <div class="panel" style="font-size: 16px;">
            <p>정제 작업이 완료된 데이터를 샘플링하고 분석 방법을 선택하는 단계입니다.
				데이터 샘플은 Training set(학습에 사용되는 데이터)과 Test set(알고리즘을 적용하는 데이터) 분류되며 각각의 비율을 직접 설정할 수 있습니다.
				권장비율은 70(Training set):30(Test set) 입니다.</p>
         </div>
         <button class="accordion" style="font-size: 18px;">검정통계량</button>
         <div class="panel" style="font-size: 16px;">
            <p>분석 결과의 신뢰도를 확인할 수 있는 통계치를 제공합니다.
				더 높은 예측 결과를 얻고 싶다면 다른 알고리즘을 선택해 결과를 비교해 볼 수 있습니다.</p>
         </div>
         <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
               acc[i].onclick = function() {
                  this.classList.toggle("active");
                  var panel = this.nextElementSibling;
                  if (panel.style.maxHeight) {
                     panel.style.maxHeight = null;
                  } else {
                     panel.style.maxHeight = panel.scrollHeight + "px";
                  }
               }
            }
         </script>
   </div>
   </div>  <!-- End Container -->

 
</body>
<footer>
 <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer> 
</html>