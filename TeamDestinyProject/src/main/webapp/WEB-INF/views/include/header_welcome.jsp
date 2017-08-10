<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- W3.CSS Templates -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="/favicon.png" rel="icon" type="image/png">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 각종 CSS 링크모음 -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://macdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/project.css" type="text/css">

<!-- About페이지 css파일 -->
<link rel="stylesheet" href="css/about_btnStyle.css">

<!-- 테이블 css파일 -->
<link rel="stylesheet" href="css/default.css" type="text/css">

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- About페이지 js파일 -->
<script type="text/javascript" src="js/about_btn.js" defer></script>
<script type="text/javascript" src="js/graph.js" defer></script>
<script type="text/javascript" src="js/js_menu.js" defer></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<title>header_welcome</title>

<style>

/* Set a style for all buttons */
button {
    background-color: #f1f1f1;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 5px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f1f1f1;
    float: left;
}
.createbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #ffffff;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5px auto; /* 15% from the top and centered */
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    /* Position it in the top right corner outside of the modal */
    position: absolute;
    right: 25px;
    top: 0; 
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

/* Close button on hover */
.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}

@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* 민구 추가 스타일 */
.headhead{
border-bottom: 1px solid #696969;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.nt300{
font-family: 'Noto Sans KR', sans-serif;
color : slateblue;
font-weight:300;
}
.nt400{
font-family: 'Noto Sans KR', sans-serif;
color : slateblue;
font-weight:400;
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

</style>
</head>

<body>
<header>

<!-- w3 컨테이너 지우고 헤드헤드 클래스로 작업함! -->
<div class="headhead">
<div class="container">
	<div class="logo" align="center">
		<a href="/destiny/greeting">
        <img src="http://erotic-chaos.com/wp-content/uploads/2017/08/Logo_Destiny.png" style="width:100px;height:100px;border:0">
        </a>
	</div>
	
<!-- 부트스트랩 씌우고 테이블 버튼을 span에 버튼형식으로 추가함. -->
	<div class="leftmenu-group col-sm-9 nt400">
		<span class="mainmenu"><a class="button" style="cursor:pointer;"><i class="fa fa-list-ul" style="font-size: 30px"></i></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/aboutPrj"><button class="hovbutton" style="font-size:22px; width:auto;">프로젝트 소개</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/aboutUs"><button class="hovbutton" style="font-size:22px; width:auto;">팀 소개</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/board"><button class="hovbutton" style="font-size:22px; width:auto;">게시판</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/contact"><button class="hovbutton" style="font-size:22px; width:auto;">Contact</button></a></span>
   </div>

	<div class="w3-right">
		<!-- <div class="box"> -->
    	<h4>[${user.userName}]님 환영합니다.</h4>        
		<a href="/destiny/users/logout"><button class="btn btn-default" onclick="return confirm('정말로 로그아웃하시겠습니까?')">로그아웃</button></a>
		<!-- </div> -->
    </div>
   
  	</div> <!-- End Container -->
	</div> <!-- End HeaderLine -->
</header>

<!-- Script 모음 -->
<script type="text/javascript">
// Get the modal
var modal = document.getElementById('id01');
var modal2 = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    } else if (event.target == modal2) {
        modal2.style.display = "none";
    }
}
</script>

</body>
</html>