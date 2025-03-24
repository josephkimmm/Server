<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- inc > header.jsp -->
<header>
	<h1 class="main">Project</h1>
	<ul>
		<c:if test="${not empty auth}">
		<li id="notifyIcon" style="filter: grayscale(100%);">🔔</li>
		</c:if>
			
		<li><a href="/project/index.do">홈</a></li>
		
		<c:if test="${empty auth}">
		<li><a href="/project/user/register.do">회원가입</a></li>
		<li><a href="/project/user/login.do">로그인</a></li>
		</c:if>
		
		<c:if test="${not empty auth}">
		<li><a href="#!">회원탈퇴</a></li>
		<li><a href="/project/user/logoutok.do">로그아웃</a></li>
		<li><a href="/project/user/info.do">자기정보</a></li>
		</c:if>
		
		<li><a href="/project/memo/list.do">메모장</a></li>
				
	</ul>
</header>

<script>
	
	function notify() {
		$.ajax({
	        type: 'GET',
	        url: '/project/user/notify.do',
	        dataType: 'json',
	        success: function(result) {
	            
	            //document.title = result.cnt;
	            
	            if (result.cnt > 0) {
	                //관련 메모 발생
	                $('#notifyIcon').css('filter', 'grayscale(0%)');
	                setInterval(()=>{
	                    $('#notifyIcon').toggle();
	                }, 500);
	            } else {
	                //없음
	                $('#notifyIcon').css('filter', 'grayscale(100%)');
	            }
	            
	        },
	        error: function(a,b,c) {
	            console.log(a,b,c);
	        }
	    });
	}
	//폴링(Polling)
	// - 클라이언트가 주기적으로 서버에 접속 > 관련 메모가 있는지 확인
	setInterval(notify, 5000); //시간이 중요 > 짧으면 짧을수록 실시간에 가깝게 요청됨. > 서버 부담 증가
	
	
	
</script>















