package com.test.java.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.user.model.UserDAO;
import com.test.java.user.model.UserDTO;

@WebServlet("/user/info.do")
public class Info extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Info.java
        UserDAO dao = new UserDAO();//DB 다녀오기
        
        UserDTO dto = dao.getUser(req.getSession().getAttribute("auth").toString());
        
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/WEB-INF/views/user/info.jsp").forward(req, resp);
    }
}
