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

<title>Contact US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

	<div class="container">
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