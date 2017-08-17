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

<title>header_welcome</title>

<style>
.container {
    padding: 16px;
}
span.psw {
    float: right;
    padding-top: 16px;
}


/* 민구 추가 스타일 */
.headhead{
border-bottom: 1px solid #EAEAEA;
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
	<div class="col-sm-3">
		<a href="/destiny/greeting">
        <img src="http://erotic-chaos.com/wp-content/uploads/2017/08/daia_logo.png" style="width:auto%; height:55px;">
        </a>
	</div>
	

<!-- 부트스트랩 씌우고 테이블 버튼을 span에 버튼형식으로 추가함. -->
	<div class="leftmenu-group nt400" align="right">
		<!-- <span class="mainmenu"><a class="button" style="cursor:pointer;"><i class="fa fa-list-ul" style="font-size: 30px"></i></a></span> -->
		<span class="mainmenu"><a href="/destiny/greeting/aboutPrj"><button class="hovbutton" style="font-size:17px; width:auto; height: 60px;">프로젝트 소개</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/aboutUs"><button class="hovbutton" style="font-size:17px; width:auto; height: 60px;">팀 소개</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/board"><button class="hovbutton" style="font-size:17px; width:auto; height: 60px;">FAQ</button></a></span>
		<span class="mainmenu"><a href="/destiny/greeting/contact"><button class="hovbutton" style="font-size:17px; width:auto; height: 60px;">Contact</button></a></span>
		
		<div class="w3-right" style="padding: 17px;">  		   
    		<a href="/destiny/users/myPage/${user.userEmail}"><button class="btn btn-primary" style="font-size:14px; width: auto; height: 30px;" >내 정보</button></a>     
			<a href="/destiny/users/logout"><button class="btn btn-danger" style="font-size:14px; width: auto; height: 30px;" onclick="return confirm('정말로 로그아웃하시겠습니까?')">로그아웃</button></a>
			<p>[${user.userEmail}]님 환영합니다.</p>
		</div>
   </div>

	
   
  	</div> <!-- End Container -->
	</div> <!-- End HeaderLine -->
</header>

<!-- Script 모음 -->
<!-- <script type="text/javascript">
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
</script> -->

</body>
</html>