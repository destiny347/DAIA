<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap Core CSS -->

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/business-casual.css" rel="stylesheet">
    
<!-- jQuery -->
<script src="js/jquery.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<style>   
.radiobutton {
   height: 150px;
}
footer {
	clear: both;
}
</style>

<title>Destiny</title>

</head>
<body>
   <div class="col-lg-12 col-md-12 col-sm-12">
      <h1>선택한 열 정보</h1>
      <h3>데이터 명 : <input type="text" id="dataName"></h3>
      테스트!
   </div>
   
   <div class="col-lg-3 col-md-6 col-sm-6">
      <h3>결측치</h3>
         <table class="radiobutton">
            <tr>
            <td>
               <input type="radio" name="NaN" value="NaN">NaN
            </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <td>
               <input type="radio" name="Null" value="Null">Null
            </td>   
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
         </table>
         <table align=right>
            <tr>
            <td>
               <a href=""><input type="submit" value="변환"/></a>
            </td>
            <td>&nbsp;</td>
            <td>
               <a href="/myapp/upload/list"><input type="button" value="취소"/></a>
            </td>
            </tr>
         </table>
   </div>
   
   <div class="col-lg-3 col-md-6 col-sm-6">
      <h3>이상치</h3>
         <table class="radiobutton">
            <tr>
            <td>
               <input type="radio" name="Min" value="Min">Min
            </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <td>
               <input type="radio" name="Max" value="Max">Max
            </td>   
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <td>
               <input type="radio" name="Min" value="Min">Avg
            </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            <td>
               <input type="radio" name="Max" value="Max">기타 : <input type="text">
            </td>   
            </tr>
            <tr><td>&nbsp;</td></tr>
         </table>
         <table align=right>
            <tr>
            <td>
               <a href=""><input type="submit" value="변환"/></a>
            </td>
            <td>&nbsp;</td>
            <td>
               <a href="/destiny/upload/list"><input type="button" value="취소"/></a>
            </td>
            </tr>
         </table>
   </div>
</body>
<footer class="col-lg-6 col-md-6 col-sm-6" align=right>
	<table>
		<tr><td>&nbsp;</td></tr>
	</table>
	<a href="/destiny/analytics/restructuring"><input type="button" value="다음 단계로"/></a>
</footer>
</html>