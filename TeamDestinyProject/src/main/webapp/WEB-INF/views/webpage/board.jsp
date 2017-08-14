<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
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
	// Accordion 
	function myAccFunc() {
		var x = document.getElementById("demoAcc");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
		x.className = x.className.replace(" w3-show", "");
		}
	}

	// Click on the "Jeans" link on page load to open the accordion for demo purposes
	document.getElementById("myBtn").click();

	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}
	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}
</script>
				
<title>Board</title>

<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

caption{
	font-family: "Montserrat", sans-serif;
	font-size: 20px;
	font-style: oblique;
}

nav {
	float: left;
}

</style>
<script>
	
</script>
<body> <!-- class="w3-content" style="max-width: 1200px" -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- Sidebar/menu -->	
	 <!-- w3-sidebar  -->
	<div style="float: left;">
		<div class="w3-display-container w3-padding-16">
			<i onclick="w3_close()"
				class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
			<h3 class="w3-wide">
				<b>BD Platform</b>
			</h3>
		</div>
		<a onclick="myAccFunc()" href="javascript:void(0)"
			class="w3-button w3-block w3-white w3-left-align" id="myBtn"> 게시판
			<i class="fa fa-caret-down"></i>
		</a>
		<div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
			<table>
			<tr><td> <a href="#" class="w3-bar-item w3-button w3-light-grey">
					 	<i class="fa fa-caret-right w3-margin-right"></i>게시판
					 </a>
			</td></tr>
			<tr><td> <a href="#" class="w3-bar-item w3-button">공지사항</a> </td></tr>
			<tr><td> <a href="#" class="w3-bar-item w3-button">자주하는 질문</a> </td></tr>
			<tr><td> <a href="#" class="w3-bar-item w3-button" id="creatB">질문 작성</a> </td></tr>
			<tr><td> <a href="#" class="w3-bar-item w3-button">자료실</a> </td></tr> 
			</table>
		</div>
	<div>
		<table>
		<tr><td> <a href="" class="w3-bar-item w3-button w3-padding">Contact</a> </td></tr>
		<tr><td> <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding"
		   			onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a>
		</td></tr>   			
		<tr><td> <a href="#footer" class="w3-bar-item w3-button w3-padding">Subscribe</a> </td></tr>
		</table>
	</div>
	</div>
	<!-- Top menu on small screens -->
<!-- <header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
		<div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
		<a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-padding-24 w3-right"
			onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header> -->
	
<div class="container">

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="" style=""> <!--w3-main margin-left: 250px -->

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

 		<!-- Image header -->
 		<div class="w3-display-container"> <!--  w3-container -->
			<img
				src="https://c1.staticflickr.com/3/2808/12264548363_f9a26b699c_k.jpg"
				alt="Jeans" style="width: 100%">
			<div class="w3-display-topleft w3-text-white"
				style="padding: 24px 48px">
				<h1 class="w3-jumbo w3-hide-small">게시판</h1>
				<h1 class="w3-hide-large w3-hide-medium">2017</h1>
				<h1 class="w3-hide-small">BD Platform 2017</h1>
				<p>
					<a href="#jeans"
						class="w3-button w3-black w3-padding-large w3-large">SHOW NOW</a>
				</p>
			</div>
		</div>

		<div class="w3-text-grey" id="jeans"> <!-- w3-container  -->
			<p></p>
		</div>

		<!--  -->
		<div class="w3-row w3-grayscale" id="boardCreate">
			<div class="w3-col l3 s6">
				<div class="w3-container">
					<table summary="글쓰기 전체 테이블">
						<form name="BoardWriteForm" method="post" action="Board_Write_action.jsp" onsubmit="return boardWriteCheck();">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>

							<table summary="테이블 구성">
								<caption>질문 작성</caption>
								<tr>
									<td>작성자</td>
									<td><input type=text name=name size=10 maxlength=8></td>
								</tr>
								<tr>
									<td>E-Mail</td>
									<td><input type=text name=email size="width:auto;"></td>
								</tr>
								<tr>
									<td>홈페이지</td>
									<td><input type=text name=homepage size=30></td>
								</tr>
								<tr>
									<td>제 목</td>
									<td><input type=text name=title></td>
								</tr>
								<tr>
									<td>내 용</td>
									<td><textarea name=content rows="10" cols="100"></textarea></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type=password name=password size=15
										maxlength=15></td>
								</tr>
								<tr>
									<td colspan=2><hr size=1></td>
								</tr>
								<tr>
									<td colspan="2">
									<div align="center">
											<input type="submit" value="등록">&nbsp;&nbsp; 
											<input type="button" value="뒤로" onclick="move('Board_List.jsp');">
									</div>
									</td>
								</tr>
							</table>
						</form>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Subscribe section -->
	<div class="w3-white"> <!-- w3-container  -->
		<h1>Subscribe</h1>
			<p>To get special offers and VIP treatment:</p>
			<p>
				<input class="w3-input w3-border" type="text" placeholder="Enter e-mail" style="width: 100%">
			</p>
			<button type="button" class="w3-button w3-red w3-margin-bottom">Subscribe</button>
	</div>
</div>	<!-- End Container -->

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>