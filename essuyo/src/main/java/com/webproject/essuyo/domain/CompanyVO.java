package com.webproject.essuyo.domain;

public class CompanyVO {

	private int id; /* 번호 */
	private String name; /* 이름 */
	private String discription; /* 설명 */
	private String address; /* 주소 */
	private String number; /* 전화번호 */
	private String url; /* 홈페이지 */
	private String state; /* 영업상태 */
	private String time; /* 영업시간 */
	private int totalVisit; /* 총방문자수 */
	private int todayVisit; /* 금일방문자수 */
	private int grade; /* 등급 */
	private int areaListId; /* 지역명목록번호 */
	private int businessTypeId; /* 사업종류번호 */

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

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTotalVisit() {
		return totalVisit;
	}

	public void setTotalVisit(int totalVisit) {
		this.totalVisit = totalVisit;
	}

	public int getTodayVisit() {
		return todayVisit;
	}

	public void setTodayVisit(int todayVisit) {
		this.todayVisit = todayVisit;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getAreaListId() {
		return areaListId;
	}

	public void setAreaListId(int areaListId) {
		this.areaListId = areaListId;
	}

	public int getBusinessTypeId() {
		return businessTypeId;
	}

	public void setBusinessTypeId(int businessTypeId) {
		this.businessTypeId = businessTypeId;
	}

	@Override
	public String toString() {
		return "CompanyVO [id=" + id + ", name=" + name + ", discription=" + discription + ", address=" + address
				+ ", number=" + number + ", url=" + url + ", state=" + state + ", time=" + time + ", totalVisit="
				+ totalVisit + ", todayVisit=" + todayVisit + ", grade=" + grade + ", areaListId=" + areaListId
				+ ", businessTypeId=" + businessTypeId + "]";
	}

}
