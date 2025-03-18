package com.test.java;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;
import com.test.java.model.ZipCodeDTO;

@WebServlet("/ex10.do")
public class Ex10 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Ex10.java
        
        req.setCharacterEncoding("UTF-8");
        String dong = req.getParameter("dong");
        
        AjaxDAO dao = new AjaxDAO();
        ArrayList<ZipCodeDTO> list = dao.listZipCode(dong);
        

        req.getRequestDispatcher("/WEB-INF/views/ex10.jsp").forward(req, resp);
    }
}
