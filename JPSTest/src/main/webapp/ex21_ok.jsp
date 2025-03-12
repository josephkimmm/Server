<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.awt.DefaultFocusTraversalPolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//webapp > pic
	String path = application.getRealPath("/pic");
	System.out.println(path);
	
	int size = 1024 * 1024 *100; //100MB
	
	String filename = "";
	//String orgfilename = "";
	
	MultipartRequest multi = new MultipartRequest(
								request,
								path,
								size,
								"UTF-8",
								new DefaultFileRenamePolicy()
							);
	
	response.sendRedirect("ex21.jsp");
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
	<!-- ex21_ok.jsp -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>