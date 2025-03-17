package com.test.java;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;
import com.test.java.model.SurveyDTO;

@WebServlet("/ex01.do")
public class Ex01 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Ex01.java
        AjaxDAO dao = new AjaxDAO();
        List<SurveyDTO> list = dao.listSurvey();
        
        //req.setAttribute("list", list);
        req.setAttribute("dto", list.get(0));
        req.getRequestDispatcher("/WEB-INF/views/ex01.jsp").forward(req, resp);
    }
}
