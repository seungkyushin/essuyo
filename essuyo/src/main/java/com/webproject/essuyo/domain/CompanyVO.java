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
	private int total_visit; /* 총방문자수 */
	private int today_visit; /* 금일방문자수 */
	private int grade; /* 등급 */
	private int area_list_id; /* 지역명목록번호 */
	private int business_type_id; /* 사업종류번호 */
	
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
	public int getTotal_visit() {
		return total_visit;
	}
	public void setTotal_visit(int total_visit) {
		this.total_visit = total_visit;
	}
	public int getToday_visit() {
		return today_visit;
	}
	public void setToday_visit(int today_visit) {
		this.today_visit = today_visit;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getArea_list_id() {
		return area_list_id;
	}
	public void setArea_list_id(int area_list_id) {
		this.area_list_id = area_list_id;
	}
	public int getBusiness_type_id() {
		return business_type_id;
	}
	public void setBusiness_type_id(int business_type_id) {
		this.business_type_id = business_type_id;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [id=" + id + ", name=" + name + ", discription=" + discription + ", address="+
	            address+", number="+number+", url="+url+", state="+state+", time="+time+", total_visit="+
				total_visit+", today_visit="+today_visit+", grade="+grade+", area_list_id="+
				area_list_id+", business_type_id="+business_type_id+"]";
	}
	
	
}




