package com.test.java.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/pool");
			
			conn = ds.getConnection();
			stat = conn.createStatement();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	public void addEmail(HashMap<String, String> map) {
		
		try {
			
			String sql = "insert into tblEmail (email, validnumber, regdate) values (?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("email"));
			pstat.setString(2, map.get("validNumber"));
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void delEmail(String email) {
		
		try {
			
			String sql = "delete from tblEmail where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			pstat.executeUpdate();				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int validEmail(HashMap<String, String> map) {
		
		try {
			
			String sql = "select count(*) as cnt from tblEmail where email = ? and validnumber = ?";
			
			System.out.println(map);
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("email"));
			pstat.setString(2, map.get("validNumber"));
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addUser(UserDTO dto) {
		
		try {
			
			String sql = "insert into tblUser (id, pw, name, email, pic, intro, regdate, ing) values (?, ?, ?, ?, ?, ?, default, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getPic());
			pstat.setString(6, dto.getIng());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public UserDTO login(UserDTO dto) {
		
		try {
			
			String sql = "select * from tblUser where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				//로그인 성공
				UserDTO result = new UserDTO();
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setPic(rs.getString("pic"));
				
				return result;
				
			} else {
				//로그인 실패
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public UserDTO getUser(String id) {
		
		try {
			
			String sql = "select * from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
			
				UserDTO result = new UserDTO();
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setPic(rs.getString("pic"));
				result.setEmail(rs.getString("email"));
				result.setIntro(rs.getString("intro"));
				result.setRegdate(rs.getString("regdate"));
				
				return result;
				
			} else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}











