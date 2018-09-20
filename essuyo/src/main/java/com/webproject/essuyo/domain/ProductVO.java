package com.webproject.essuyo.domain;

public class ProductVO {

	private int id; 			/* 번호 */
	private String name;		/* 이름 */
	private int count;			/* 개수 */
	private String discription; /* 설명 */
	private int price; 			/* 가격 */
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", name=" + name + ", count=" + count + ", discription=" + discription
				+ ", price=" + price + "]";
	}
	

	
}
