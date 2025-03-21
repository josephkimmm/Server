package com.test.java.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.java.memo.model.MemoDAO;
import com.test.java.memo.model.MemoDTO;

@WebServlet("/memo/addok.do")
public class AddOk extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //AddOk.java    
        HttpSession session = req.getSession();
        
        //req.setCharacterEncoding("UTF-8");
        
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");
        
        MemoDTO dto = new MemoDTO();
        dto.setSubject(subject);
        dto.setContent(content);
        dto.setId(session.getAttribute("auth").toString());
        
        MemoDAO dao = new MemoDAO();
        int result = dao.add(dto);
        
        if (result == 1) {
            resp.sendRedirect("/project/memo/list.do");
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
                
    }

}










