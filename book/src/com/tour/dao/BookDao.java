package com.tour.dao;

import java.sql.*;

import com.tour.dto.Goods;

//예약 DB처리
public class BookDao {
	//--------------------------------------------------------------------------------------------------------
	//						전역변수
	//--------------------------------------------------------------------------------------------------------
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	//--------------------------------------------------------------------------------------------------------
	//						생성자 메서드
	//--------------------------------------------------------------------------------------------------------
	public BookDao(){
		try {
			driverDb();
		} catch (ClassNotFoundException e) {
			System.out.println("BookDao.java -> 드라이버연결 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("BookDao.java -> 드라이버연결 실패");
			e.printStackTrace();
		}
	}
	
	//--------------------------------------------------------------------------------------------------------
	//						DB 연결 메서드
	//--------------------------------------------------------------------------------------------------------
	public void driverDb() throws ClassNotFoundException, SQLException{
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/tour?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPass = "java0000";
		
		Class.forName(driver);
		connection = DriverManager.getConnection(url, dbUser, dbPass);
	}
	//--------------------------------------------------------------------------------------------------------
	//						상품 정보 출력 메서드 
	//--------------------------------------------------------------------------------------------------------
	public Goods goodsInfo() throws SQLException{
		Goods goods = new Goods();
		String sql = "SELECT * FROM goods";
		preparedStatement = connection.prepareStatement(sql);
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()){
			goods.setGoods_name(resultSet.getString("goods_name"));
			goods.setGoods_ns1(resultSet.getInt("goods_ns1"));
			goods.setGoods_ns2(resultSet.getInt("goods_ns2"));
			goods.setGoods_ys1(resultSet.getInt("goods_ys1"));
			goods.setGoods_ys2(resultSet.getInt("goods_ys2"));
		}
		return goods;
		
	}
	
}
