<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 페이지</title>

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
html, body{
background-image : url("http://erotic-chaos.com/wp-content/uploads/2017/08/bg_001.jpg");
margin:0;
padding:0;
height:100%;
}

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

</head>

<body>
<jsp:include page="/WEB-INF/views/include/header_welcome.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

   <div class="container" style="font-family:'Noto Sans KR', sans-serif; color: #ebebeb; background-color: rgba( 0, 0, 0, 0.6 ); width: 530px; position: relative; top: 100px;">
      
      <div class="headheadhead" style="width: 500px;">
          <h1>내 정보 <small>DAIA Platform</small></h1>
       </div>
      <div class="row">&nbsp;</div>
         <label class="col-sm-12"><h4>아이디 : [ ${user.userId} ]</h4></label>
            <div class="row">&nbsp;</div>
           <label class="col-sm-12"><h4>이름 또는 별명 : [ ${user.userName} ]</h4></label>
              <div class="row">&nbsp;</div>
           <label class="col-sm-12"><h4>이메일 : [ ${user.userEmail} ]</h4></label>
              <div class="row">&nbsp;</div>
           <div class="col-sm-12" style="padding: 17px;" align="center">           
             <a href="/destiny/users/checkpw"><button class="btn btn-primary" style="font-size:14px; width: auto; height: 30px;" >정보 수정</button></a> <!-- <a href="/destiny/users/update/${user.userId}"> -->
             <a href="/destiny/users/withdraw"><button class="btn btn-danger" style="font-size:14px; width: auto; height: 30px;">회원 탈퇴</button></a>
             <input class="btn btn-warning" style="font-size:14px; width: auto; height: 30px;" type="button" value="취소" onclick="window.history.back(-1);return false;"/>
         </div>
   </div>
   
<!--    <div id="id01" class="modal">
         <form class="modal-content animate" action="greeting" method="post">
          <div class="imgcontainer">
               <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
               <img src="http://erotic-chaos.com/wp-content/uploads/2017/06/img_avatar2.jpg" alt="Avatar" class="avatar">
          </div>

          <div class="w3-container">
            <label><b>탈퇴하시려면 비밀번호를 입력해주세요.</b></label>
             <label><b>비밀번호</b></label>
               <input type="password" placeholder="Enter Password" name="userPw" required>
        
               <button type="submit">탈퇴하기</button>
          </div>
         <div>&nbsp;</div>
         
          <div class="w3-container" style="background-color:#f1f1f1">
               <button type="button1" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
          </div>
          <div>&nbsp;</div>   Line blank
        </form>   End Form
   </div>   End Modal(1) -->
   
<%--    <div class="w3-container">
     <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom" style="max-width:400px"> <!-- w3-card-4 -->

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <div style="color: red;" align="center"><span>탈퇴하시려면 비밀번호를 입력해주세요.</span></div>
      </div>
      

      <form class="w3-container" action="/destiny/users/withDraw" method="post">
        <div class="w3-section">
          <label>비밀번호</label>
          <input class="w3-input w3-border" type="text" placeholder="Enter userId" value="${user.userId}" name="userId" readonly>
          <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="userPw" required>          
        </div>
        <div>
          <button class="btn btn-danger" type="submit" onclick="return confirm('정말 탈퇴하시겠습니까?')">탈퇴하기</button>
        </div>
      </form>
    </div>
  </div>
</div> --%>


   <script type="text/javascript">
      // Get the modal
      var modal = document.getElementById('id01');

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
         if (event.target == modal) {
            modal.style.display = "none";
         } else if (event.target == modal2) {
            modal2.style.display = "none";
         }
      }
   </script>
   
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>