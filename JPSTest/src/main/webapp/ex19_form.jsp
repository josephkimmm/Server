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
	<!-- ex19_form.jsp -->
	<h1>파일 업로드</h1>

	
	<form method="POST" action="ex19_ok.jsp" enctype="multipart/from-data">
	<table class="vertical">
		<tr>
			<th>문자열</th>
			<td><input type="text" name="txt"></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td><input type="file" name="attach"></td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>