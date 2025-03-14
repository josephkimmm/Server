<%@page import="com.test.java.data.Student"%>
<%@page import="java.util.HashMap"%>
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
	<!-- ex23_el.jsp -->
	
	<h1>EL</h1>
	
	<!-- 
		<%= 100 %> out. println()
	
	 -->
	<%
		//자바 변수(데이터) > 화면 출력
		int a = 10;
		
		//내장 객체
		pageContext.setAttribute("b", 20);
		request.setAttribute("c", 30);
		session.setAttribute("d", 40);
		session.setAttribute("b", 200);//컬렉션이 다르기때문에 위의 "b"와는 다르다.
		
	%>
	<h2>표현식</h2>
	<div>a: <%= a %></div>
	<div>b: <%= pageContext.getAttribute("b") %></div>
	<div>c: <%= request.getAttribute("c") %></div>
	<div>d: <%= session.getAttribute("d") %></div>
	<div>b: <%= session.getAttribute("b") %></div>
	
	<h2>EL</h2>
	<div>a: ${a}</div>
	<div>b: ${b}</div><!-- pageContext의 b -->
	<!-- <div>b: ${pageContext.getAttribute("b")}</div> -->
	<div>pageContext.b: ${pageScope.b}</div>
	<div>session.b: ${sessionScope.b}</div>
	<div>c: ${requestScope.c}</div>
	<div>d: ${b}</div>
	<!-- 
	<div>c: ${request.getAttribute("c")}</div>
	<div>d: ${session.getAttribute("b")}</div>
	 -->
	
	<%
	
		pageContext.setAttribute("n1", 10);
		pageContext.setAttribute("n2", 3);
	
	%>
	 
	<h2>EL 기능</h2>
	
	<h3>EL 연산 기능</h3>
	
	<div>n1 + 10 = <%= (int)pageContext.getAttribute("n1") + 10 %></div>
	<div>n1 + 10 = ${n1} + 10</div>
	<div>n1 + 10 = ${n1 + 10}</div>
	
	<div>n1 + n2 = <%= (int)pageContext.getAttribute("n1") + (int)pageContext.getAttribute("n2") %></div>
	<div>n1 + n2 = ${n1} + ${n2}</div>
	
	<div>n1 + n2 = ${n1 + n2}</div>
	<div>n1 - n2 = ${n1 - n2}</div>
	<div>n1 * n2 = ${n1 * n2}</div>
	<div>n1 / n2 = ${n1 / n2}</div>
	<div>n1 % n2 = ${n1 % n2}</div>
	<div>n1 mod n2 = ${n1 mod n2}</div>
	
	<hr>
	
	<div>n1 > n2 = ${n1 > n2 }</div>
	<div>n1 &gt; n2 = ${n1 gt n2 }</div>
	
	<div>n1 < n2 = ${n1 < n2 }</div>
	<div>n1 &lt; n2 = ${n1 lt n2 }</div>
	
	<div>n1 >= n2 = ${n1 >= n2 }</div>
	<div>n1 &gt;= n2 = ${n1 gt= n2 }</div>
	
	<div>n1 <= n2 = ${n1 <= n2 }</div>
	<div>n1 &lt;= n2 = ${n1 lt= n2 }</div>
	
	<div>n1 == n2 = ${n1 == n2 }</div>
	<div>n1 == n2 = ${n1 eq= n2 }</div>
	
	<div>n1 != n2 = ${n1 != n2 }</div>
	<div>n1 != n2 = ${n1 ne= n2 }</div>
	
	<hr>
	
	<div>${true && true}</div>
	<div>${true || false}</div><!-- java는 short-circuit을 지원하는데 
	좌측을 보고 연산을 파악할 수 있으면 우측을 실행하지 않는다. 연산속도를 높이고
	안정성을 유지하기위해서 사용됨(Dead Code) --> 
	<div>${!true}</div>
	
	<div>${true and true}</div>
	<div>${false or true}</div> 
	<div>${not true}</div>
	
	<hr>
	
	<div>${n1 > 0 ? "양수" : "음수" }</div>

	<hr>
	
	<!-- <div>${"홍길동".equals("홍길동")}</div> -->
	<div>${"홍길동" == "홍길동"}</div>
	
	<%
		HashMap<String, String> map = new HashMap();
		map.put("name", "홍길동");
		map.put("age", "20");
		map.put("address", "서울시");
		
		pageContext.setAttribute("map", map);
	%>
	<h3>객체 멤버 접근</h3>
	
	<div>이름: <%= map.get("name") %></div>
	<div>나이: <%= map.get("age") %></div>
	<div>주소: <%= map.get("address") %></div>
	
	
	<div>${map}</div>
	<div>이름: ${map.get("name")}</div>
	<div>이름: ${map["name"]}**</div> <!-- 키가 식별자로서 불완전할때 사용 -->
	<div>이름: ${map.name}***</div><!-- 멤버 프로퍼티로서 사용 -->
	
	<div>나이: ${map.age - 1}</div>
	<div>주소: ${map.address}</div>
	
	<%
		Student s1 = new Student();
	
		s1.setName("아무개");
		s1.setAge(25);
		s1.setAddress("서울시");
		
		pageContext.setAttribute("s1", s1);
	%>
	
	<div>이름: <%=s1.getName() %></div>
	<div>나이: <%=s1.getAge() %></div>
	<div>주소: <%=s1.getTest() %></div>
	
	<div>이름: ${s1.getName()}</div>
	<div>나이: ${s1["age"]}</div>
	<!-- <div>주소: ${s1.address}</div> --><!-- 멤버변수가 아니라 메서드 => getter -->
	
	<div>주소: ${s1.test}</div>
	
	<%
		Student s2 = null;
		pageContext.setAttribute("s2", s2);
		
		String s3 = "";
		pageContext.setAttribute("s3", s3);
	%>
	<div>${s2 == null}</div>
	<div>${s3 == null}</div>
	<div>${s3 == ""}</div>
	
	<div>${empty s2}</div>
	<div>${empty s3}</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>