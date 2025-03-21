package com.test.java.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/logoutok.do")
public class LogoutOk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //LogoutOk.java
        req.getSession().removeAttribute("auth");//티켓 삭제
        req.getSession().removeAttribute("name");//티켓 삭제
        req.getSession().removeAttribute("pic");//티켓 삭제
        
        //req.getSession().invalidate();//한번에 삭제
        
        resp.sendRedirect("/project/index.do");
    }
}
