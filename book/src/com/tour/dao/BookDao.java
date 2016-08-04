package com.tour.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tour.dto.Book;
import com.tour.dto.Goods;

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
	//--------------------------------------------------------------------------------------------------------
	//						��ǰ ���� ��� �޼��� 
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
			goods.setGoods_ys2(resultSet.getInt("goods_ys2"));
			goods.setGoods_state(resultSet.getString("goods_state"));
		}
		return goods;
		
	}
	
	//--------------------------------------------------------------------------------------------------------
	//						�������� Ȯ�� �޼��� 
	//--------------------------------------------------------------------------------------------------------
	
	public ArrayList<Book> bookInfo(String roomName) throws SQLException{
		Book book = null;
		ArrayList<Book> bookList = new ArrayList<Book>();
		
		String sql = "SELECT book_checkin, book_checkout FROM book WHERE goods_name=? AND book_state=1";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, roomName);
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()){
			book = new Book();
			book.setBook_checkin(resultSet.getString("book_checkin"));
			book.setBook_checkout(resultSet.getString("book_checkout"));
			bookList.add(book);
		}
		
		if(bookList.size() == 0){
			sql = "SELECT goods_name, book_checkin, book_checkout FROM book WHERE book_state=1";
			preparedStatement = connection.prepareStatement(sql);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				book = new Book();
				book.setBook_checkin(resultSet.getString("book_checkin"));
				book.setBook_checkout(resultSet.getString("book_checkout"));
				book.setGoods_name(resultSet.getString("goods_name"));
				bookList.add(book);
			}
		}
		return bookList;	
	}
	
}
