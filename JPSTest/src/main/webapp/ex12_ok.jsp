<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String txt = request.getParameter("txt");
	String bgColor = request.getParameter("bgColor");
	String color = request.getParameter("color");
	String size = request.getParameter("size");
	int qty = Integer.parseInt(request.getParameter("qty"));
	
	String lrgap = request.getParameter("lrgap");
	String udgap = request.getParameter("udgap");
	
	String cb1 = request.getParameter("cb1");
	String cb2 = request.getParameter("cb2");
	String cb3 = request.getParameter("cb3");
	String cb4 = request.getParameter("cb4");
	String cb5 = request.getParameter("cb5");
	String cb6 = request.getParameter("cb6");
	
	String sel1 = request.getParameter("sel1");
	String sel2 = request.getParameter("sel2");
	

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
	<!-- ex12_ok.jsp -->
	
	<h1>결과</h1>
	
	<form method="POST" action="ex12_form.jsp">
	<table>
		<tr>
			<th>버튼</th>
		</tr>
		<tr>
			<%for (int i=0; i<qty; i++) { %>
			<div style="border: 1px solid black; width: <%= width%>px; height: <%= height%>px; background-color: <%= bgColor%>; display: flex; justify-content: center; align-items: center; margin: 5px; float:left">
			<%= txt %>
			</div>
			<% } %>
		</tr>
	</table>
	<div>
		<input type="button" value="돌아가기">
	</div>
	</form>
	<hr>
	
	<h4>결과 페이지에 아래 CSS 적용할 것</h4>
	<textarea rows="50" cols="80" style="margin: 15px;">.button {
	padding-left: 0px;
}
.button::before {
	content: none;
}</textarea>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>