<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

<!-- 스크립트는 여기부터 -->
<!-- About페이지 js파일 -->
<script type="text/javascript" src="js/about_btn.js" defer></script>
<script type="text/javascript" src="js/graph.js" defer></script>
<script type="text/javascript" src="js/js_menu.js" defer></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maps.google.com/maps/api/js?sensor=true"></script>
<style>
.a {
	margin: 70px 0px;
	text-align: center;
	font-size: 140px;
	color: #2196F3;
}

#buttonSave {
	background-color: #008CBA;
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}

.input-group .icon-addon .form-control {
	border-radius: 0;
}

.icon-addon {
	position: relative;
	color: #555;
	display: block;
}

.icon-addon:after, .icon-addon:before {
	display: table;
	content: " ";
}

.icon-addon.addon-sm .form-control {
	height: 30px;
	padding: 5px 10px 5px 28px;
	font-size: 12px;
	line-height: 1.5;
}

.icon-addon.addon-sm .fa, .icon-addon.addon-sm .glyphicon {
	margin-left: 0;
	font-size: 12px;
	left: 5px;
	top: -1px
}

#centerText {
	font-style: oblique;
	font-size: 200%;
	color: blue;
}

#upload {
	font-size: 150%;
}

#content4 {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto;
	overflow: hidden;
}
</style>

<title>Contact US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

	<div class="container">
	<div class="map">
      <div id="google-map" data-latitude="37.4950598" data-longitude="127.12241160000008"></div>
   </div>
	
	<div class="" id="contact">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
		<p>Lets get in touch and talk about your and our next project.</p>
		<form action="/action_page.php" target="_blank">
			<input class="w3-input" type="text" placeholder="Name" required name="Name"> 
			<input class="w3-input w3-section" type="text" placeholder="Email" required name="Email"> 
			<input class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject"> 
			<input class="w3-input w3-section" type="text" placeholder="Comment" required name="Comment">
				<button class="w3-button w3-blue w3-section" type="submit">
					<i class="fa fa-paper-plane"></i> SEND MESSAGE
				</button>
		</form>
	</div>
	</div>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>