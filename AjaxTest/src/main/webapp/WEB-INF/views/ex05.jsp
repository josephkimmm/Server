<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <style>
        body > div > div { margin-bottom: 5px; }
    </style>  
</head>
<body>
    <!-- ex05.jsp -->
    <h1>Ajax</h1>
    <!--  
        1. GET
        - 주고 + 받기
    -->
    <div>
        <div><input type="text" id="txt1"></div><!-- 주고 -->
        <div><input type="button" value="확인" id="btn1"></div>
        <div id="div1"></div><!-- 받기 -->
    </div>
    <hr>
    <!-- 
        2. GET
        - 주기
     -->
     <div>
        <div><input type="text" id="txt2"></div>
        <div><input type="button" value="확인" id="btn2"></div>
     </div>
    <hr>
    <!-- 
        3. GET
        - 받기
     -->
    <div>
        <div><input type="button" value="확인" id="btn3"></div>
        <div id="div3"></div><!-- 받기 -->
    </div> 
    <hr>
    <!--  
        4. POST
        - 주고 + 받기
    -->
    
    <div>
        <div><input type="text" id="txt4"></div>
        <div><input type="button" value="확인" id="btn4"></div>
        <div id="div4"></div>
    </div>
    <hr>
    <!--  
        5. GET/POST
        - 주고 + 받기
    -->
    
    <div>
        <div><input type="text" id="txt5"></div>
        <div><input type="button" value="확인" id="btn5"></div>
        <div id="div5"></div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
    
        $('#btn1').click(() => {
            
            
            const ajax = new XMLHttpRequest();
            
            ajax.onreadystatechange = function(evt) {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    //서버로부터 응답이 오면 실행해야 하는 코드 작성
                    $('#div1').text(ajax.responseText);
                }
            };
            
            //GET + 데이터 전송 = Query String
            ajax.open('GET'
            		   , '/ajax/ex05data.do?txt1=' + $('#txt1').val()
            		   , false); //false(동기), true(비동기);
            
            ajax.send();
            
        });//btn1.click
    
        $('#btn2').click(()=>{
        	
        	const ajax = new XMLHttpRequest();
        	
        	//ajax.onreadystatechange = function() {}; 가져올 데이터가 있을때만 생성(지금은 주기만)
        	
        	ajax.open('GET', '/ajax/ex05data.do?txt2=' + $('txt2').val());//GET방식이라 Parameter사용
        	
        	ajax.send();
        	
        });
        
        $('#btn3').click(() => {
            
            const ajax = new XMLHttpRequest();
            
            ajax.onreadystatechange = function(evt) {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    $('#div3').text(ajax.responseText);
                }
            };
            
            //데이터 전송(X)
            ajax.open('GET', '/ajax/ex05data.do');
            
            ajax.send();
            
        });//btn3.click
        
        $('#btn4').click(()=>{
            
            const ajax = new XMLHttpRequest();
            
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    //여기부터 업무 코드
                    $('#div4').text(ajax.responseText);
                }
            };
            
            ajax.open('POST', '/ajax/ex05data.do');
            
            ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded'); //<form enctype="기본값">
            
            //POST + send()의 인자값으로 데이터 전송
            ajax.send('txt4=' + $('#txt4').val());
            
        });
        
        //jQuery
        $('#btn5').click(()=>{
            
        	//$(선택자).css()
        	
        	$.ajax({//jQuery: 매개변수를 통제하기위해 객체를 넘김
        		
        		type: 'GET',
        		url: '/ajax/ex05.data.do',
        		
        		//데이터 전송
        		data: 'txt1=홍길동',
        		
        		//결과 > 데이터 수신 > 비동기(이벤트)
        		success: function() {
        			$('#div5').text(result);//ajax.responseText
        		}
        		
        	});
        });
        
        
    </script>
</body>
</html>














