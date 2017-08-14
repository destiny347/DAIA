<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 페이지</title>
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

</head>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>


<div class="container">
        <div class="row">
            <div class="box">               
                    <div class="col-lg-12 text-center">
                        <iframe width="1100" height="600" src="https://www.youtube.com/embed/EVaV7AwqBWg?rel=0&autoplay=1&loop=1&list=PLpSlDiXC0EEZiFDmw04BLvsbVCzS7c84N" frameborder="0" allowfullscreen></iframe>                               
                        </div> 
                    </div>
               </div>
	<div style="width: 100%; height: 500px; border:1px solid black;">
		메인페이지2
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>