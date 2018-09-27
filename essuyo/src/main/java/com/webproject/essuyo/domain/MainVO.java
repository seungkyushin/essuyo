package com.webproject.essuyo.domain;

public class MainVO {
	
	private int id; /* 번호 */
	private String name; /* 이름 */
	
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
	
	@Override
	public String toString() {
		return "MainVO [id=" + id + ", name=" + name + "]";
	}
	
}


