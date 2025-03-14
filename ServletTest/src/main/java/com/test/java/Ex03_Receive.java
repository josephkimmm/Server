package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex03_Receive extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //<input type="text" name="name">
        String name = req.getParameter("name");
        
        //<input type="number" name="age">
        String age = req.getParameter("age");
        
        
        //잘받았다고 결과 페이지 생성 > 반환
        resp.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();
        
        //System.out.println(String.format("홍길%d동", 10)); //정적 메서드
        //System.out.println("홍길%d동".formatted(10)); //객체 메서드
        
        writer.write("""
            <html>
            <head>
                <meta charset="UTF-8">
            </head>
            <body>
                <h1>받기</h1>
                <div>이름: %s</div>
                <div>나이: %s</div>
            </body>
            </html>   
            """.formatted(name, age));

        writer.close();
        
        
    }
    
}














