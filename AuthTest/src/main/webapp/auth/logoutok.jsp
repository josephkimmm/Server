<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    //1. 인증 티켓 삭제
    //session.removeAttribute("auth"); //로그아웃
    //session.removeAttribute("name"); 
    //session.removeAttribute("lv"); 
    
    session.invalidate();//세션 파괴(확실하게 지울 수 있는 방법) > but 꼭 좋은 방법은 아님, 필요한 세션도 같이 날아감.
    
    response.sendRedirect("/auth/index.jsp");

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
	<!-- logout.jsp 로그아웃 처리 페이지 > 인증 -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>