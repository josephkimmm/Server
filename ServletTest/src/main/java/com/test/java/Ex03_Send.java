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
    	
//    	writer.write("<!DOCTYPE html>\r\n"
//    			+ "<html lang=\"ko\">\r\n"
//    			+ "<head>\r\n"
//    			+ "    <meta charset=\"UTF-8\">\r\n"
//    			+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
//    			+ "    <title>Document</title>\r\n"
//    			+ "    <link rel=\"stylesheet\" href=\"css/jquery-ui.css\">\r\n"
//    			+ "    <style>\r\n"
//    			+ "    \r\n"
//    			+ "    </style>\r\n"
//    			+ "</head>\r\n"
//    			+ "<body>\r\n"
//    			+ "    \r\n"
//    			+ "    <!--  -->\r\n"
//    			+ "    <h1>보내기</h1>\r\n"
//    			+ "    <script>\r\n"
//    			+ "      \r\n"
//    			+ "    </script>\r\n"
//    			+ "</body>\r\n"
//    			+ "</html>"); // 미리 작성해서 paste하는 방법 > 간단하지만 유지보수 힘듦.
    	
    	writer.write("""
    			<html>
    			<head>
    				<meta charset="UTF-8">
    			</head>
    			<body>
    				<h1>보내기</h1>
    				<form method="GET" action="/servlet/ex03_receive.do">
    				<table border="1" width="300">
    					<tr>
    						<th>이름</th>
    						<td><input type="text" name="name"</td>
    					</tr>
    					<tr>
    						<th>나이</th>
    						<td><input type="number" name="age" size="10"></td>
    					</tr>
    				</table>
    				<div style="margin-top:10px">
    					<button>보내기</button>
    				</div>
    				</form>
    			</body>
    			</html>
    				""");
    	
        writer.close();
    }

}




















