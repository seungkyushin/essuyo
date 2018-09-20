package com.webproject.essuyo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest2 {
	public static Connection getConnection() {
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/aaa";
			
			conn = DriverManager.getConnection(url, "root", "1234");
		}
		catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		}
		catch(SQLException e ) {
			System.out.println("시스템 error " + e);
		}
		return conn;
	}
}
