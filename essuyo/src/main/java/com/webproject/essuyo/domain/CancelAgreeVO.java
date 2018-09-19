package com.webproject.essuyo.domain;


public class CancelAgreeVO {

	private int id;
	private String conent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConent() {
		return conent;
	}
	public void setConent(String conent) {
		this.conent = conent;
	}
	@Override
	public String toString() {
		return "CancelAgreeVO [id=" + id + ", conent=" + conent + "]";
	}
	
	
}
