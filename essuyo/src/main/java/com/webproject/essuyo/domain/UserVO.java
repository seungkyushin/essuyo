package com.webproject.essuyo.domain;

import java.util.Date;

public class UserVO {

	private Integer user_num;
	private String name; /* 이름 */
	private String email; /* 이메일 */
	private String pw; /* 비밀번호 */
	private Integer failPw; /* 비밀번호실패 */
	private Date first_date; /* 생성날짜 */
	private Date last_date; /* 마지막로그인날짜 */
	private Integer totalreply; /* 총덧글수 */
	private Integer business_num; /* 사업번호 */

	public Integer getUser_num() {
		return user_num;
	}

	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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
		return "CompVO [user_num=" + user_num + ", name=" + name + ", email=" + email + ", pw=" + pw + ", failPw="
				+ failPw + ", first_date=" + first_date + ", last_date=" + last_date + ", totalreply=" + totalreply
				+ ", business_num=" + business_num + "]";
	}

}
