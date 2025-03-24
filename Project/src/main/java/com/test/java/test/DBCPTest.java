package com.test.java.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/dbcptest.do")
public class DBCPTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DBCPTest.java
		
		req.getRequestDispatcher("/WEB-INF/views/test/dbcptest.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB 접속하기 > DBCP 확인
		DBCPDAO dao = new DBCPDAO(); //DB 접속(생성자 > 커넥션 객체 대여)
		System.out.println("conn: " + dao.getConn().hashCode()); //객체 식별자
		dao.close(); //명시적 호출(close())해야지만 반납이 처리		
		
		req.getRequestDispatcher("/WEB-INF/views/test/dbcptest.jsp").forward(req, resp);
	}

}













