package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
        
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //PrintWriter writer = resp.getWriter();
        //writer.write("<h1>Hello<h1>");
        
        //업무 코드 작성
        // - DB 작업 > select
        String name = "홍길동";
        
        req.setAttribute("name", name);
        
        //resp.sendRedirect("/mvc/hello.jsp");//자바코드이지만 webapp > hello
        //pageContext.forward("/mvc/hellow.jsp");
        //Servlet에서 pageContext에 접근X
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/hello.jsp"); // webapp > hello
        dispatcher.forward(req, resp);
        // == pageContext.forward("/mvc/hellow.jsp");
        //클라이언트 입장에서 더 자연스럽다.
    }
}
