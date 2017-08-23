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
html, body{ 
	background-image : url("http://erotic-chaos.com/wp-content/uploads/2017/08/bg_001.jpg");
	margin:0;
	padding:0;
	height:100%;
}

// 기본 폰트 클래스 ntXXX 형태로 사용!

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

<title>DAIA Platform</title>
</head>

<body>
   <jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container" style="font-family:'Noto Sans KR', sans-serif; color: #ebebeb; background-color: rgba( 0, 0, 0, 0.8 );">
      <div class="col-sm-12" id="about">
         <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">About
            Destiny</h2>
         <div>
            <img
               src="http://erotic-chaos.com/wp-content/uploads/2017/08/main_002.png"
               width=100%>
         </div>
      </div>
   
   <div class="col-sm-12" align="center">
      <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16" align="left">About Team Member</h2>
      <table>
          <tr>
            <td><img 
                  src="http://postfiles6.naver.net/MjAxNzA2MTVfNjQg/MDAxNDk3NDU0MTQyNjI4.aWC2JgdrWemjPYQYQMwR0kbW94EOz_Afq3NE3Ai_wAkg.TUdyuUIG8H1qVeEnYfP91DkiKtRP0YCtnNdnjmoqih8g.JPEG.naong526/KMG.jpg?type=w3"
                        alt="Min-Goo" style="width: 160px; height: 210px;">
                </td>
                <td style="width: 70px;"></td>
                <td><img
                        src="http://postfiles9.naver.net/MjAxNzA2MTVfMjc1/MDAxNDk3NDU0MTQyNDAz.mZ7HeqSYzEHUxwfuhDd2qY2dc9mJ1g3DnxHEWi1XbHQg.jfbQarpnmOOvX-SxjD_cfGy9nTgxNZ-Iljr-Xh_qJgIg.JPEG.naong526/JSE2.jpg?type=w3"
                        alt="Seung-Eun" style="width: 160px; height: 210px;">
                </td>
                <td style="width: 70px;"></td>
                <td><img
                        src="http://postfiles8.naver.net/MjAxNzA2MTVfMTI3/MDAxNDk3NDU0MTQyMTMy.GXg7uA7JMI6Gp6TPFytlVI2pLndOfkjPIDpU1NzqjtYg.Rxx3jQe1d_hwNlrNTqtgSNIrn3T6nC-FDhBzna3v-yIg.JPEG.naong526/HSG.jpg?type=w3"
                        alt="Soon-Gu" style="width: 160px; height: 210px;">
                </td>
                <td style="width: 70px;"></td>
                <td><img
                        src="http://postfiles10.naver.net/MjAxNzA2MTVfMjUz/MDAxNDk3NDU0MTQyODM4.73XO59bYLaoY7ufXK1zazRN8F68HQrlV2-wUvOg3mrkg.8cSw5xC8DJ4Tf1agHLrddQ9uJmEyprqc23R7LZ2_NO8g.JPEG.naong526/LMH.jpg?type=w3"
                        alt="Me-Hyung" style="width: 160px; height: 210px;">
                </td>
                <td style="width: 70px;"></td>
                <td><img
                        src="http://postfiles11.naver.net/MjAxNzA2MTVfNjkg/MDAxNDk3NDU0MTQzMDI4.mWcasdGpiG2y32gcZJuzl1E8_sXt8Mqf_NIO88mA-dkg.qIAh5QKxqmx6JlL4BXTVHuz-M4zrt3Jh_peNZRY-G24g.JPEG.naong526/SCS.jpg?type=w3"
                        alt="Chang-Seon" style="width: 160px; height: 210px;">
                </td>           
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr>
            <td><h4 style="text-align: center">Min-Gu Kang</h4>
                     <p class="w3-opacity">Captain</p>
                </td>
                <td style="width: 70px;"></td>
                <td><h4 style="text-align: center">Seung-Eun Jeong</h4>
                     <p class="w3-opacity">Engineer</p>
                </td>
                <td style="width: 70px;"></td>
                <td><h4 style="text-align: center">Soon-Gu Hong</h4>
                     <p class="w3-opacity">Engine</p>
                </td>
                <td style="width: 70px;"></td>
                <td><h4 style="text-align: center">Me-Hyeong Lee</h4>
                     <p class="w3-opacity">Anti-Humanist</p>
                </td>
                <td style="width: 70px;"></td>
                <td><h4 style="text-align: center">Chang-Seon Shin</h4>
                     <p class="w3-opacity">Cuty Sexy Pretty</p>
                </td>                
         </tr>
      </table>
   </div>
   


</div> <!-- End Container -->
   <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>