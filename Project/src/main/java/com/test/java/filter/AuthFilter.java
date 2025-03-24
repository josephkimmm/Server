package com.test.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/memo/add.do", "/memo/addok.do" })
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("인증 필터 호출");
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		if (session.getAttribute("auth") == null) {
			
			((HttpServletResponse)response).sendRedirect("/project/index.do");
			return;
			
		}
		
		
		chain.doFilter(request, response);
		
	}
	
}






