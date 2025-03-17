package com.test.java.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.util.DBUtil;

public class AjaxDAO {
    
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    private DBUtil util;
    
    public AjaxDAO() {
        try {
            util = new DBUtil();
            conn = util.open();
            stat = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<SurveyDTO> listSurvey() {
        
        try {
            
            List<SurveyDTO> list = new ArrayList<SurveyDTO>();
            
            String sql = "select * from tblSurvey where seq = 1";
            
            rs = stat.executeQuery(sql);
            
            while (rs.next()) {
                //레코드 1줄 > DTO 1개
                SurveyDTO dto = new SurveyDTO();
                dto.setSeq(rs.getString("seq"));
                dto.setQuestion(rs.getString("question"));
                dto.setItem1(rs.getString("item1"));
                dto.setItem2(rs.getString("item2"));
                dto.setItem3(rs.getString("item3"));
                dto.setItem4(rs.getString("item4"));
                dto.setCnt1(rs.getString("cnt1"));
                dto.setCnt2(rs.getString("cnt2"));
                dto.setCnt3(rs.getString("cnt3"));
                dto.setCnt4(rs.getString("cnt4"));
                
                list.add(dto);
            }
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public String getJikwi(String txt1) {
        
        try {
            
            String sql = "select jikwi from tblInsa where name = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, txt1);
            
            rs = pstat.executeQuery();
            
            if (rs.next()) {
                return rs.getString("jikwi");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public void updateBasicpay(String txt2) {
        
        try {
            
            String sql = "update tblInsa set basicpay = basicpay + 1000000 where name = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, txt2);
            
            pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

}























