<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	   /* 이 땅은 CSS 영역입니다. */
	</style>
</head>
<body>
    <!-- ex01.jsp -->
    <!--  
        
        서블릿
        - 자바 클래스 파일
        - 자바 코드 작성 > 용이
        - 클라이언트 코드 작성 > 불편(모든걸 문자열로 작성)
        - 자바 파일 > 브라우저 호출 불가능 > 가상 주소 매핑
        
        JSP
        - HTML 파일(베이스)
        - 클라이언트 코드 작성 > 용이
        - 자바 코드 작성 > 불편
        - 웹 기반 > 브라우저 호출 가능 > 가상 주소 필요(X)
    
    -->
    <h1>제목입니다.</h1>
    
    <%
         //자바 영역입니다.
         Calendar now = Calendar.getInstance();
    %>
    
    <div>현재 시각은 <%= String.format("%tT", now) %>입니다.</div>
    
    <%@ include file="./inc/copyright.jsp" %>
    
    <script>
         //JavaScript 영역입니다.
    </script>
</body>
</html>













