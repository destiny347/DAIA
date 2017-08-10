<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js""></script>

<title></title>

<script>
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
</script>


</head>

<body>

	<div class="w3-sidebar w3-bar-block" style="height: 200px; float: left; position: absolute; border:0px solid black; display:none;">
		<ul>
			<li><a href="/destiny/upload/list">파일관리</button></li>
			<li><a href="/destiny/analytics/info/{fileId}">데이터 전처리</a></li>
			<li><a href="/destiny/analytics/restructuring">데이터 재구조화</a></li>
			<li><a href="/destiny/analytics/info/">데이터 탐색</a></li>
			<li><a href="/destiny/analytics/visual">데이터 시각화</a></li>
			<li><a href="">데이터 주성분분석</a></li>
			<li><a href="/destiny/analytics/ML">머신러닝</a></li>
		</ul>
	</div>

</body>
</html>