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
	<!-- add.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<h2>메모 <small>쓰기</small></h2>
		
		<form method="POST" action="/project/memo/addok.do">
		<table class="vertical">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" required class="full"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" required class="full"></textarea></td>
			</tr>
		</table>
		<div>
			<button class="add">쓰기</button>
		</div>
		</form>
		
	</main>	
	
	<script>
		
	</script>
</body>
</html>






