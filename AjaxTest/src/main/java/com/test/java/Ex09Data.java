package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;
import com.test.java.model.UserDTO;

@WebServlet("/ex09data.do")
public class Ex09Data extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Ex09Data.java
        
        String m = req.getParameter("m");
        
        if (m.equals("1")) {
            m1(req, resp);
        } else if (m.equals("2")) {
            m2(req, resp);
        } else if (m.equals("3")) {
            m3(req, resp);
        } else if (m.equals("4")) {
            m4(req, resp);
        } else if (m.equals("5")) {
            m5(req, resp);
        } else if (m.equals("6")) {
            m6(req, resp);
        }

    }

    private void m1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
        //서버가 > 텍스트 반환 + 단일값 
        AjaxDAO dao = new AjaxDAO();
        String question = dao.listSurvey().get(0).getQuestion();
        
        //서버가 클라이언트(브라우저, ajax)에게 돌려주는 데이터의 형식 지정
        //- 응답 헤더 설정
        resp.setContentType("text/plain"); //MIME > 텍스트 포맷(=문자열)
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(question);
        writer.close();
        
    }
    
    private void m2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
        //서버가 > 텍스트 반환 + 다중값
        //- select * from tblUser
        AjaxDAO dao = new AjaxDAO();
        
        ArrayList<UserDTO> list = dao.listUser();
        
        //[UserDTO(id=hong, pw=1111, name=홍길동, lv=1), UserDTO(id=dog, pw=1111, name=강아지, lv=1), UserDTO(id=cat, pw=1111, name=고양이, lv=2)]
        //System.out.println(list);
        
        /*
            hong,1111,홍길동,1
            dog,1111,강아지,1
            cat,1111,고양이,2
        */
        
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        
        for (UserDTO dto : list) {
            writer.printf("%s,%s,%s,%s\r\n"
                            , dto.getId()
                            , dto.getPw()
                            , dto.getName()
                            , dto.getId());
        }
        
        writer.close();     
    }
    
    private void m3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
        //DB 작업 > select
        String data = "자바";
        
        //ajax 반환 > XML 형식으로 반환!!
        resp.setContentType("text/xml"); //MIME
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        
        /*
            Well-formed XML
            
            <?xml version="1.0" encoding="UTF-8"?>
            <result id="q1">자바</result>
            
        */
        
        writer.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.printf("<result id=\"q1\">%s</result>", data);
        
        writer.close();     
    }
    
    private void m4(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
        AjaxDAO dao = new AjaxDAO();
        ArrayList<UserDTO> list = dao.listUser();
        
        /*
            DB의 스키마 작업
            
            <?xml version="1.0" encoding="UTF-8"?>
            <list>
                <user>
                    <id>hong</id>
                    <pw>1111</pw>
                    <name>홍길동</name>
                    <lv>1</lv>
                </user>
                <user>
                    <id>dog</id>
                    <pw>1111</pw>
                    <name>강아지</name>
                    <lv>1</lv>
                </user>
                <user>
                    <id>cat</id>
                    <pw>1111</pw>
                    <name>고양이</name>
                    <lv>2</lv>
                </user>
            </list>
        
        */
        
        resp.setContentType("text/xml");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        
        writer.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.print("<list>");
        
        for (UserDTO dto : list) {
            writer.print("<user>");
                writer.printf("<id>%s</id>"     , dto.getId());
                writer.printf("<pw>%s</pw>"     , dto.getPw());
                writer.printf("<name>%s</name>" , dto.getName());
                writer.printf("<lv>%s</lv>"     , dto.getLv());
            writer.print("</user>");
        }
        
        writer.print("</list>");
        writer.close();
    }
    
    private void m5(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
        //서버가 > JSON 반환 + 단일값
        String data = "자바스크립트";
        
        /*
            
        */
        
        
    }
    
    private void m6(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        
    }

}





















