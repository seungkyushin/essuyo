package com.webproject.essuyo.domain;

import java.sql.Timestamp;
import java.util.Date;

public class UserVO {

	private int id;
	private String name; /* 이름 */
	private String email; /* 이메일 */
	private String password; /* 비밀번호 */
	private String fail_password; /* 비밀번호 실패*/
	private String age;
	private String gender;
	private Date creDate; /* 생성날짜 */
	private Date lastDate; /* 생성날짜 */
	private int todayReply; /* 생성날짜 */
	private int business_id = -1;
	private int imageInfoId;
	private String sessionKey;
	private Timestamp sessionlimit;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFail_password() {
		return fail_password;
	}
	public void setFail_password(String fail_password) {
		this.fail_password = fail_password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public int getTodayReply() {
		return todayReply;
	}
	public void setTodayReply(int todayReply) {
		this.todayReply = todayReply;
	}
	public int getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(int business_id) {
		this.business_id = business_id;
	}
	public int getImageInfoId() {
		return imageInfoId;
	}
	public void setImageInfoId(int imageInfoId) {
		this.imageInfoId = imageInfoId;
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public Timestamp getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(Timestamp sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", fail_password=" + fail_password + ", age=" + age + ", gender=" + gender + ", creDate=" + creDate
				+ ", lastDate=" + lastDate + ", todayReply=" + todayReply + ", business_id=" + business_id
				+ ", imageInfoId=" + imageInfoId + ", sessionKey=" + sessionKey + ", sessionlimit=" + sessionlimit
				+ "]";
	}
	
	
	
}
