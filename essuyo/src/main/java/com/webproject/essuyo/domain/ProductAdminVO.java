package com.webproject.essuyo.domain;

public class ProductAdminVO {

	private int product_count;	/*상품개수*/
	private int business_id; 	/* 사업종류번호 */
	private int product_id;	 	/* 상품번호 */
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(int business_id) {
		this.business_id = business_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "ProductAdminVO [product_count=" + product_count + ", business_id=" + business_id + ", product_id="
				+ product_id + "]";
	}

	
}
