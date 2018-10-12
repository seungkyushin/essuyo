package com.webproject.essuyo.domain;

public class QnAReadVO {

	private Integer id;
	private String userID;

	public QnAReadVO(Integer id, String userID) {
		this.id = id;
		this.userID = userID;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

}
