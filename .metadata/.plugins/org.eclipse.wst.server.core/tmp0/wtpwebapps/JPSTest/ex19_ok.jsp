<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	//enctype="application/x-www-form-urlencoded"
	//	- request.getParameter() > 정상 동작
	
	//enctype="multipart/form-data"
	//	- request.getParameter() > 동작 안함
			
	//String txt = request.getParameter("txt");
	//String attach = request.getParameter("attach");
	//System.out.println(txt); //???
	//System.out.println(attach);
	
	//request.getParameter()
	// - 기존의 request > cos.jar 제공 request를 사용
	
	//MultipartRequest(cos.jar)
	// - 기존 request의 Wrapping 객체(request의 대용품)
	// - 파일 업로드 처리 구현
	
	
	//업로드 파일을 저장할 경로를 지정
	// - 로컬 경로로 지정(드라이브명으로 시작)
	// - 관리 차원 > 프로젝트 폴더 하위에
	// - webapp > "files"
	//String path = "C:\class\code\server\JSPTest\src\main\webapp\files";
	
	String path = application.getRealPath("/files");
	
	//C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	//System.out.println(path);
	
	//업로드 파일의 최대 크기 지정
	//- 바이트 단위
	int size = 1024 * 1024 * 100; //100MB
	
	//변수 선언
	String txt = "";		//문자열
	String filename = "";	//첨부파일명
	String orgfilename = "";//첨부파일명
	
	
	// 이 객체 생성과 동시에 파일 업로드가 완료된 상태
	MultipartRequest multi = new MultipartRequest(
								request, //원래 request
								path, 	 //업로드 경로
								size,	 //최대 크기
								"UTF-8", //인코딩
								new DefaultFileRenamePolicy()// 중복방지를 위해 뒤에 숫자를 붙여줌
							);
	
	txt = multi.getParameter("txt");
	
	//System.out.println(txt);
	//System.out.println(multi.getParameter("attach"));
	
	//<input type="file" name="attach">;
	filename= multi.getFilesystemName("attach");
	System.out.println(filename);
	
	orgfilename = multi.getOriginalFileName("attach");
	System.out.println(orgfilename);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		
	</style>
</head>
<body>
	<!-- ex19_ok.jsp -->
	<h1>결과</h1>
	
	<div>문자열: <%= txt %></div>
	<div>첨부 파일: <%= filename %></div>
	<div>첨부 파일: <%= orgfilename %></div>
	
	<h2>파일 다운로드</h2>
	<!-- 
		장점: 초간단
		단점: 파일명이 다를 수 있음.
			  브라우저가 해석 > 뷰어 처리
	 -->
	<div>
		<a href="/jsp/files/<%= orgfilename %>"><%= orgfilename %></a>
	</div>
	
	<!-- 
		장점: 초간단
		단점: 모든 브라우저 지원 안함.
			  파일명 보장X
	 -->
	<div>
		//<a href="/jsp/files/<%= orgfilename %>"download><%= orgfilename %></a>
		<a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename%>"<%= orgfilename %>"download><%= orgfilename %></a>
	</div>
	
	<!-- 
		다운로드 처리할 프로그램을 구현
		장점:  통제 가능
		단점:  비용 발생
	
	 -->
	<div>
		<a href="/jsp/files/<%= orgfilename %>"download><%= orgfilename %></a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






