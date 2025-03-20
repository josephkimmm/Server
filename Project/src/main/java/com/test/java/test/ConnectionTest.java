package com.test.java.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/test/testconnection.do")
public class ConnectionTest extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		testConnection();
	}
	
	public void testConnection() {
		
		/*
		
			DB 연결 방식
			
			1. 기존 방식
			- 필요 시 > Connection 객체 생성 > 사용 > 소멸
		 
		 	2. 새로운 방식
		 	- 커넥션 풀(Connection Pool)
		 	- Connection 객체들을 관리하는 시스템
		 
		*/
		
		//데이터베이스 연결
		try {
			
			Connection conn = null;
			
			//Context.xml 읽기 > JDNI
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			
			//데이터 소스 반환
			DataSource ds = (DataSource)env.lookup("jdbc/pool");
			
			//데이터베이스 연결
			conn = ds.getConnection();
			
			Statement stat = conn.createStatement();
			
			ResultSet rs = stat.executeQuery("select count(*) as cnt from tblUser");
			
			if (rs.next()) {
				System.out.println(rs.getInt("cnt"));
			}
			
			
			System.out.println(conn.isClosed()); //false
			
			
			//커넥션 풀 사용X > 연결 종료(O)
			//커넥션 풀 사용O > 연결 종료(X) > 풀에 반환해라!!
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}




























