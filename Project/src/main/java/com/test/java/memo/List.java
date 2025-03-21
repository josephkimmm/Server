package com.test.java.memo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.memo.model.MemoDAO;
import com.test.java.memo.model.MemoDTO;

@WebServlet("/memo/list.do")
public class List extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //List.java
        MemoDAO dao = new MemoDAO();
        
        ArrayList<MemoDTO> list = dao.list();
        
        req.setAttribute("list", list);

        req.getRequestDispatcher("/WEB-INF/views/memo/list.jsp").forward(req, resp);
    }
}
