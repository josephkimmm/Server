<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    //인증받지 못하거나 관리자가 아닌 사용자가 접근 > 처리 필요
    //인증받지 않은 사용자 검사
    if (session.getAttribute("auth") == null) {
        
        //response.sendRedirect("/auth/auth/login,jsp");
        
        out.println("<script>alert('invalid access');location.href='/auth/auth/login.jsp';</script>");
        out.close();
    }
    
    //관리자가 아닌 사용자 검사
    if (session.getAttribute("auth") == null
            || (int)session.getAttribute("lv") != 2) {
        
        //response.sendRedirect("/auth/auth/login,jsp");
        
        out.println("<script>alert('invalid access');location.href='/auth/auth/login.jsp';</script>");
        out.close();
    }

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
    <!-- admin.jsp -->
    <h1>관리자 전용 페이지</h1>
    
    <div>관리자만 접근 가능합니다.</div>
    
    <div>
        <a href="/auth/index.jsp">시작 페이지</a>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
        
    </script>
</body>
</html>






