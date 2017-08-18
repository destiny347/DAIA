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
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- BootStrap CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
</style>

<title>팀 소개</title>
</head>

<body>
   <jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

   <div class="container">
      <div class="" id="about">
         <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">About
            -Destiny-</h3>
         <div>
            <img
               src="http://erotic-chaos.com/wp-content/uploads/2017/08/team_main.png"
               width=100%>
         </div>
      </div>
      <p></p>

      <div class="w3-row-padding w3-grayscale">
         <table align="center" width="800" >
            <tr>
               <td width="400" style="border: 3px solid white;">
                  <div class="w3-col l3 m6 w3-margin-bottom" style="width: 100%">
                     <img
                        src="http://postfiles6.naver.net/MjAxNzA2MTVfNjQg/MDAxNDk3NDU0MTQyNjI4.aWC2JgdrWemjPYQYQMwR0kbW94EOz_Afq3NE3Ai_wAkg.TUdyuUIG8H1qVeEnYfP91DkiKtRP0YCtnNdnjmoqih8g.JPEG.naong526/KMG.jpg?type=w3"
                        alt="Min-Goo" style="width: 350px">
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
               </td>
               <td>
                  <div class="w3-col l3 m6 w3-margin-bottom" style="width: 100%">
                     <img
                        src="http://postfiles9.naver.net/MjAxNzA2MTVfMjc1/MDAxNDk3NDU0MTQyNDAz.mZ7HeqSYzEHUxwfuhDd2qY2dc9mJ1g3DnxHEWi1XbHQg.jfbQarpnmOOvX-SxjD_cfGy9nTgxNZ-Iljr-Xh_qJgIg.JPEG.naong526/JSE2.jpg?type=w3"
                        alt="Seung-Eun" style="width: 266px">

                     <h3 style="text-align: center">Seung-Eun Jung</h3>
                     <p class="w3-opacity">Architect</p>
                     <div id=a_div2>
                        나이:<br>취미:<br>
                     </div>
                     <p>
                        <a href="#contact">
                           <button class="w3-button w3-light-grey w3-block" width=100%>Contact</button>
                        </a>
                     </p>
                  </div>
               </td>
            </tr>
         </table>
         <table width="1200">
            <tr>
               <td width="400" style="border: 3px solid white;">
               <div class="w3-col l3 m6 w3-margin-bottom" style="width: 100%">

                     <img
                        src="http://postfiles8.naver.net/MjAxNzA2MTVfMTI3/MDAxNDk3NDU0MTQyMTMy.GXg7uA7JMI6Gp6TPFytlVI2pLndOfkjPIDpU1NzqjtYg.Rxx3jQe1d_hwNlrNTqtgSNIrn3T6nC-FDhBzna3v-yIg.JPEG.naong526/HSG.jpg?type=w3"
                        alt="Soon-Gu" width=320px height=450px>
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
                  </div></td>
               <td width="400" style="border: 3px solid white;">
               <div class="w3-col l3 m6 w3-margin-bottom" style="width: 100%">

                        <img
                           src="http://postfiles10.naver.net/MjAxNzA2MTVfMjUz/MDAxNDk3NDU0MTQyODM4.73XO59bYLaoY7ufXK1zazRN8F68HQrlV2-wUvOg3mrkg.8cSw5xC8DJ4Tf1agHLrddQ9uJmEyprqc23R7LZ2_NO8g.JPEG.naong526/LMH.jpg?type=w3"
                           alt="Mi-Hyung" width=300px>

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
                  </div></td>
               <td width="400"><div class="w3-col l3 m6 w3-margin-bottom" style="width: 100%">
                        <img
                           src="http://postfiles11.naver.net/MjAxNzA2MTVfNjkg/MDAxNDk3NDU0MTQzMDI4.mWcasdGpiG2y32gcZJuzl1E8_sXt8Mqf_NIO88mA-dkg.qIAh5QKxqmx6JlL4BXTVHuz-M4zrt3Jh_peNZRY-G24g.JPEG.naong526/SCS.jpg?type=w3"
                           alt="Chang-Seon" width=340px>
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
                  </div></td>
            </tr>
         </table>
      </div>




   </div>
   <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>