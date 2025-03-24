<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Project</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		
	</style>
</head>
<body>
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<h2>회원 <small>로그인</small></h2>
		
		<form method="POST" action="/project/user/loginok.do">
		<table class="content">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required class="short" autofocus></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" required class="short"></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="in">로그인</button>
		</div>
		</form>
		
		
		<!-- 개발용 -->
		<hr>
		<div>
			<form method="POST" action="/project/user/loginok.do">
				<input type="hidden" name="id" value="hong">
				<input type="hidden" name="pw" value="1111">
				<button type="submit" class="in">로그인(홍길동)</button>
			</form>
		</div>
		<div>
			<form method="POST" action="/project/user/loginok.do">
				<input type="hidden" name="id" value="test">
				<input type="hidden" name="pw" value="1111">
				<button type="submit" class="in">로그인(테스트)</button>
			</form>
		</div>
		
		
	</main>	
	
	<script>
		
	</script>
</body>
</html>






