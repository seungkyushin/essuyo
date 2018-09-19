package com.webproject.essuyo.domain;

public class ImageInfoVO {

	private int id;
	private String savePath;
	private String type;
	private String name;
	private String cre_date;
	private String mod_date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	@Override
	public String toString() {
		return "ImageInfoVO [id=" + id + ", savePath=" + savePath + ", type=" + type + ", name=" + name + ", cre_date="
				+ cre_date + ", mod_date=" + mod_date + "]";
	}
	
	
}
	
	
