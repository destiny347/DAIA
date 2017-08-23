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
$(document).ready(function() {
   $("#send").click(function(){   
       alert("소중한 의견 감사드립니다.");      
   });
});
</script>

<title>Contact US</title>
</head>
<style>
html, body{
	background-image : url("http://erotic-chaos.com/wp-content/uploads/2017/08/bg_001.jpg");
	margin:0;
	padding:0;
	height:100%;
}

#map {
   height: 400px;
   width: 100%;
}
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.nt100 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 100;
}
.nt300 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 300;
}
<!-- 레귤러 폰트 -->
.nt400 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 400;
}
.nt500 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 500;
}
.nt700 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 700;
}
.nt900 {
   font-family: 'Noto Sans KR', sans-serif;
   color: #1e1e1e;
   font-weight: 900;
}
</style>
<body>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

   <div class="container" style="font-family:'Noto Sans KR', sans-serif; color: #ebebeb; background-color: rgba( 0, 0, 0, 0.8 );">
      <div class="col-sm-12">
      <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">Map</h2>
      <div id="map"></div>
      </div>
      <script>
      function initMap() {
        var uluru = {lat: 37.495361, lng: 127.122376};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMOH8JKPTynKmgWaKl6wSfkyt7CGj4Nl0&callback=initMap">
    </script>

      <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" id="contact">
         <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h2>
         <label>Lets get in touch and talk about your and our next project.</label>
         <form action="/action_page.php" target="_blank">
            <input class="w3-input" type="text" placeholder="Name" required name="Name"> 
            <input class="w3-input w3-section" type="text" placeholder="Email" required name="Email"> 
            <input class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject"> <input class="w3-input w3-section"
                     type="text" placeholder="Comment" required name="Comment">
            <button class="w3-button w3-blue w3-section" type="button" id="send">
               <i class="fa fa-paper-plane"></i> SEND MESSAGE
            </button>
         </form>
      </div>

   </div>

   <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>