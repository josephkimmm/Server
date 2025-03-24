package com.test.java.test;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	
	public static void main(String[] args) {
		
		//이메일 발송
		//- SMTP, Simple Mail Transfer Protocol
		//- 직접 구현 or 대리자 사용(Naver, Daum, Google > SMTP 서비스 제공)
		
		//Google SMTP
		//- Google 계정 사용(이전) > Google 앱 비밀번호(현재)
		//- kxxq qxva qfiq ykwr
		
		
		//m1(); //기본 이메일 전송
		//m2(); //HTML 형식의 이메일 전송
		m3(); //참조, 숨은 참조
		
	}

	private static void m3() {
		
		//발신자의 메일 정보
		String username = "pinn.public@gmail.com";
		String password = "kxxq qxva qfiq ykwr";
		
		//메일 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		
		//세션 설정(javax.mail.Session)
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			
			//메일 보내기
			//1. 메시지 생성 > 이메일 1개
			Message message = new MimeMessage(session);
			
			//2. 보내는 사람(from)
			message.setFrom(new InternetAddress(username));
						
			//3. 받는 사람(to)
			message.setRecipients(Message.RecipientType.TO, 
					InternetAddress.parse("pinn.public@gmail.com"));
			
			//3. 참조(CC)
			message.setRecipients(Message.RecipientType.CC, 
					InternetAddress.parse("pinn.public@gmail.com"));
			
			//3. 숨은참조(BCC)
			message.setRecipients(Message.RecipientType.BCC, 
					InternetAddress.parse("pinn.public@gmail.com"));
			
			//4. 제목(subject)
			message.setSubject("단체 이메일입니다.");
			
			//5. 내용(body)
			String content = """
				<h1>자바 메일 테스트</h1>
				<ul>
					<li>구글 SMTP</li>
					<li>자바 mail 라이브러리</li>
				</ul>
				<div>위의 기술을 사용했습니다.</div>						
				""";
			
			//message.setText("안녕하세요.\r\n자바로부터 발송된 메일입니다.");
			message.setContent(content, "text/html; charset=UTF-8");
			
			//6. 전송
			Transport.send(message);
			
			System.out.println("이메일 전송 완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private static void m2() {
		
		//발신자의 메일 정보
		String username = "pinn.public@gmail.com";
		String password = "kxxq qxva qfiq ykwr";
		
		//메일 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		
		//세션 설정(javax.mail.Session)
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			
			//메일 보내기
			//1. 메시지 생성 > 이메일 1개
			Message message = new MimeMessage(session);
			
			//2. 보내는 사람(from)
			message.setFrom(new InternetAddress(username));
			
			//3. 받는 사람(to)
			message.setRecipients(Message.RecipientType.TO, 
					InternetAddress.parse("pinn.public@gmail.com"));
			
			//4. 제목(subject)
			message.setSubject("자바에서 보낸 HTML 형식의 이메일입니다.");
			
			//5. 내용(body)
			String content = """
				<h1>자바 메일 테스트</h1>
				<ul>
					<li>구글 SMTP</li>
					<li>자바 mail 라이브러리</li>
				</ul>
				<div>위의 기술을 사용했습니다.</div>						
				""";
			
			//message.setText("안녕하세요.\r\n자바로부터 발송된 메일입니다.");
			message.setContent(content, "text/html; charset=UTF-8");
			
			//6. 전송
			Transport.send(message);
			
			System.out.println("이메일 전송 완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void m1() {
		
		//발신자의 메일 정보
		String username = "pinn.public@gmail.com";
		String password = "kxxq qxva qfiq ykwr";
		
		//메일 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		
		//세션 설정(javax.mail.Session)
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			
			//메일 보내기
			//1. 메시지 생성 > 이메일 1개
			Message message = new MimeMessage(session);
			
			//2. 보내는 사람(from)
			message.setFrom(new InternetAddress(username));
			
			//3. 받는 사람(to)
			message.setRecipients(Message.RecipientType.TO, 
					InternetAddress.parse("pinn.public@gmail.com"));
			
			//4. 제목(subject)
			message.setSubject("자바에서 보낸 이메일입니다.");
			
			//5. 내용(body)
			message.setText("안녕하세요.\r\n자바로부터 발송된 메일입니다.");
			
			//6. 전송
			Transport.send(message);
			
			System.out.println("이메일 전송 완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}













