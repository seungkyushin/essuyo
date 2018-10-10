package com.webproject.essuyo.domain;

import java.util.Date;

public class NoticeVO {
	private Integer noticeNum;
	private String title;
	private Date regDate;
	private String content;
	private String userID;
	
	public Integer getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(Integer noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date registerDate) {
		this.regDate = registerDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	@Override
	public String toString() {
		String result = "[noticeNum = " + noticeNum + ", title = " + title + ", regDate = " + regDate + ", content ="  + content + ", userID = " + userID +  "]";
		return result;
	}
}
