package com.test.java.memo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemoDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemoDAO() {
		
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
	

	public int add(MemoDTO dto) {
		
		try {
			
			String sql = "insert into tblMemo (seq, id, subject, content, regdate) values (seqMemo.nextVal, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<MemoDTO> list() {
		
		try {
			
			ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
			
			String sql = "select seq, subject, (select name from tblUser where id = tblMemo.id) as name, id, to_char(regdate, 'yyyy-mm-dd') as regdate from tblMemo order by seq desc";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				
				MemoDTO dto = new MemoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int check(String[] keyword) {
		
		try {
			
			//String sql = "select count(*) as cnt from tblMemo where subject like '%자바%' or content like '%자바%";
			//String sql = "select count(*) as cnt from tblMemo where subject like '%오라클%' or content like '%오라클%";
			//String sql = "select count(*) as cnt from tblMemo where subject like '%버그%' or content like '%버그%";
			
			int cnt = 0;
			
			String sql = "select count(*) as cnt from tblMemo where (subject like '%' || ? || '%' or content like '%' || ? || '%') and regdate > sysdate - 1 ";
			
			pstat = conn.prepareStatement(sql);
			
			for (String word : keyword) {
				pstat.setString(1, word);
				pstat.setString(2, word);
				
				rs = pstat.executeQuery();
				
				if (rs.next()) {
					cnt += rs.getInt("cnt");
				}
				
				rs.close();
			}
			
			return cnt;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}










