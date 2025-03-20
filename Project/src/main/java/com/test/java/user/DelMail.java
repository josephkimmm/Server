package com.test.java.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.user.model.UserDAO;

@WebServlet("/user/delmail.do")
public class DelMail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelMail.java
		//1. 데이터 가져오기(email)
		//2. 인증 메일 > 삭제하기
		
		String email = req.getParameter("email");
		
		UserDAO dao = new UserDAO();
		dao.delEmail(email);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print("""
				{
					"result": 1
				}
				""");
		writer.close();		
		
	}

}









