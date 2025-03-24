<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Project</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		#remain {
			font-size: 12px;
			background: #EEE;
			padding: 3px 5px;
			border-radius: 3px;
			margin-left: 5px;
			display: none;
		}
		#remain > span {
			color: tomato;
		}
	</style>
</head>
<body>
	<!-- user > register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<h2>회원 <small>가입하기</small></h2>
		
		<form method="POST" action="/project/user/registerok.do" enctype="multipart/form-data">
		<table class="vertical">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required class="short"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" id="pw" required class="short"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" required class="short"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email" id="email" required class="long">
					<input type="button" value="이메일 인증" id="btnSend">
				</td>				
			</tr>
			<tr>
				<th>인증번호</th>
				<td>
					<input type="text" name="validnumber" id="validnumber" class="short">
					<input type="button" value="인증 확인" id="btnValid">
					<span id="remain"><span>05:00</span> 남았습니다.</span>
				</td>				
			</tr>
			<tr>
				<th>프로필 사진</th>
				<td><input type="file" name="pic" id="pic"></td>
			</tr>
			<tr>
				<th>프로필 소개</th>
				<td>
					<textarea name="intro" id="intro" class="full"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<button class="in" type="submit" disabled>가입하기</button>
		</div>
		</form>
		
	</main>	
	
	<script>
	
		let timer = 0;
	
		$('#btnSend').click(()=>{
			
			if ($('#email').val().trim() != '') {
				
				$.ajax({
					type: 'POST',
					url: '/project/user/sendmail.do',
					data: {
						email: $('#email').val()
					},
					dataType: 'json',
					success: function(result) {
						if (result.result == 1) {
							
							$('#remain').show();
							
							const remainTime = new Date();
							remainTime.setMinutes(5);
							remainTime.setSeconds(0);
							
							timer = setInterval(()=>{
								remainTime.setSeconds(remainTime.getSeconds() - 1);
								$('#remain > span').text(
									String(remainTime.getMinutes()).padStart(2,'0') 
									+ ':' 
									+ String(remainTime.getSeconds()).padStart(2,'0'));
								
								if ($('#remain > span').text() == '00:00') {
									//인증 시간 만료
									$.ajax({
										type: 'POST',
										url: '/project/user/delmail.do',
										data: {
											email: $('#email').val()
										},
										dataType: 'json',
										success: function(result) {
											if (result.result == 1) {
												clearInterval(timer);
												$('#remain').text('인증 시간이 만료되었습니다.');
											}
										},
										error: function(a,b,c) {
											console.log(a,b,c);
										}
									});
								}
								
							}, 1000);
							
						}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
			} else {
				alert('이메일 주소 입력!!');
			}
			
		});
		
		$('#btnValid').click(()=>{
			
			$.ajax({
				type: 'POST',
				url: '/project/user/validmail.do',
				data: {
					email: $('#email').val(),
					validNumber: $('#validnumber').val()
				},
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
						//인증 완료
						clearInterval(timer);
						$('#remain').text('인증이 완료되었습니다.');
						
						$('button[type=submit]').prop('disabled', false);
						
					} else {
						alert('인증 번호가 틀립니다.');
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		});
		
		
	
	</script>
</body>
</html>










