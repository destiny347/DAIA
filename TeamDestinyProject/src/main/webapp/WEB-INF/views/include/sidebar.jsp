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

<title>Sidebar</title>

<!-- <script>
$(document).ready(function() {
	var menu_flag = false;
	$(".w3-sidebar").hide();
$(".button").bind("click", function() {
	if (menu_flag) {
	$(".w3-sidebar").hide();
	/* $(".side_bar").animate({"left":"-50%"}, 200); */
	menu_flag = false;
} else {
	$(".w3-sidebar").show();
	/* $(".side_bar").animate({"left":"0px"}, 200); */
	menu_flag = true;
	}
});
});
</script> -->

<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
@import url(http://fonts.googleapis.com/css?family=Titillium+Web:300);
@font-face {
	font-family: 'Titillium Web';
	font-style: normal;
	font-weight: 300;
	src: local('Titillium WebLight'), local('TitilliumWeb-Light'),
		url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff)
		format('woff');
}

.side-menu:hover {
	opacity: 1.0;
	left: 0px;
}

.side-menu {
	float: left;
	background-color: mediumslateblue;
	color: white;
	opacity: 0.5;
	width: auto;
	height: auto;
	position: fixed;
	top: 210px;
	left: -160px;
}

.side-menu table {
	width: 200px;
	height: 230px;
	color: white;
}

 .side-menu table tr td a {
	font-size: 15px;
	color: white;
	font-family: 'Titillium Web', sans-serif;
	text-decoration: none;
	text-align: center;
}

.side-menu td:hover, .side-menu td:hover>a, nav.side-menu td.active>a, .dropdown-menu>td>a:hover,
	.dropdown-menu>td>a:focus, .dropdown-menu>.active>a, .dropdown-menu>.active>a:hover,
	.dropdown-menu>.active>a:focus, .no-touch .dashboard-page nav.dashboard-menu tr td:hover a,
	.dashboard-page nav.dashboard-menu tr td.active a {
	color: white;
	background-color: slateblue;
}

</style>

</head>

<body>

 	<div class="side-menu">
 		<table>
 		<tr>
 			<td><a href="/destiny/upload/list">파일관리</a></td>
 			<td rowspan="7">&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right fa-2x"></i></td>
 		</tr>
		<tr>
			<td><a href="/destiny/analytics/handling">데이터 전처리</a></td>
		</tr>
		<tr>
			<td><a href="/destiny/analytics/restructuring">데이터 재구조화</a></td>
		</tr>
		<tr>
			<td><a href="/destiny/analytics/info/">데이터 탐색</a></td>
		</tr>
		<tr>
			<td><a href="/destiny/analytics/visual">데이터 시각화</a></td>
		</tr>
		<tr>
			<td><a href="">데이터 주성분분석</a></td>
		</tr>
		<tr>
			<td><a href="/destiny/analytics/ML">머신러닝</a></td>
		</tr>
		</table>
	</div>

</body>
</html>
