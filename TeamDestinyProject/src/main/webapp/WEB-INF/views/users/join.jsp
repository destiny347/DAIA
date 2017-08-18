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

<script>
function myFunction() {
    var txt;
    if (confirm("회원가입 하시겠습니까?") == true) {
        txt = "회원가입 되었습니다.";
    } else {
        txt = "회원가입이 취소 되었습니다.";
    }
    document.getElementById("demo").innerHTML = txt;
}
</script>

<style>
.headheadhead {
	border-bottom: 1px solid #EAEAEA;
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
</style>
</head>

<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function() {
    // JavaScript form validation
    var checkPassword = function(str)
    {
      var re = /^(?=.*\d)(?=.*[a-z]).{8,}$/;
      return re.test(str);
    };

    var checkForm = function(e)
    {
      if(this.inputId.value == "") {
        alert("Error: UserId cannot be blank!");
        this.inputId.focus();
        e.preventDefault(); // equivalent to return false
        return;
      }
      re = /^\w+$/;
      if(this.inputPassword.value != "" && this.inputPassword.value == this.inputPasswordCheck.value) {
        if(!checkPassword(this.inputPassword.value)) {
          alert("The password you have entered is not valid!");
          this.inputPassword.focus();
          e.preventDefault();
          return;
        }
      } else {
        alert("Error: Please check that you've entered and confirmed your password!");
        this.inputPassword.focus();
        e.preventDefault();
        return;
      }
      confirm("회원가입을 완료하시겠습니까?");
    };

    var myForm = document.getElementById("joinForm");
    myForm.addEventListener("submit", checkForm, true);

    // HTML5 form validation

    var supports_input_validity = function()
    {
      var i = document.createElement("input");
      return "setCustomValidity" in i;
    }

    if(supports_input_validity()) {
      var usernameInput = document.getElementById("inputId");
      usernameInput.setCustomValidity(usernameInput.title);

      var pwd1Input = document.getElementById("inputPassword");
      pwd1Input.setCustomValidity(pwd1Input.title);

      var pwd2Input = document.getElementById("inputPasswordCheck");

      // input key handlers

      usernameInput.addEventListener("keyup", function() {
        usernameInput.setCustomValidity(this.validity.patternMismatch ? usernameInput.title : "");
      }, false);

      pwd1Input.addEventListener("keyup", function() {
        this.setCustomValidity(this.validity.patternMismatch ? pwd1Input.title : "");
        if(this.checkValidity()) {
          pwd2Input.pattern = this.value;
          pwd2Input.setCustomValidity(pwd2Input.title);
        } else {
          pwd2Input.pattern = this.pattern;
          pwd2Input.setCustomValidity("");
        }
      }, false);

      pwd2Input.addEventListener("keyup", function() {
        this.setCustomValidity(this.validity.patternMismatch ? pwd2Input.title : "");
      }, false);

    }

  }, false);
</script>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

<div class="container">
	<div class="headheadhead">
    	<h1>회원가입 <small>DAIA Platform</small></h1>
    </div>
    <div>&nbsp;</div>

        <form id="joinForm" class="form-horizontal" action="/destiny/users/signUp" method="post">
        
        		<div class="form-group">
        			<label class="col-sm-2 control-label" for="inputEmail">(*)아이디</label>
        			<div class="col-sm-4">
          				<input class="form-control" id="inputId" type="text" name="userId" value="" title="아이디를 입력해주세요." placeholder="아이디" pattern="\w+" required>        		
        			</div>
        		</div>        		
        		
        		<div class="form-group">
          			<label class="col-sm-2 control-label" for="inputPassword">(*)비밀번호</label>
        			<div class="col-sm-4">
          				<input class="form-control" id="inputPassword" type="password" name="userPw" title="비밀번호는 영문/숫자 포함 8자 이상이어야 합니다." placeholder="비밀번호" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required>
        				<p class="help-block" style="color: red;" align="right">비밀번호는 영문/숫자 포함 8자 이상이어야 합니다.</p>
        			</div>
        		</div>
        		
        		<div class="form-group">
              		<label class="col-sm-2 control-label" for="inputPasswordCheck">(*)비밀번호 확인</label>
             		<div class="col-sm-4">
              			<input class="form-control" id="inputPasswordCheck" type="password" name="userPwCheck" title="위 비밀번호와 일치하지 않습니다." placeholder="비밀번호 확인" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required>
                		<p class="help-block" style="color: red;" align="right">비밀번호를 한번 더 입력해주세요.</p>
             		</div>
          		</div>
          		
          		<div class="form-group">
            		<label class="col-sm-2 control-label" for="inputName">(*)이름 또는 별명</label>
          			<div class="col-sm-4">
            			<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름 또는 별명" required>
          			</div>
        		</div>
        		        		  		
        		<div class="form-group">
        			<label class="col-sm-2 control-label" for="inputEmail">이메일</label>
        			<div class="col-sm-4">
          				<input class="form-control" id="inputEmail" type="email" name="userEmail" value="" title="이메일 주소의 형태로 입력해야 합니다." placeholder="이메일" required>        		
        			</div>
        		</div>
        		
				<div class="form-group">
          			<div class="col-sm-6 text-center">
            		<input class="btn btn-primary" type="submit" value="회원가입"/> <!-- onclick="return confirm('회원 가입을 완료하시겠습니까?')" -->
            		<a href="/destiny"><input class="btn btn-danger" type="button" value="취소"/></a> <!-- onclick="document.getElementById('id02').style.display='none'" -->
               		</div>
        		</div>
        	<div>&nbsp;</div> <!-- Line blank -->
        </form>	<!-- End Form -->

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>