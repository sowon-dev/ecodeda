package com.ecodeda.member;

import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class findPW {
	
	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			//지메일 아이디 , 비밀번호
			return new PasswordAuthentication("noreply.ecodeda@gmail.com", "gecodeda.11"); //보내는 사람
		}
	}
	
	
	public static void send(String title, String content, String toEmail) {
		
		Properties p = new Properties();
		p.put("mail.smtp.user", "ecodeda@gmail.com"); //본인 지메일		
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);
			String message = content;
			msg.setSubject(title);
			
			Address fromAddr = new InternetAddress("noreply.ecodeda@gmail.com"); //보내는사람
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/plain;charset=KSC5601");
			
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	
		public static void main(String[] args) {
			Random myRandom = new Random();
			int rNum = myRandom.nextInt(100)*3;
			
			send("이코드다 임시비밀번호 발급안내", "임시 비밀번호 입니다."+rNum, "ecodeda@gmail.com");
			System.out.println("임시비밀번호발급완료")
			;
		}
	}
