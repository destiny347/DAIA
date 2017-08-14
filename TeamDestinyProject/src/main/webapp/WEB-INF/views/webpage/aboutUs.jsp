<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- W3.CSS Templates -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

</style>

<title>팀 소개</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

   <div class="container">
      <div class="" id="about">
         <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About -Destiny-</h3>
         <div>
            TEAM生TEAM死<br>
            누구 하나라도 빠지면 無가 되는 운명적 만남, DESTINY 입니다.<br>
            지금도 수없이 쏟아지고 쌓이는 데이터에서 가치와 인사이트를 발견하기 위해 머리를 맞대고 수많은 시간을 함께 고민했습니다.<br>
            그 결과, 누구나 쉽게 데이터를 정제하고 분석할 수 있는 데이터 분석 플랫폼 DAIA를 구축했습니다.<br>
            긴 여름, 에어컨 바람 밑에서 씨름하며 구축한 성공적인 결과를 함께 공유하고 싶습니다 !<br>
            - DESTINY 팀원 일동 -
            </div>
      </div>

      <div class="w3-row-padding w3-grayscale" style="width: 100%; height: 300px">
         <div class="w3-col l3 m6 w3-margin-bottom" style="width: 290px; height: 360px" float=left>
            <button class="w3-btn" id="a_btn1" type=submit onmouseover=btn1_onMouseOver() onmouseout=btn1_onMouseOut()>
               <img src="http://postfiles6.naver.net/MjAxNzA2MTVfNjQg/MDAxNDk3NDU0MTQyNjI4.aWC2JgdrWemjPYQYQMwR0kbW94EOz_Afq3NE3Ai_wAkg.TUdyuUIG8H1qVeEnYfP91DkiKtRP0YCtnNdnjmoqih8g.JPEG.naong526/KMG.jpg?type=w3"
                   alt="Min-Goo" style="width: 140px; height: 200px">
            </button>
            <h3 style="text-align: center">Min-Goo Kang</h3>
            <p class="w3-opacity">CEO & Founder</p>
            <div id=a_div1>
               나이:<br>취미:<br>
            </div>

            <p>
               <a href="#contact">
                  <button class="w3-button w3-light-grey w3-block">Contact</button>
               </a>
            </p>
         </div>
         <div class="w3-col l3 m6 w3-margin-bottom" style="width: 290px; height: 360px" float=left>
            <button class="w3-btn" id="a_btn2" type=submit
               onmouseover=btn2_onMouseOver() onmouseout=btn2_onMouseOut()>
               <img
                  src="http://postfiles9.naver.net/MjAxNzA2MTVfMjc1/MDAxNDk3NDU0MTQyNDAz.mZ7HeqSYzEHUxwfuhDd2qY2dc9mJ1g3DnxHEWi1XbHQg.jfbQarpnmOOvX-SxjD_cfGy9nTgxNZ-Iljr-Xh_qJgIg.JPEG.naong526/JSE2.jpg?type=w3"
                  alt="Seung-Eun" width=140px height=200px>
            </button>
            <h3 style="text-align: center">Seung-Eun Jung</h3>
            <p class="w3-opacity">Architect</p>
            <div id=a_div2>
               나이:<br>취미:<br>
            </div>
            <p>
               <a href="#contact">
                  <button class="w3-button w3-light-grey w3-block">Contact</button>
               </a>
            </p>
         </div>
         <div class="w3-col l3 m6 w3-margin-bottom"
            style="width: 290px; height: 360px" float=left>
            <button class="w3-btn" id="a_btn3" type=submit
               onmouseover=btn3_onMouseOver() onmouseout=btn3_onMouseOut()>
               <img
                  src="http://postfiles8.naver.net/MjAxNzA2MTVfMTI3/MDAxNDk3NDU0MTQyMTMy.GXg7uA7JMI6Gp6TPFytlVI2pLndOfkjPIDpU1NzqjtYg.Rxx3jQe1d_hwNlrNTqtgSNIrn3T6nC-FDhBzna3v-yIg.JPEG.naong526/HSG.jpg?type=w3"
                  alt="Soon-Gu" width=140px height=200px>
            </button>
            <h3 style="text-align: center">Soon-Gu Hong</h3>
            <p class="w3-opacity">Architect</p>
            <div id=a_div3>
               나이:<br>취미:<br>
            </div>
            <p>
               <a href="#contact">
                  <button class="w3-button w3-light-grey w3-block">Contact</button>
               </a>
            </p>
         </div>
         <div class="w3-col l3 m6 w3-margin-bottom"
            style="width: 290px; height: 360px" float=left>
            <button class="w3-btn" id="a_btn4" type=submit
               onmouseover=btn4_onMouseOver() onmouseout=btn4_onMouseOut()>
               <img
                  src="http://postfiles10.naver.net/MjAxNzA2MTVfMjUz/MDAxNDk3NDU0MTQyODM4.73XO59bYLaoY7ufXK1zazRN8F68HQrlV2-wUvOg3mrkg.8cSw5xC8DJ4Tf1agHLrddQ9uJmEyprqc23R7LZ2_NO8g.JPEG.naong526/LMH.jpg?type=w3"
                  alt="Mi-Hyung" width=140px height=200px>
            </button>
            <h3 style="text-align: center">Mehyeong Lee</h3>
            <p class="w3-opacity">Architect</p>
            <div id=a_div4>
               나이:<br>취미:<br>
            </div>
            <p>
               <a href="#contact">
                  <button class="w3-button w3-light-grey w3-block">Contact</button>
               </a>
            </p>
         </div>
         <div class="w3-col l3 m6 w3-margin-bottom"
            style="width: 290px; height: 360px" float=left>
            <button class="w3-btn" id="a_btn5" type=submit
               onmouseover=btn5_onMouseOver() onmouseout=btn5_onMouseOut()>
               <img
                  src="http://postfiles11.naver.net/MjAxNzA2MTVfNjkg/MDAxNDk3NDU0MTQzMDI4.mWcasdGpiG2y32gcZJuzl1E8_sXt8Mqf_NIO88mA-dkg.qIAh5QKxqmx6JlL4BXTVHuz-M4zrt3Jh_peNZRY-G24g.JPEG.naong526/SCS.jpg?type=w3"
                  alt="Chang-Seon" width=140px height=200px>
            </button>
            <h3 style="text-align: center">Chang-Seon Shin</h3>
            <p class="w3-opacity">Architect</p>
            <div id=a_div5>
               나이:<br>취미:<br>
            </div>
            <p>
               <a href="#contact">
                  <button class="w3-button w3-light-grey w3-block">Contact</button>
               </a>
            </p>
         </div>
      </div>
   </div>
   
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>   
</body>

</html>