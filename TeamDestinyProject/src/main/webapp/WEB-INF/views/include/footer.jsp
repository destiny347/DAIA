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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- BootStrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>footer</title>
</head>

<body>

<!-- Footer -->
	<footer class="w3-center w3-black w3-padding-16">
	<div class="container">
		<div class="w3-row-padding w3-grayscale">
			<div class="w3-col l3 m6 w3-margin-bottom">
				<h4>Mailing list</h4>
				<p>Sign up if you would like to receive</p>
				<form action='/subscribe' method="post"	class="form-horizontal form-light">
					<div class="input-group">
						<input type="email" name="email" class="form-control" placeholder="Your email address..." required> 
							<span class="input-group-btn">
								<input type="submit" class="btn btn-base" value="GO!">
							</span>
					</div>
				</form>
			</div>
			
			<div class="w3-col l3 m6 w3-margin-bottom">
				<h4>About us</h4>
				<p class="no-margin">Big data</p>
			</div>
			
			<div class="w3-col l3 m6 w3-margin-bottom">
				<h4>Contact us</h4>
				<table align=center>
					<tr><td>Phone: 000 0000 0000</td></tr>
					<tr><td>Email: <a href="mailto:hjk7902@gmail.com" title="Email Us">BDplatform@gmail.com</a></td></tr>
					<tr><td><a href="http://www.BDplatform.co.kr">http://www.BDplatform.co.kr</a></td></tr>
				</table>
			</div>
			
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="col col-social-icons">
					<h4>Follow us</h4>
					<a href="https://ko-kr.facebook.com/"><i class="fa fa-facebook-square" style="font-size: 40px;"></i></a> 
					<a href="https://www.instagram.com/"><i class="fa fa-instagram"	style="font-size: 40px;"></i></a> 
					<a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"	style="font-size: 40px;"></i></a> 
					<a href="https://www.linkedin.com/"><i class="fa fa-linkedin" style="font-size: 40px;"></i></a>
				</div>
			</div>
		</div>
	</div>
	</footer>

</body>
</html>