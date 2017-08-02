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
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"">
</script>

<title>Destiny</title>

</head>

<body>
   <div class="col-lg-12 col-md-6 col-sm-6">
      <h4>검정통계량</h4>
      <table border=1 height=150px>
      	<tr>
      		<td>테스트! 이 자리에는 검정통계량 표가 나와야 합니다.</td>
      	</tr>      	
      </table>     
   </div>
   
   <div class="col-lg-12 col-md-12 col-sm-12">
      <table>
      	<tr><td>&nbsp;</td></tr>
      	<tr><td>&nbsp;</td></tr>
      	<tr><td>&nbsp;</td></tr>	
      </table>     
   </div>
   
   <div class="col-lg-4 col-md-3 col-sm-3">
      <h4>검증통계량 그래프</h4>
      <table border=1 height=300px>
      	<tr>
      		<td>테스트! 이 자리에는 검정통계량 그래프가 나와야 합니다.</td>
      	</tr>
      </table>
      
      <table>
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td>
            <a href=""><input type="submit" value="저장"/></a>
          </td>
          <td>&nbsp;</td>
          <td>
            <a href="/destiny/upload/list"><input type="button" value="취소"/></a>
          </td>
        </tr>
      </table>    
   </div>
      
</body>
</html>