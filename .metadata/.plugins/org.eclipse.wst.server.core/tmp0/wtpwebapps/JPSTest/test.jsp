<%@page import="java.util.Random"%>
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
	<!-- webapp > test.jsp -->
	<%
		Random rnd = new Random();
		String[] stat = { "당첨!!", "꽝;;", "다시 한번 기회를~" };
	%>
	<h1>당첨 결과~</h1>
	<div><%= stat[rnd.nextInt(stat.length)] %></div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






