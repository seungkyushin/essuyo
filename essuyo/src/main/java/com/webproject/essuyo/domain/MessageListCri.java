package com.webproject.essuyo.domain;

import java.io.Serializable;

public class MessageListCri implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int page;
	private int perPageNum;
	private String userID;
	
	
	
	public MessageListCri() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public MessageListCri(String userID, MessageListCri cri) {
		this.userID = userID;
		this.page = 0;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	// MyBatis SQL Mapper
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	
	@Override
	public String toString() {
		String result = "ListCri [page = " + page + ", perPageNum = " + perPageNum + ", userID = " + userID + "]";
		return result;
	}

}
