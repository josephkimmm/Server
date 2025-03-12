package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 서블릿 클래스 선언 > 순수 자바 클래스(X), 서블릿 API 사용(O)
//a. javax.servlet.Servlet 인터페이스를 구현한다. > 복잡함. 고비용
//a. javax.servlet.http.HttpServlet 클래스를 상속한다. > 단순함. 저비용
public class Ex02 extends HttpServlet {
    
    // 2. doGet/doPost 메서드 선언
    //     a. 매개 변수 작성
    //         1. javax.servlet.http.HttpServletRequest
    //         2. javax.servlet.http.HttpServletResponse
    //     b. 예외 미루기
    //         1. java.io.IOException
    //         2. javax.servlet.ServletException
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        // 3. 동적 HTML 페이지 작성
        Random rnd = new Random();
        int dan = rnd.nextInt(8) + 2;
        
        //동적으로 생성된 HTML 파일 > 어디에 위치? > 톰캣이 관리
        //동적으로 생성된 HTML 파일 > 파일명?
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        
        writer.write("<html>");
        writer.write("<head>");
        writer.write("<meta charset='UTF-8'>");
        writer.write("</head>");
        writer.write("<body>");
        writer.write(String.format("<h1>%d단!!</h1>", dan));
        for (int i=1; i<=9; i++) {
            writer.write(String.format("<div>%d x %d = %d</div>", dan, i, dan * i));
        }
        writer.write("</body>");
        writer.write("</html>");
        
        writer.close();
        
        
    }

}

















