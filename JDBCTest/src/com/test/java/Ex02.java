package com.test.java;

import java.sql.Connection;
import java.sql.SQLException;

public class Ex02 {
    
    public static void main(String[] args) {
        
        /*
    
            접속 시 발생하는 에러
            
            1. 서버 주소X
            - 
    
        */
        
        Connection conn = null;
        DBUtil util = new DBUtil();
        
        System.out.println(111);
        conn = util.open();
        System.out.println(222);
        
        try {
            
            System.out.println(conn.isClosed());
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }

}











