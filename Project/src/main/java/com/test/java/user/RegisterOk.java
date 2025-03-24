package com.test.java.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.java.user.model.UserDAO;
import com.test.java.user.model.UserDTO;

@WebServlet("/user/registerok.do")
public class RegisterOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RegisterOk.java
		//1. 데이터 가져오기
		//2. 첨부 파일 가져오기(유/무)
		//3. DB 작업 > insert
		//4. 결과
		
		//1.
		//req.setCharacterEncoding("UTF-8");
		
		try {
			
			//req.getSession() > session
			//req.getServletContext() > application
			
			String path = req.getServletContext().getRealPath("/asset/pic");
			System.out.println(path);
			
			int size = 1024 * 1024 * 10;
			
			MultipartRequest multi = new MultipartRequest(
										req,
										path,
										size,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			
			String id = multi.getParameter("id");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String pic = multi.getFilesystemName("pic");
			String intro = multi.getParameter("intro");
			
			UserDAO dao = new UserDAO();
			
			UserDTO dto = new UserDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPic(pic);
			dto.setIng(intro);
			
			int result = dao.addUser(dto);
			dao.close();
			
			if (result == 1) {
				resp.sendRedirect("/project/index.do");
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("""
						<script>
							alert('failed');
							history.back();
						</script>
						""");
				writer.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			PrintWriter writer = resp.getWriter();
			writer.print("""
					<script>
						alert('failed');
						history.back();
					</script>
					""");
			writer.close();
		}
		
	}

}










