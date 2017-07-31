<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script type="text/javascript"
	src="http://swip.codylindley.com/jquery.popupWindow.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {   
	
	$("#join").popupWindow({ 
		   height:500, 
		   width:800, 
		   top:50, 
		   left:50 
		   }); 
	
   //체크박스 전체 선택/해제
   $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=colnames]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=colnames]").prop("checked",false);
        }
})
})
</script>
</head>
<body>
	<!-- 
${rData}<p>
${rData.colNames}<p>
${rData.data}<p>
-->

	<form id="select_col">
		<div>
			<h3>전처리완료</h3>
		</div>
		<div id="checkboxArea">
			<p>
				전체 선택<input type="checkbox" id="checkAll" />
			</p>
			<table border="1">
				<tr>
					<c:forEach var="colName" items="${refinedData.colNames}">
						<c:forEach var="colNameValue" items="${colName}">
							<th><input id="colnames" name="colnames" type="checkbox"
								data-toggle="checkbox" value="${colName}"> <label
								for="colnames">${colName}</label></th>
						</c:forEach>
					</c:forEach>
				</tr>
				<%--             <c:forEach var="i" begin="0" end="${fn:length(refinedData.data[0])-1}">
               <c:if test="${i le 100}">
                  <c:set var="row" value="${refinedData.data}" />
                  <tr>
                     <c:forEach var="data" items="${row}">
                        <td>${data[i]}</td>
                     </c:forEach>
                  </tr>
               </c:if>
            </c:forEach> --%>
			</table>
		</div>
	</form>

	<!-- 재구조화 열 저장 버튼 -->
	<div>
		<input type="submit" id="save" value="save" /> <input type="reset"
			id="reset" value="reset" />
	</div>

	<!-- 재구조화 타입 설정 및 테이블 출력 -->
	<div>
		<input type="submit" id="melt" value="melt" /> <input type="submit"
			id="cast" value="cast" /> <input type="submit" id="split"
			value="split" />
	</div>

	<div>
		<h3>재구조화 데이터 테이블</h3>
		<table border="1">
			<tr>
				<c:forEach var="colName" items="${restructuredData.colNames}">
					<th>${colName}</th>
				</c:forEach>
			</tr>
			<%--       <c:forEach var="i" begin="0" end="${fn:length(restructuredData.data[0])-1}">
         <c:if test="${i le 100}">
            <c:set var="row" value="${restructuredData.data}" />
            <tr>
               <c:forEach var="data" items="${row}">
                  <td>${data[i]}</td>
               </c:forEach>
            </tr>
         </c:if>
      </c:forEach> --%>
		</table>
	</div>

	<!-- 테이블 조인 & 리셋 -->
	<div>
		<a href="<c:url value="/analytics/list"/>" id="join"
			title="join 데이터 선택">JOIN</a> <input type="reset" id="reset"
			value="reset" />

	</div>
</body>
</html>