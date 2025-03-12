<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String cbRemember = request.getParameter("cbRemember");
	
	if ((id.equals("hong") && pw.equals("1234"))
		|| (id.equals("test") && pw.equals("1234"))) {
		
		//로그인 성공
		// > 로그인 절차 진행~
		session.setAttribute("result", true);
		
		if (cbRemember != null && cbRemember.equals("y")) {
			
			//아이디 기억하기 > 쿠키에 저장
			Cookie cookie = new Cookie("id", id); //쿠키 생성
			
			//쿠키 만료 시각 지정하기
			cookie.setMaxAge(365 * 24 * 60 * 60); //초
			
			//서버에서 생성한 쿠키 객체 > (전달) > 클라이언트
			response.addCookie(cookie);
			
		} else {
			
			//기억했던 아이디를 지우기 > 쿠키 삭제 > 쿠키 만료 시각
			Cookie[] cookies = request.getCookies();
			
			for (int i=0; i<cookies.length; i++) {
				if (cookies[i].getName().equals("id")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);//브라우저에 적용
				}
			}
			
		}
		
	} else {
		//로그인 실패
		session.setAttribute("result", false);
		
	}
	
	response.sendRedirect("ex27_cookie.jsp");

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
	<!-- ex27_cookie_ok.jsp -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script src="js/cookie.js"></script>
	<script>
		
	</script>
</body>
</html>






