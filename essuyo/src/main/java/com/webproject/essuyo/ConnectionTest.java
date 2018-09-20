package com.webproject.essuyo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionTest {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost/aaa";
			conn = DriverManager.getConnection(url, "root", "1234");
			
			
			stmt = conn.createStatement();
			
			String sql = "select facility_list_no, facility_name FROM aaa.facility_list";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
		        int facility_list_no = rs.getInt(1);
		        String facility_name = rs.getString(2);
		         
		        System.out.println(facility_list_no + ", " + facility_name);
		      }

		}
		catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		}
		catch(SQLException e ) {
			System.out.println("시스템 error " + e);
		}
		finally {
			try {
				if ( conn != null && !conn.isClosed()) {
					conn.close();
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
