package com.webproject.essuyo.domain;

import java.util.Date;

public class UserVO {

	private String name; /* 이름 */
	private String email; /* 이메일 */
	private String password; /* 비밀번호 */
	private String fail_password; /* 비밀번호 실패*/
	private String age;
	private String gender;
	private Date first_date; /* 생성날짜 */
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
	public Date getFirst_date() {
		return first_date;
	}
	public void setFirst_date(Date first_date) {
		this.first_date = first_date;
	}
	@Override
	public String toString() {
		return "UserVO [name=" + name + ", email=" + email + ", password=" + password + ", fail_password="
				+ fail_password + ", age=" + age + ", gender=" + gender + ", first_date=" + first_date + "]";
	}

	
	
}
