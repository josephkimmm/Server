<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- ex04.jsp -->
	<h1>Ajax</h1>
	
	<!-- 버튼 클릭 > 서버에 데이터를 가져와서 화면에 출력하기 -->
	<div>
	   <input type="button" value="설문 제목 가져오기" id="btn1">
	   <hr>
	   <pre class="message"></pre>
	</div> 
	<hr>
	<div>
	   다른 콘텐츠: <input type="text">
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		/* $('#btn1').click(()=>{//자기자신을 다시 부름
			location.href='/ajax/ex04.do?data=y'; 
		}); */
		
		<%-- <c:if test="${not empty question}">
		$('.message').text('${question}');
		</c:if> --%>
		
		$('#btn1').click(()=>{
			
			//ajax 객체 역할 > 눈에 안보이는 브라우저
            //               > 눈에 안보이는 전화기(무전기)(***)
            //               > 눈에 안보이는 통신도구(서버와 통신)
            //               > 눈에 안보이는 == 렌더링 안함(***)
            //               > 브라우저(X) > ajax 객체는 HTMl,CSS, JavaScript 실행 능력 X(*****)
			const ajax = new XMLHttpRequest();
            
            //ReadyState > 변경될 때 발생
            ajax.onreadystatechange = function() {
            	//$('.message').append('<div>이벤트 + ajax.readtState + 발생</div>');
            	
            	if (ajax.readyState == 4 && ajax.status == 200) {
            		$('.message').append('<div>데이터 수신 완료!!</div>');
            		$('.message').append('<div>' + ajax.responseText + '</div>'); //서버가 나에게 돌려줄 데이터
            	
            		//console.log(ajax.responseText);//순수 텍스트 
            		
            	} else if (ajax.readyState == 4 && ajax.status !== 200) {
            		$('.message').appned('<div>서버에 오류가 발생했습니다.</div>');
            	}
            	
            };
            
            //ajax 객체가 통신을 하게될 서버측 정보 설정
            
            //<form method="GET" action="/ajax/ex01.do">
            ajax.open('GET', '/ajax/ex04data.do'); //연결(X), 설정(O)
            
            ajax.send(); //submit 버튼 클릭 역할 > ajax 객체가 위에서 설정한 서버에게 요청 발생 > 통신 요청 발생!            
        }); //btn1.click
		
	</script>
</body>
</html>