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
		//req.getSession().removeAttribute("auth");
		//req.getSession().removeAttribute("name");
		//req.getSession().removeAttribute("pic");
		
		req.getSession().invalidate(); //로그아웃
		
		resp.sendRedirect("/project/index.do");
		
	}

}










