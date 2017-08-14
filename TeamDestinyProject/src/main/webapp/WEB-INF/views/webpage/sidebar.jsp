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

<title>사이드바 테스트</title>

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
</head>

<body>

<input type="button" value="사이드 메뉴 감추기" class="button" style="cursor:pointer;"/>
<!-- <img src="/upload/Logo_Destiny.png" alt="button"  class="more_btn" style="cursor:pointer;"/> -->
<div class="side_bar" style="position:absolute; left:0px; top:5%; border:1px solid black;">
<ul>
<li>파일관리</li>
<li>데이터 전처리</li>
<li>데이터 재구조화</li>
<li>데이터 탐색</li>
<li>데이터 시각화</li>
<li>데이터 주성분분석</li>
<li>머신러닝</li>
</ul>
</div>

</body>
</html>