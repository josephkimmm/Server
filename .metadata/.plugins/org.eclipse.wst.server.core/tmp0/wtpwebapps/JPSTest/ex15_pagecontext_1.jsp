<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//웹은 상태관리가 안된다.(Stateless)
	int num = 100;

	pageContext.setAttribute("num", num);
	request.setAttribute("num", num);
	//response.sendRedirect vs pageContext.forward

	//response.sendRedirect("ex15_pagecontext_2.jsp");

	pageContext.forward("ex15_pagecontext_2.jsp");
	//pageContext.include("ex15_pagecontext_2.jsp");

%>
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
	<!--  -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>