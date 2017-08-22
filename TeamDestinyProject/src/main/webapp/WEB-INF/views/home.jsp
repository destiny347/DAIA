<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<title>DAIA Platform</title>

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

<script>

</script>

<style>
html, body{
	background-image : url("http://erotic-chaos.com/wp-content/uploads/2017/08/bg_001.jpg");
	margin:0;
	padding:0;
	height:100%;
}

html{
	margin:0;
	padding:0;
	height:100%;
}

body{
	position:relative;
	margin:0;
	height:100%;
}

footer{
    position:fixed;
    bottom:0;
    width:100%;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.ntm100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 100;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.ntㅡm00 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 400;
}
.nt500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 500;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 700;
}
.nt900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #ebebeb;
   font-weight: 900;
}

.main1{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	font-size: 24px;
	color : #ebebeb;
    text-align: center;
    animation: float-down 2s;    
    margin-top: 25%;
}
    
.main2{
	font-family: 'Noto Sans KR', sans-serif;
	color : #ebebeb;
    animation: float-down 2.4s;
}    

.box{
	width: 95%;
	background-color: #1e1e1e;
	margin: 0 auto;
}    

.start{
	display: inline-block;
	width: 180px;
	background-color: #1e1e1e;
	color: #ebebeb;
	margin-right: 10px;
}

.tutorial{
	display: inline-block;
	width: 180px;
	background-color: #1e1e1e;
	color: #ebebeb;
	margin-left: 10px;
}

.start:hover, .tutorial:hover{
	box-shadow: 0 0 16px 16px rgba(200,200,200,0.2), 0 0 20px 20px rgba(180,180,180,0.1);
}
    

@keyframes float-down{
    from
        {transform: translate(0px, -50px);
        opacity: 0;}
    to
        {transform: translate(0px, 0px);
        opacity: 1;
}

.blank{
	margin-top:10px;
	margin-bottom:10px;
}

</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>


<div class="container">
	<div class="box">
		<div class="main1" style="padding:12px 12px;">
		Data is not information, information is not knowledge, knowledge is not understanding, understanding is not wisdom. &nbsp;&nbsp; -Clifford Stoll
		</div>
	</div>

	<div class="col-sm-12" align="center">
		<div class="blank">&nbsp;</div>
		<div class="blank">&nbsp;</div>
	
		<div class="start">
			<div class="ntm400" style="text-align: center; padding: 12px 12px; font-size: 18px;">
				<div class="main2" style="cursor: pointer;" onclick="location.href='/destiny/upload/list'">바로 시작하기</div>
			</div>
		</div>
	
		<div class="tutorial">
			<div class="ntm400" style="text-align: center; padding: 12px 12px; font-size: 18px;">
				<div class="main2" style="cursor: pointer;" onclick="location.href='/destiny/aboutPrj'">튜토리얼 보기</div>
			</div>
		</div>
	</div>
</div>

</body>
<footer><jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include></footer>
</html>