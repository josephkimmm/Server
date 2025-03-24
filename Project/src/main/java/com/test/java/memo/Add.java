package com.test.java.memo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memo/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		
		//인증 티켓이 없으면 접근 불가능
//		HttpSession session = req.getSession();
//		
//		if (session.getAttribute("auth") == null) {
//			//응답이 이미 커밋된 후에는 forward할 수 없습니다.
//			resp.sendRedirect("/project/index.do");
//			return;
//		}

		req.getRequestDispatcher("/WEB-INF/views/memo/add.jsp").forward(req, resp);
	}

}









