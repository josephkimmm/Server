package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;

@WebServlet("/ex08data.do")
public class Ex08Data extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Ex08Data.java
        String id = req.getParameter("id"); //넘긴 아이디 가져오기
        
        AjaxDAO dao = new AjaxDAO();
        int result = dao.checkId(id);
        
        PrintWriter writer = resp.getWriter();
        writer.print(result); // 0 or 1
        writer.close();
        
        
    }
}
