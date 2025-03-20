package com.test.java.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.user.model.UserDAO;

@WebServlet("/user/validmail.do")
public class ValidMail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ValidMail.java
		//1. 데이터 가져오기(email, validnumber)
		//2. DB 확인
		//3. 결과
		
		String email = req.getParameter("email");
		String validNumber = req.getParameter("validNumber");
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("validNumber", validNumber);
		
		UserDAO dao = new UserDAO();
		int result = dao.validEmail(map);
		
		if (result == 1) {
			dao.delEmail(email);//성공 > 삭제
		}
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print("""
				{
					"result": %d
				}
				""".formatted(result));
		writer.close();		
		
	}

}










