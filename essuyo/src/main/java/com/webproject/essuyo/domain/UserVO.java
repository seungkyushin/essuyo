package com.webproject.essuyo.domain;

import java.util.Date;

public class UserVO {

	private Integer id;
	private String name; /* 이름 */
	private String email; /* 이메일 */
	private String password; /* 비밀번호 */	
	private Integer failPw; /* 비밀번호실패 */
	private String age;
	private String gender;
	private Date first_date; /* 생성날짜 */
	private Date last_date; /* 마지막로그인날짜 */
	private Integer totalreply; /* 총덧글수 */
	private Integer business_num; /* 사업번호 */

	
	
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Integer getFailPw() {
		return failPw;
	}

	public void setFailPw(Integer failPw) {
		this.failPw = failPw;
	}

	public Date getFirst_date() {
		return first_date;
	}

	public void setFirst_date(Date first_date) {
		this.first_date = first_date;
	}

	public Date getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}

	public Integer getTotalreply() {
		return totalreply;
	}

	public void setTotalreply(Integer totalreply) {
		this.totalreply = totalreply;
	}

	public Integer getBusiness_num() {
		return business_num;
	}

	public void setBusiness_num(Integer business_num) {
		this.business_num = business_num;
	}

	@Override
	public String toString() {
		return "CompVO [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", failPw="
				+ failPw + ", first_date=" + first_date + ", last_date=" + last_date + ", totalreply=" + totalreply
				+ ", business_num=" + business_num + "]";
	}

}
