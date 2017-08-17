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

<style>

.headhead {
	border-bottom: 1px solid #EAEAEA;
}
</style>

</head>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

	<div class="container" style="height: 300px;">
		<div class="headhead" style="width: 500px;">
    		<h1>내 정보 <small>BD Platform</small></h1>
    	</div>
		<div>&nbsp;</div>
		
        	<div class="row">
        		<label class="col-sm-4"><h4>이메일 : [ ${user.userEmail} ]</h4></label>
        	</div>
        	<div class="row">
        		<label class="col-sm-4"><h4>비밀번호 : [ ******** ]</h4></label>
	        </div>
        	<div class="row">
        		<label class="col-sm-4"><h4>이름 또는 별명 : [ ${user.userName} ]</h4></label>
	        </div>
	        <div class="row" style="padding: 17px;">  		   
    			<a href="/destiny/users/update/${user.userEmail}"><button class="btn btn-default" style="font-size:14px; width: auto; height: 30px;" >수정하기</button></a>
			</div>
	</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>