package com.tour.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tour.dto.Goods;

public class GoodsDao {
	//--------------------------------------------------------------------------------------------------------
		//						전역변수
		//--------------------------------------------------------------------------------------------------------
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		//--------------------------------------------------------------------------------------------------------
		//						생성자 메서드
		//--------------------------------------------------------------------------------------------------------
		public GoodsDao(){
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
		//						상품정보 확인 메서드
		//--------------------------------------------------------------------------------------------------------
		public Goods goodsInfo(String roomName) throws SQLException{
			Goods goods = new Goods();
			String sql = "SELECT goods_ns1, goods_ns2, goods_ys1, goods_ys2 FROM goods WHERE goods_name=?";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, roomName);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				goods.setGoods_name(resultSet.getString("goods_name"));
				goods.setGoods_ns1(resultSet.getInt("goods_ns1"));
				goods.setGoods_ns2(resultSet.getInt("goods_ns2"));
				goods.setGoods_ys1(resultSet.getInt("goods_ys1"));
				goods.setGoods_ys2(resultSet.getInt("goods_ys2"));
				goods.setGoods_ys2(resultSet.getInt("goods_ys2"));
				goods.setGoods_state(resultSet.getString("goods_state"));
			}
			close();
			return goods;
			
		}
		
		public void close(){
			if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
			if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
}
