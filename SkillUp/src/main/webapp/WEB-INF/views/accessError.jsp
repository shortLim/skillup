<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accessError.jsp</title>
</head>
<body>
	<h3>접근이 거부되었습니다.</h3>
	<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }"/><p>
	$msg : <c:out value="${msg }"/>
</body>
</html>






