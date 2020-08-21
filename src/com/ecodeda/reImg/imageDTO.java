package com.ecodeda.reImg;

public class imageDTO {
	private int num;
	private String subject;
	private String saveFileName;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	@Override
	public String toString() {
		return "imageTestDTO [num=" + num + ", subject=" + subject + ", saveFileName=" + saveFileName + "]";
	}
	
}
