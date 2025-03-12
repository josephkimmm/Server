package com.test.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    
    public Connection open() {
        
        Connection conn = null;
        
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "server";
        String pw = "java1234";
        
        try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            conn = DriverManager.getConnection(url, id, pw);//open
            
            //SQL을 실행하기 전에!!
            //conn.setAutoCommit(false); //수동 트랜잭션 제어!
            
            return conn;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
        
    }
    
    public Connection open(String server, String id, String pw) {
        
        Connection conn = null;
        
        String url = "jdbc:oracle:thin:@" + server + ":1521:xe";
        
        try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            conn = DriverManager.getConnection(url, id, pw);
            
            return conn;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
        
    }

}



