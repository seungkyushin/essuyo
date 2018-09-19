package com.webproject.essuyo.domain;

public class ProductImageAdminVO {
	private int productId;  
	private int imageInfoId;
	
	
	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getImageInfoId() {
		return imageInfoId;
	}


	public void setImageInfoId(int imageInfoId) {
		this.imageInfoId = imageInfoId;
	}


	@Override
	public String toString() {
		return "ProductImageAdminVO [productId=" + productId + ", imageInfoId=" + imageInfoId + "]";
	} 
	
	
	  
}
