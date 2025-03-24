package com.test.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("필터가 실행되었습니다.");
		
		System.out.println("필터 체인 전"); //요청 시 발생
		
		chain.doFilter(request, response); //다음 단계로 진행!!
		
		System.out.println("필터 체인 후"); //응답 시 발생
		
	}

}
















