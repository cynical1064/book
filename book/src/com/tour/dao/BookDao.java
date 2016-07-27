package com.tour.dao;

import java.sql.*;

//���� DBó��
public class BookDao {
	//--------------------------------------------------------------------------------------------------------
	//						��������
	//--------------------------------------------------------------------------------------------------------
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	//--------------------------------------------------------------------------------------------------------
	//						������ �޼���
	//--------------------------------------------------------------------------------------------------------
	public BookDao(){
		try {
			driverDb();
		} catch (ClassNotFoundException e) {
			System.out.println("BookDao.java -> ����̹����� ����");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("BookDao.java -> ����̹����� ����");
			e.printStackTrace();
		}
	}
	
	//--------------------------------------------------------------------------------------------------------
	//						DB ���� �޼���
	//--------------------------------------------------------------------------------------------------------
	public void driverDb() throws ClassNotFoundException, SQLException{
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/tour?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPass = "java0000";
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPass);
	}
	
	
}
