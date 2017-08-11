<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>알림창</title>
</head>
<body>

<script>
	alert('${errorPw}');
	location.href='<c:out value="${pageContext.request.contextPath}"/>${home}';
</script>

</body>
</html>