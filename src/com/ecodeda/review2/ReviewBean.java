package com.ecodeda.review2;

import java.sql.Date;

public class ReviewBean {
	private int bno;
	private String email;
	private String pw;
	private String name;
	private String subject;
	private String content;
	private Date date;
	private String file;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ReviewBean [bno=" + bno + ", email=" + email + ", pw=" + pw + ", name=" + name + ", subject=" + subject
				+ ", content=" + content + ", date=" + date + ", file=" + file + "]";
	}

	
	
}
