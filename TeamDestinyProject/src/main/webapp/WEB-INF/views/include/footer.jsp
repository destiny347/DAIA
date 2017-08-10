<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.nt300{
font-family: 'Noto Sans KR', sans-serif;
color : white;
font-weight:300;
}
.nt400{
font-family: 'Noto Sans KR', sans-serif;
color : white;
font-weight:400;
}
.fa{
	margin: 0 10px 0 0;
} 

th, td {
	padding: 5px;
    text-align: center;
}

</style>

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
   <footer style="background-color:slateblue;">
   
   <div class="container">
      <div class="mailing col-sm-4" align="center">
         <h4 class="nt400">Mailing list</h4>
         	<table class="nt300">
               <tr><td>Sign up if you would like to receive</td></tr>
            </table>
            <form action='/subscribe' method="post" class="form-horizontal form-light" >
            	<div class="input-group col-sm-8" align="center">
                  <input type="email" name="email" class="form-control" placeholder="Your email address..." required /> 
                  <span class="input-group-btn">
                     <input type="submit" class="btn btn-base" value="GO!" />
                  </span>
            	</div>
            </form>
      </div>
      
         <div class="col-sm-4" align="center">
            <h4 class="nt400">Contact us</h4>
            <table class="nt300">
               <tr><td>010-2663-1401</td></tr>
               <tr><td><a href="mailto:hjk7902@gmail.com" title="Email Us" style="color:white;">BDplatform@gmail.com</a></td></tr>
               <tr><td><a href="http://www.BDplatform.co.kr" style="color:white;">http://www.BDplatform.co.kr</a></td></tr>
            </table>
         </div>
         
         <div class="col-sm-4" align="center">
               
               <h4 class="nt400">Follow us</h4>
               
               <div class="input-group col-sm-10" align="center">
               
               <a href="https://ko-kr.facebook.com/" style="color:white;"><i class="fa fa-facebook-square" style="font-size: 40px;"></i></a> 
               
               <a href="https://www.instagram.com/" style="color:white;"><i class="fa fa-instagram"   style="font-size: 40px;"></i></a> 
               
               <a href="https://twitter.com/?lang=ko" style="color:white;"><i class="fa fa-twitter"   style="font-size: 40px;"></i></a> 
               
               <a href="https://www.linkedin.com/" style="color:white;"><i class="fa fa-linkedin" style="font-size: 40px;"></i></a>
               
               </div>
            </div>
         
      </div>

   </footer>

</body>
</html>