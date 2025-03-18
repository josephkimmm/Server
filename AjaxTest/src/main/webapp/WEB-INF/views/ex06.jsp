<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- ex06.jsp -->
    <h1>Ajax <small>jQuery</small></h1>
    
    <div>
        <div><input type="text" id="txt1"></div>
        <div><input type="button" value="클릭" id="btn1"></div>
    </div>
    <div class="message" id="div1"></div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
    
        //tblInsa: 직원명 입력 > 직위명 반환
        /*
        $('#btn1').click(()=>{
            
            //ajax 객체 생성 + onreadystatechange + open + send() 호출
            $.ajax({
                type: 'GET',                        //open설정
                url: '/ajax/ex06data.do',           //open설정
                data: 'txt1=' + $('#txt1').val(),   //전송할 데이터
                success: function(result) {         //데이터 수신 > 콜백함수
                    //result == ajax.responseText
                    $('#div1').text(result);
                },
                error: function(a,b,c) {            //try-catch절의 catch역할
                    console.log(a,b,c);
                }
            }); //send() 호출
            
        });
        */
        
        /*
        $('#btn1').click(()=>{
            
            //보내기
            $.ajax({
                type: 'GET',
                url: '/ajax/ex06data.do',
                data: 'txt1=' + $('#txt1').val(),
                //success 생략 => 
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
            
        });
        */
        
        /*
        $('#btn1').click(()=>{
            
            //받기
            $.ajax({
                type: 'GET',
                url: '/ajax/ex06data.do',
                //data
                success: function(result) {
                    $('#div1').text(result);
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
            
        });
        */
        
        $('#btn1').click(()=>{
            
            //POST
            $.ajax({
                type: 'POST',                       
                url: '/ajax/ex06data.do',           
                data: 'txt1=' + $('#txt1').val(),   
                success: function(result) {         
                    $('#div1').text(result);
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
            
        });
    
    </script>
</body>
</html>














