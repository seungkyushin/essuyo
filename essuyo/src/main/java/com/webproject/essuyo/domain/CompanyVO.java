package com.webproject.essuyo.domain;

public class CompanyVO {
	
	private int id; /* 번호 */
	private String companyName; /* 이름 */
	private String type; /* 회사 종류*/
	private String discription; /* 설명 */
	private float score; /* 점수 */
	private String address; /* 주소 */
	private String number; /* 전화번호 */
	private String url; /* 홈페이지 */
	private String state; /* 영업상태 */
	private String time; /* 영업시간 */
	private int totalVisit; /* 총방문자수 */
	private int todayVisit; /* 금일방문자수 */
	private int grade; /* 등급 */
	private int areaListId; /* 지역명목록번호 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
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
	@Override
	public String toString() {
		return "CompanyVO [id=" + id + ", companyName=" + companyName + ", type=" + type + ", discription="
				+ discription + ", score=" + score + ", address=" + address + ", number=" + number + ", url=" + url
				+ ", state=" + state + ", time=" + time + ", totalVisit=" + totalVisit + ", todayVisit=" + todayVisit
				+ ", grade=" + grade + ", areaListId=" + areaListId + "]";
	}
	
	
	
	
	
}
