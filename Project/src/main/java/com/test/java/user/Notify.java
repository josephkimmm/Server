package com.test.java.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.memo.model.MemoDAO;

@WebServlet("/notify.do")
public class Notify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Notify.java
        
        //사용자가 관심있는 키워드 등록 > 관련된 새로운 메모가 등록
        String[] keyword = { "자바", "오라클", "버그" };
        MemoDAO dao = new MemoDAO();
        
        int cnt = dao.check(keyword);
        
        if (cnt > 0) {
            
            //키워드 관련 메모 > 새롭게 등록
        } else {
            //새 메모 없음
        }
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print("""
                {
                    "cnt": %d
                }
                """.formatted(cnt));
        writer.close();
        

        req.getRequestDispatcher("/WEB-INF/views/notify.jsp").forward(req, resp);
    }
}
