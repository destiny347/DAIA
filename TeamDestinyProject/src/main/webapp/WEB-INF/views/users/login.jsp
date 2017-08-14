<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
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

</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
<!-- <div id="id01" class="modal">
   		<form class="modal-content animate" action="greeting" method="post"> -->
   		<form style="width: 500px;" class="" action="/destiny/greeting" method="post">
    		<div class="imgcontainer">
      			<img src="http://erotic-chaos.com/wp-content/uploads/2017/06/img_avatar2.jpg" alt="Avatar" class="avatar">
    		</div>

    		<div class="w3-container">
      			<label><b>이메일</b></label>
      			<input type="text" placeholder="Enter e-mail" name="userEmail" required>

			    <label><b>비밀번호</b></label>
      			<input type="password" placeholder="Enter Password" name="userPw" required>
        
      			<button type="submit">로그인</button>
      			<input type="checkbox" name="userCheck"> 기억하기
    		</div>
			<div>&nbsp;</div>
			
    		<div class="w3-container" style="background-color:#f1f1f1">
      			<button type="button1" class="cancelbtn"><a href="/destiny">취소</a></button> <!-- onclick="document.getElementById('id01').style.display='none'"  -->
      			&nbsp;      							
      			<span class="psw">Forgot <a href="#">password?</a></span>
    		</div>
    		<div>&nbsp;</div>	<!-- Line blank -->
<!--   		</form> End Form
	</div>	End Modal(1) -->
	</form>
</div>	<!-- End Container -->

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>