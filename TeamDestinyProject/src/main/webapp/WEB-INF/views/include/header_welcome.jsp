<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- About페이지 js파일 -->
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>header</title>

<style>

.container {
   padding: 8px !important;
}

/* 민구 추가 스타일 */
.headhead {
   background-color : #1e1e1e;
   border-bottom: 1px solid #EAEAEA;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nt100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 100;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nt400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 400;
}
.nt500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 500;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 700;
}
.nt900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 900;
}

/* 흑 백 메뉴 전환 */
.hovbutton {
   border-radius : 4px;
   background-color: #1e1e1e;
   border: none;
   color: #ebebeb;
   padding: 4px 8px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 14px;
   margin: 2px 4px;
   -webkit-transition-duration: 0.5s; /* Safari */
   transition-duration: 0.5s;
   cursor: pointer;
}

.hovbutton:hover {
   background-color: #ffffff;
   color: #1e1e1e;
}

/* 백 흑 메뉴 전환(로그인 회원가입) */

.hovbutton1 {
   border-radius : 4px;
   background-color: #ffffff;
   border: none;
   color: #1e1e1e;
   padding: 4px 8px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 14px;
   font-weight : 500;
   margin: 4px 4px;
   -webkit-transition-duration: 0.5s; /* Safari */
   transition-duration: 0.5s;
   cursor: pointer;
}

.hovbutton1:hover {
   background-color: #1e1e1e;
   color: #ffffff;
}


</style>

</head>

<body>
   <header>

      <!-- w3 컨테이너 지우고 헤드헤드 클래스로 작업함! -->
      <div class="headhead" style="font-family:'Noto Sans KR', sans-serif; color: #1e1e1e;">
         <div class="container">
            <div class="col-sm-3">
               <a href="/destiny">
                 <img src="http://erotic-chaos.com/wp-content/uploads/2017/08/daia_logo.png" style="width:auto%; height:40px;">
                   </a>
            </div>

            <!-- 부트스트랩 씌우고 테이블 버튼을 span에 버튼형식으로 추가함. -->
            <div class="leftmenu-group nt400" align="right">
               <span class="mainmenu"><a href="/destiny/greeting/aboutPrj"><button class="hovbutton" style="width:auto; height: 10%;">프로젝트 소개</button></a></span>
               <span class="mainmenu"><a href="/destiny/greeting/aboutUs"><button class="hovbutton" style="width:auto; height: 10%;">팀 소개</button></a></span>
               <span class="mainmenu"><a href="/destiny/greeting/board"><button class="hovbutton" style="width:auto; height: 10%;">FAQ</button></a></span>
               <span class="mainmenu"><a href="/destiny/greeting/contact"><button class="hovbutton" style="width:auto; height: 10%;">Contact</button></a></span>
               <span class="mainmenu"><a href="/destiny/users/myPage/${user.userId}"><button id="myPage" class="hovbutton1" style="width: auto; height: 10%;">내 정보</button></a></span>
               <span class="mainmenu"><a href="/destiny/users/logout"><button id="logout" class="hovbutton1" style="width: auto; height: 10%;" onclick="return confirm('정말로 로그아웃하시겠습니까?')">로그아웃</button></a></span>
               </div>

         </div><!-- End Container -->
      </div><!-- End HeaderLine -->
   </header>

</body>
</html>