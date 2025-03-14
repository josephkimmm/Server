package com.test.java.data;

import java.util.ArrayList;

import com.test.java.model.BookDAO;
import com.test.java.model.BookDTO;

public class Ex03 {
    
    public static void main(String[] args) {
    
        BookDAO dao = new BookDAO();
        
        System.out.println(1111);
        
        ArrayList<BookDTO> list = dao.search("스프링부트", "1");
        
        for (BookDTO dto : list) {
            System.out.println(dto.getTitle());
        }
        
    }

}





