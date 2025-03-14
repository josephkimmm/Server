<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	<style>
		
	</style>
</head>
<body>
	<!-- ex12_form.jsp -->
	<h1>버튼 만들기</h1>
	
	<form method="POST" action="ex12_ok.jsp">
	<table class="vertical">
		<tr>
			<th>너비(px)</th>
			<td><input type="number" name="width" value="120"></td>
		</tr>
		<tr>
			<th>높이(px)</th>
			<td><input type="number" name="height" value="30"></td>
		</tr>
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt" value="Button"></td>
		</tr>
		<tr>
			<th>배경색</th>
			<td><input type="color" name="bgColor" value="#FFFFFF"></td>
		</tr>
		<tr>
			<th>글자색</th>
			<td><input type="color" name="color" value="#FFFFFF"></td>
		</tr>
		<tr>
			<th>글자크기(px)</th>
			<td><input type="number" name="size" value="16"></td>
		</tr>
		<tr>
			<th>버튼 개수(ea)</th>
			<td><input type="number" name="qty" value="2"></td>
		</tr>
		<tr>
			<th>버튼 간격</th>
			<td>
				좌우간격: <input type="range" name="lrgap" value="-10"><br>
				상하간격: <input type="range" name="udgap" value="-10">
			</td>
		</tr>
		<tr>
			<th>아이콘</th>
			<td>
				<label><input type="radio" name="cb1" checked style="margin:5px;" value="없음">없음</label>
				<label><input type="radio" name="cb2" style="margin:5px;"><i class="fa-solid fa-camera"></i></label>
				<label><input type="radio" name="cb3" style="margin:5px;"><i class="fa-solid fa-truck"></i></label>
				<label><input type="radio" name="cb4" style="margin:5px;"><i class="fa-solid fa-bell"></i></label>
				<label><input type="radio" name="cb5" style="margin:5px;"><i class="fa-solid fa-thumbs-up"></i></label>
				<label><input type="radio" name="cb6" style="margin:5px;"><i class="fa-solid fa-envelope"></i></label>				
			</td>
		</tr>
		<tr>
			<th>테두리</th>
			<td>
			<select>
				<option name="sel1" value="감추기">감추기</option>
				<option name="sel2" value="보이기">보이기</option>
			</select>
			</td>
		</tr>
	</table>
	<div>
		<input type="submit" value="만들기">
	</div>
	</form>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>