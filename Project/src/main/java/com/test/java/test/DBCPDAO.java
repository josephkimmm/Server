package com.test.java.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPDAO {
	
	private Connection conn;
	
	public DBCPDAO() {
		
		try {
			
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/pool");
			
			//커넥션풀에서 커넥션 1개를 대여
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public Connection getConn() {
		return conn;
	}
	
	public void close() {
		try {
			
			//DB 연결 해제(X) > DBCP에 반납
			this.conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}


















