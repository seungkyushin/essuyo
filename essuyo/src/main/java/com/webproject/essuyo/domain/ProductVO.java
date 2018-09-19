package com.webproject.essuyo.domain;

public class ProductVO {

	private int id; 			/* 번호 */
	private String name;		/* 이름 */
	private String discription; /* 설명 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", name=" + name + ", discription=" + discription + "]";
	}
	
	
}
