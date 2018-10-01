package com.webproject.essuyo.domain;

public class MessageListVO {
	private String userID;
	private int page;
	
	public MessageListVO(String userID, int page) {
		this.userID = userID;
		this.page = page;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
