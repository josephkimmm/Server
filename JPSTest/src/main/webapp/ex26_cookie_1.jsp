<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		fieldset {
			width: 250px;
			margin: 1rem;
		}
		fieldset > input {
			height: 35px;
			display: block;
			margin-bottom: 5px;
		}
	</style>
</head>
<body>
	<!-- ex26_cookie_1.jsp -->
	<h1>첫번째 페이지 <small>색테마</small></h1>
	
	<div>
		<a href="ex26_cookie_1.jsp">첫번째 페이지</a>
		<a href="ex26_cookie_2.jsp">두번째 페이지</a>
		<a href="ex26_cookie_3.jsp">세번째 페이지</a>
	</div>
	
	<fieldset>
		<legend>Site Options</legend>
		<input type="color" id="color" value="#FFFFFF">
		<input type="button" value="테마 적용하기" id="btnApply">
		<input type="button" value="테마 삭제하기" id="btnClear">
	</fieldset>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script src="js/cookie.js"></script>
	<script>
	
		if (getCookie('color') != '') {
			$('body').css('background-color', getCookie('color'));
			$('#color').val(getCookie('color'));
		}
	
		$('#btnApply').click(()=>{
			$('body').css('background-color', $('#color').val());
			setCookie('color', $('#color').val(), 10);
		});
		
		$('#btnClear').click(()=>{
			$('body').css('background-color', '#FFFFFF');
			$('#color').val('#FFFFFF');
			
			//쿠키 삭제 > 기능 없음
			setCookie('color', '', -1);
		});
	
	</script>
</body>
</html>







