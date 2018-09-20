<%@page import="com.webproject.essuyo.ConnectionTest2"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = ConnectionTest2.getConnection();
	out.print("db 연결정보 : " + conn);
	
	Statement stmt = conn.createStatement();
	
	String sql = "select comp_num, name, totalVisit FROM aaa.company";
	stmt.executeQuery(sql);
	
	ResultSet rs = stmt.executeQuery(sql); 
	
	if(rs.next()) {
		do{
			out.print("<br>");
			out.print(rs.getInt("comp_num")+"<br>");
			out.print(rs.getString("name")+"<br>");
			out.print(rs.getInt("totalVisit")+"<br>");
		}while(rs.next());
		} else {
			out.print("검색결과가 없습니다.");
	}
%>