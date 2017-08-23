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

<title>DAIA Platform</title>

<style>
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

.side-menu:hover {
   opacity: 1.0;
   left: 0px;
   transition-duration: 0.8s;
}

.side-menu {
   float: left;
   background-color: #1e1e1e;
   color: #ebebeb;
   opacity: 0.6;
   width: auto;
   height: auto;
   position: fixed;
   top: 120px;
   left: -145px;
   transition-duration: 0.5s;
}

.side-menu table {
   width: 200px;
   height: 220px;
   color: #ebebeb;
   transition-duration: 0.5s;
}

 .side-menu table tr td a {
   font-size: 15px;
   color: #ebebeb;
   text-decoration: none;
   text-align: center;
   transition-duration: 0.5s;
}

.side-menu td:hover, .side-menu td:hover>a, nav.side-menu td.active>a, .dropdown-menu>td>a:hover,
   .dropdown-menu>td>a:focus, .dropdown-menu>.active>a, .dropdown-menu>.active>a:hover,
   .dropdown-menu>.active>a:focus, .no-touch .dashboard-page nav.dashboard-menu tr td:hover a,
   .dashboard-page nav.dashboard-menu tr td.active a {
   color: #ebebeb;
   background-color: #3c3c3c;
   transition-duration: 0.8s;
}

</style>

</head>

<body>

    <div class="side-menu" style="font-family:'Noto Sans KR', sans-serif; color: #1e1e1e;">
       <table>
       <tr>
          <td><a href="/destiny/upload/list" style="font-size: 17px;">파일관리</a></td>
          <td rowspan="5" >&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right fa-2x"></i></td>
       </tr>
      <tr>
         <td><a href="/destiny/analytics/handling" style="font-size: 17px;">데이터 전처리</a></td>
      </tr>
      <tr>
         <td><a href="/destiny/analytics/restructuring" style="font-size: 17px;">데이터 재구조화</a></td>
      </tr>
      <tr>
         <td><a href="/destiny/analytics/visual" style="font-size: 17px;">데이터 시각화</a></td>
      </tr>
      <tr>
         <td><a href="/destiny/analytics/ML" style="font-size: 17px;">머신러닝</a></td>
      </tr>
      </table>
   </div>

</body>
</html>