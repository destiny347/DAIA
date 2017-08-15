<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<title>메인 페이지</title>

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


/* 민구 추가 스타일 */
.headhead {
	border-bottom: 1px solid #EAEAEA;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nt300 {
	font-family: 'Noto Sans KR', sans-serif;
	color: slateblue;
	font-weight: 300;
}

.nt400 {
	font-family: 'Noto Sans KR', sans-serif;
	color: slateblue;
	font-weight: 400;
}

.hovbutton {
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
	color: white;
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
	color: white;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
   	
    		<div class="headhead">
    			<h1>로그인 <small>BD Platform</small></h1>
    		</div>
    		<div>&nbsp;</div>
	<form style="width: 500px;" class="" action="/destiny/greeting" method="post">
    		<div class="w3-container">
      			<label><b>이메일</b></label>
      			<input type="text" placeholder="Enter e-mail" name="userEmail" required>

			    <label><b>비밀번호</b></label>
      			<input type="password" placeholder="Enter Password" name="userPw" required>
        		
        		<div>&nbsp;</div>
        		
      			<input type="submit" class="btn btn-primary" value="로그인"/>
      			<a href="/destiny"><input type="button" class="btn btn-danger" value="취소"/></a>
      			<!-- <input type="checkbox" name="userCheck"/>기억하기 -->
    		</div>
			
			
    		
      		<!-- onclick="document.getElementById('id01').style.display='none'"  -->
			<!-- <span class="psw">Forgot <a href="#">password?</a></span> -->
    		
    		<div>&nbsp;</div>	<!-- Line blank -->
	</form>
</div>	<!-- End Container -->

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>