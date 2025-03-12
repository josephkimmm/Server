package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex03_Send extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setCharacterEncoding("UTF-8");    
        PrintWriter writer = resp.getWriter();
        
        writer.write("""
            <html>
            <head>
                <meta charset="UTF-8">
            </head>
            <body>
                <h1>보내기</h1>
                <form method="POST" action="/servlet/ex03_receive.do">
                <table border="1" width="300">
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" size="10"></td>
                    </tr>
                    <tr>
                        <th>나이</th>
                        <td><input type="number" name="age" size="10"></td>
                    </tr>
                </table>
                <div style="margin-top:10px;">
                    <button>보내기</button>
                </div>
                </form>
            </body>
            </html>
            """);
        
        writer.close();
        
    }

}




















