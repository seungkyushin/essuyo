package com.webproject.essuyo.domain;

public class ImageAdminVO {
	private int id; 	/* 사업종류번호 */
	private int type_Id;	 	/* 상품번호 */
	public int imageInfoId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType_Id() {
		return type_Id;
	}
	public void setType_Id(int type_Id) {
		this.type_Id = type_Id;
	}
	public int getImageInfoId() {
		return imageInfoId;
	}
	public void setImageInfoId(int imageInfoId) {
		this.imageInfoId = imageInfoId;
	}
	@Override
	public String toString() {
		return "ImageAdminVO [id=" + id + ", type_Id=" + type_Id + ", imageInfoId=" + imageInfoId + "]";
	}
	

	
}
