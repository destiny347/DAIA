<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

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
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
	<div class="headhead">
    	<h1>회원가입 <small>BD Platform</small></h1>
    </div>
    <div>&nbsp;</div>

        <form class="form-horizontal" action="/destiny/users/signUp" method="post">  		
        		<div class="form-group">
        			<label class="col-sm-2 control-label" for="inputEmail">* 이메일</label>
        			<div class="col-sm-4">
          				<input class="form-control" id="inputEmail" type="email" name="userEmail" placeholder="이메일" required>        		
        			</div>
        		</div>
        		
        		<div class="form-group">
          			<label class="col-sm-2 control-label" for="inputPassword">* 비밀번호</label>
        			<div class="col-sm-4">
          				<input class="form-control" id="inputPassword" type="password" name="userPw" placeholder="비밀번호" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required>
        				<p class="help-block">비밀번호는 숫자 포함 8자 이상이여야 합니다.</p>
        			</div>
        		</div>
        		
        		<div class="form-group">
              		<label class="col-sm-2 control-label" for="inputPasswordCheck">* 비밀번호 확인</label>
             		<div class="col-sm-4">
              			<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required>
                		<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             		</div>
          		</div>
          		
          		<div class="form-group">
            		<label class="col-sm-2 control-label" for="inputName">* 이름 또는 별명</label>
          			<div class="col-sm-4">
            			<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름 또는 별명" required>
          			</div>
        		</div>
        		
        		
<!--          		<div class="form-group">
            		<label class="col-sm-3 control-label" for="inputGender">성별</label>
              		<div class="col-sm-9">
              			<label class="radio-inline">
              				<input type="radio" id="optionsRadios1" name="userGender" value="여성">여성
              			</label>
                  		<label class="radio-inline">
              				<input type="radio" id="optionsRadios2" name="userGender" value="남성">남성
              			</label>
              		</div>
        		</div>
        		<div>&nbsp;</div>
        		
        		<div class="form-group">
            		<label class="col-sm-3 control-label" for="inputNumber">휴대폰 번호</label>
              		<div class="col-sm-9">
                  		<input class="form-control" id="inputNumber" type="tel" name="userPhone" placeholder="- 없이 입력해 주세요">
              		</div>
        		</div>
				<div>&nbsp;</div> -->
				
				<div class="form-group">
          			<div class="col-sm-6 text-center">
            		<input class="btn btn-primary"  type="submit" value="회원가입"/> <!-- onclick="return confirm('회원 가입을 완료하시겠습니까?')" -->
            		<a href="/destiny"><input class="btn btn-danger" type="button" value="취소"/></a> <!-- onclick="document.getElementById('id02').style.display='none'" -->
               		</div>
        		</div>
        	<div>&nbsp;</div> <!-- Line blank -->
        </form>	<!-- End Form -->

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>