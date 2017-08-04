<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 페이지</title>
<link href="/favicon.png" rel="icon" type="image/png">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- W3.CSS Templates -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="/favicon.png" rel="icon" type="image/png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$('.dropdown-toggle').dropdown()
</script>
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

<script>
	$(document).ready(function() {
		var menu_flag = true;
	$(".button").bind("click", function() {
		if (menu_flag) {
	$(".side_bar").animate({"left":"-50%"}, 200);
		menu_flag = false;
	} else {
		$(".side_bar").animate({"left":"0px"}, 200);
		menu_flag = true;
		}
	});
});
</script>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<div class="side_bar" style="float: left; position: absolute; border:1px solid black;">
	<ul>
		<li><a href="/destiny/upload">파일관리</a></li>
		<li><a href="/destiny/analytics/handling">데이터 전처리</a></li>
		<li><a href="/destiny/analytics/restructuring">데이터 재구조화</a></li>
		<li><a href="/destiny/analytics/info/5">데이터 탐색</a></li>
		<li><a href="/destiny/analytics/visual">데이터 시각화</a></li>
		<li><a href="">데이터 주성분분석</a></li>
		<li><a href="/destiny/analytics/ML">머신러닝</a></li>
	</ul>
</div>

<div class="container">
	<div style="width: 100%; height: 700px; border:1px solid black;">
		메인페이지1
	</div>
	<div style="width: 100%; height: 700px; border:1px solid black;">
		메인페이지2
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>