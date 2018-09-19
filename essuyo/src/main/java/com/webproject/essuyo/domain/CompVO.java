package com.webproject.essuyo.domain;

public class CompVO {

	private Integer comp_num; /* 번호 */
	private String name; /* 이름 */
	private String expl; /* 설명 */
	private String addr; /* 주소 */
	private String pnum; /* 전화번호 */
	private String hp; /* 홈페이지 */
	private String stat; /* 영업상태 */
	private String time; /* 영업시간 */
	private Integer totalVisit; /* 총방문자수 */
	private Integer todayVisit; /* 금일방문자수 */
	private Integer grade; /* 등급 */
	private Integer area_list_no; /* 지역명목록번호 */
	private Integer btype_num; /* 사업종류번호 */

	public Integer getComp_num() {
		return comp_num;
	}

	public void setComp_num(Integer comp_num) {
		this.comp_num = comp_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getExpl() {
		return expl;
	}

	public void setExpl(String expl) {
		this.expl = expl;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getTotalVisit() {
		return totalVisit;
	}

	public void setTotalVisit(Integer totalVisit) {
		this.totalVisit = totalVisit;
	}

	public Integer getTodayVisit() {
		return todayVisit;
	}

	public void setTodayVisit(Integer todayVisit) {
		this.todayVisit = todayVisit;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getArea_list_no() {
		return area_list_no;
	}

	public void setArea_list_no(Integer area_list_no) {
		this.area_list_no = area_list_no;
	}

	public Integer getBtype_num() {
		return btype_num;
	}

	public void setBtype_num(Integer btype_num) {
		this.btype_num = btype_num;
	}

	@Override
	public String toString() {
		return "CompVO [comp_num=" + comp_num + ", name=" + name + ", expl=" + expl + ", addr=" + addr + ", pnum="
				+ pnum + ", hp=" + hp + ", stat=" + stat + ", time=" + time + ", totalVisit=" + totalVisit
				+ ", todayVisit=" + todayVisit + ", grade=" + grade + ", area_list_no=" + area_list_no + ", btype_num="
				+ btype_num + "]";
	}

}
