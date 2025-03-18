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
    <!-- ex09.jsp -->
    <h1>Ajax <small>전송 데이터 & 수신 데이터</small></h1>
    
    <h2>수신(응답) 데이터</h2>
    
    <h3>Text <small>ajax.responseText</small></h3>
    <div>
        <input type="button" value="확인" id="btn1">
        <div class="message" id="div1"></div>
    </div>
    
    <h3>Text <small>ajax.responseText</small></h3>
    <div>
        <input type="button" value="확인" id="btn2">
        <div class="message" id="div2"></div>
    </div>
    
    <h3>XML <small>ajax.responseXML</small></h3>
    <div>
        <input type="button" value="확인" id="btn3">
        <div class="message" id="div3"></div>
    </div>
    
    <h3>XML <small>ajax.responseXML</small></h3>
    <div>
        <input type="button" value="확인" id="btn4">
        <div class="message" id="div4"></div>
    </div>
    
    <h3>JSON</h3>
    <div>
        <input type="button" value="확인" id="btn5">
        <div class="message" id="div5"></div>
    </div>
    
    <h3>JSON</h3>
    <div>
        <input type="button" value="확인" id="btn6">
        <div class="message" id="div6"></div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
    
        /*
            $.ajax() 용법
            
            $.ajax({
                type: 'GET',                //메서드 방식
                url: '/ex01.do',            //서버측 URL
                async: true,                //동기(false), 비동기(true)
                data: 'key=value&key=value',//전송할 데이터
                dataType: 'text',           //수신할 데이터 형식(text,xml,json)
                success: function(result) {
                    console.log(result);    //수신 데이터
                },
                error: function(a,b,c) {
                    console.log(a,b,c);     //예외 처리
                }
            });
        
        */
        
        
        $('#btn1').click(()=>{
            //서버로부터 > 텍스트 반환 + 단일값 
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                
                //예제 구분용
                data: 'm=1',
                
                //돌려받는 데이터의 형식 > result의 형식
                dataType: 'text',
                
                success: function(result) {
                    $('#div1').text(result);
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
                
            });
        });
        
        $('#btn2').click(()=>{
            
            //서버로부터 > 텍스트 반환 + 다중값
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                data: 'm=2',
                dataType: 'text',
                success: function(result) {
                    /*
                        hong,1111,홍길동,1
                        dog,1111,강아지,1
                        cat,1111,고양이,2
                    */
                    //alert(result);
                    
                    const lines = result.trim().split('\r\n');
                    
                    lines.forEach(line => {
                        //hong,1111,홍길동,1
                        const colums = line.split(',');
                        $('#div2').append(`
                            <ul>
                                <li>아이디: \${colums[0]}</li>
                                <li>암호: \${colums[1]}</li>
                                <li>이름: \${colums[2]}</li>
                                <li>등급: \${colums[3]}</li>
                            </ul>
                        `);
                    });
                    
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
            
        });
        
        $('#btn3').click(()=>{
            
            //서버로부터 > XML 반환 + 단일값
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                data: 'm=3',
                dataType: 'xml',
                success: function(result) {
                    //alert(result);
                    //$(result).find('선택자')
                    //alert(result.documentElement.textContent);
                    
                    //alert($(result).find('result').text());
                    //alert($(result).find('#q1').text());
                    
                    $('#div3').text($(result).find('#q1').text());
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
        });
        
        $('#btn4').click(()=>{
            //서버로부터 > XML 반환 + 다중값
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                data: 'm=4',
                dataType: 'xml',
                success: function(result) {
                    
                    $(result).find('user').each((index, item)=>{
                        
                        //item == <user> 태그
                        let temp = '';
                        temp += '<ul>';
                        temp += `<li>아이디: \${$(item).find('id').text()}</li>`;
                        temp += `<li>암호: \${$(item).find('pw').text()}</li>`;
                        temp += `<li>이름: \${$(item).find('name').text()}</li>`;
                        temp += `<li>등급: \${$(item).find('lv').text()}</li>`;
                        temp += '</ul>';
                        
                        $('#div4').append(temp);
                        
                    });
                    
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
        });
        
        $('#btn5').click(()=>{
            //서버로부터 > JSON 반환 + 단일값
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                data: 'm=5',
                dataType: 'json',
                success: function(result) {
                    /*
                        result = {
                          "data": "자바스크립트"
                        }                   
                    */
                    //alert(result);
                    //console.log(result);
                    //alert(result.data);
                    //alert(result['data']);
                    
                    $('#div5').text(result.data);
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
        });
        
        $('#btn6').click(()=>{
            //서버로부터 > JSON 반환 + 다중값
            $.ajax({
                type: 'GET',
                url: '/ajax/ex09data.do',
                data: 'm=6',
                dataType: 'json',
                success: function(result) {
                    /*
                        [
                          {
                            "id": "hong",
                            "pw": "1111",
                            "name": "홍길동",
                            "lv": 1
                          },
                          {
                            "id": "dog",
                            "pw": "1111",
                            "name": "강아지",
                            "lv": 1
                          },
                          {
                            "id": "cat",
                            "pw": "1111",
                            "name": "고양이",
                            "lv": 2
                          }
                        ]
                    */
                    
                    //alert(result.constructor.name);
                    
                    result.forEach(user => {
                        $('#div6').append(`
                            <ul>
                                <li>\${user.id}</li>
                                <li>\${user.pw}</li>
                                <li>\${user.name}</li>
                                <li>\${user.lv}</li>
                            </ul>
                        `);
                    });
                    
                },
                error: function(a,b,c) {
                    console.log(a,b,c);
                }
            });
        });
        
    </script>
</body>
</html>
































