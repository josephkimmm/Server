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
	<!-- ex25_cookie_2.jsp -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script src="js/cookie.js"></script>
	<script>
		
		$('#result').append('<div>' + getCookie('name') + '</div>');
		$('#result').append('<div>' + getCookie('kor') + '</div>');
		$('#result').append('<div>' + getCookie('eng') + '</div>');
		$('#result').append('<div>' + getCookie('math') + '</div>');
	
	</script>
</body>
</html>