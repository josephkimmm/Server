package com.test.java;

import java.io.File;
import java.io.FileWriter;
import java.util.Random;

public class Ex01 {
    
    public static void main(String[] args) {
        
        //구구단 중 랜덤으로 하나 출력 > 웹 페이지로
        try {
            
            Random rnd = new Random();
            
            int dan = rnd.nextInt(8) + 2;
            
            //webapp 폴더 이하
            
            //C:\class\code\server\ServletTest\.
            //File file = new File(".");
            //System.out.println(file.getAbsolutePath());
            
            FileWriter writer = new FileWriter(".\\src\\main\\webapp\\ex01.html");
            
            
            
            writer.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}












