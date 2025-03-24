<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Project</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		table {
			width: 400px !important; 
		}
	
		table tr:nth-child(1) td:nth-child(1) {
			width: 170px;
		}
		
		table tr:nth-child(1) td:nth-child(1) img {
			width: 150px;
			height: 150px;
			display: block;
			margin: 10px;
		}
		
		table tr:nth-child(4) {
			height: 100px;
		}
		
	</style>
</head>
<body>
	<!-- info.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<h2>회원 <small>자기 정보</small></h2>
		<table class="vertical content">
			<tr>
				<td rowspan="3"><img src="/project/asset/pic/${dto.pic}"></td>
				<td>${dto.name}(${dto.id})</td>
			</tr>
			<tr>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<td colspan="2">${dto.intro}</td>
			</tr>
		</table>
	</main>	
	
	<script>
		
	</script>
</body>
</html>






