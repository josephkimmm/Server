<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Project</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		
		table th:nth-child(1) { width: 60px; }
		table th:nth-child(2) { width: auto; }
		table th:nth-child(3) { width: 140px; }
		table th:nth-child(4) { width: 140px; }
		table td { text-align: center; }
		table td:nth-child(2) { text-align: left; }
		
	</style>
</head>
<body>
	<!-- list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<h2>메모 <small>목록 보기</small></h2>
		
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.subject}</td>
				<td>${dto.name}(${dto.id})</td>
				<td>${dto.regdate}</td>
			</tr>
			</c:forEach>
		</table>
		<div>
			<c:if test="${not empty auth}">
			<button type="button" class="add" onclick="location.href='/project/memo/add.do';">쓰기</button>
			</c:if>
		</div>
		
	</main>	
	
	<script>
		
	</script>
</body>
</html>






