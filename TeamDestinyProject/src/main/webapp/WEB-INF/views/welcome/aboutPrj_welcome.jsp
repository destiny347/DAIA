<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript">  
$(document).ready(function(){
	$("#table").hide();
	$("#fs_btn1").click(function(){
		$("#table").toggle();
	});
});

$(document).ready(function(){
	$("#table").hide();
	$("#fs_btn2").click(function(){
		$("#table").toggle();
	});
});

$(document).ready(function(){
	$("#table").hide();
	$("#fs_btn3").click(function(){
		$("#table").toggle();
	});
});
</script>

<title>프로젝트 소개</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

	<div class="container">
	<div class="" id="projects">
		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Projects</h3>
	</div>

	<!-- 동영상 -->
	<p id="centerText" align="center">Big Data analysis Platform</p>

	<div class="w3-row-padding" align="center">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/vyRC1bUAwFE" frameborder="0"
			allowfullscreen></iframe>
		<a href="project.html"></a>
	</div>
	
	<!-- phase1 -->
	<div class="w3-row-padding">
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div id="phase1">
				<div class="dropdown">
					<h4 style="text-align: center">File Upload</h4>
					<img name="proImg"
						src="http://erotic-chaos.com/wp-content/uploads/2017/06//phase1.png"
						alt="Trolltunga Norway" width="200">
					<div class="dropdown-content">
						<img name="proImg"
							src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase1.png"
							alt="Trolltunga Norway" width="250">
						<div class="desc">
							분석하고 싶은 데이터를<br>csv 파일로 올려주세요.
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- phase2 -->
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div id="phase2">
				<div class="dropdown">
					<h4 style="text-align: center">Data Table</h4>
					<img name="proImg"
						src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase2.png"
						alt="Trolltunga Norway" width="220" height="230">
					<div class="dropdown-content">
						<img name="proImg"
							src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase2.png"
							alt="Trolltunga Norway" width="255" height="230">
						<div class="desc">업로드한 데이터를 한 눈에 볼 수 있는 데이터 테이블이 제공됩니다.</div>
					</div>
				</div>

			</div>
		</div>
		
		<!-- phase3 -->
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div id="phase3">
				<div class="dropdown">
					<h4 style="text-align: center">Choose Columns</h4>
					<img name="proImg"
						src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase3.png"
						alt="Trolltunga Norway" width="220" height="230">
					<div class="dropdown-content">
						<img name="proImg"
							src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase3.png"
							alt="Trolltunga Norway" width="250" height="230">
						<div class="desc">특별한 분석을 원하는 column을 체크해 주세요.</div>
					</div>
				</div>

			</div>
		</div>
		
		<!-- phase4 -->
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div id="phase4">
				<div class="dropdown">
					<h4 style="text-align: center">Analyze</h4>
					<img name="proImg"
						src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase4.png"
						alt="Trolltunga Norway" width="200" height="230">
					<div class="dropdown-content">
						<img
							src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase4.png"
							alt="Trolltunga Norway" width="220">
						<div class="desc">분석을 시작합니다.</div>
					</div>
				</div>
			</div>
		</div>

		<!-- phase5 -->
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div id="phase5">
				<div class="dropdown">
					<h4 style="text-align: center">Visualization - Graph</h4>
					<img name="proImg"
						src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase5.jpg"
						alt="Trolltunga Norway" width="230">
					<div class="dropdown-content">
						<img
							src="http://erotic-chaos.com/wp-content/uploads/2017/06/phase5.jpg"
							alt="Trolltunga Norway" width="255">
						<div class="desc">다양한 그래프 형태로 분석 결과를 확인해 보세요.</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>