<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		
	</style>
</head>
<body>
	<!-- hello.jsp -->
	<!-- 클라이언트에게는 jsp가 필요없다. -->
	<h1>Hello</h1>
	
	<div><%= request.getAttribute("name") %> 안녕하세요.</div>
	<div>${name}님 안녕하세요.</div>
	<!-- 서블릿이 건내줄때 다 request(내장객체)안에 들어있다. -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>