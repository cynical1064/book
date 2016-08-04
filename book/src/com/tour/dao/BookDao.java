package com.tour.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tour.dto.Book;
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
	//						예약 테이블 insert메서드 
	//--------------------------------------------------------------------------------------------------------
	public int bookInsert(Book book) throws SQLException{
		int result = 0;
		
		String insertSql = "INSERT INTO book(goods_name, book_price, book_name, book_phone, book_pay, book_date, book_checkin, book_checkout, book_count, book_state)VALUES(?,40000,?,?,?,SYSDATE(),?,?,?,'1')";
		preparedStatement = connection.prepareStatement(insertSql);
		preparedStatement.setString(1, book.getGoods_name());
		preparedStatement.setString(2, book.getBook_name());
		preparedStatement.setString(3, book.getBook_phone());
		preparedStatement.setString(4, book.getBook_pay());
		preparedStatement.setString(5, book.getBook_checkin());
		preparedStatement.setString(6, book.getBook_checkout());
		preparedStatement.setInt(7, book.getBook_count());
		
		result = preparedStatement.executeUpdate();
		System.out.println(preparedStatement);
		
		close();
		return result;
	}
	//--------------------------------------------------------------------------------------------------------
	//						예약이 되어있는지 달력 확인 메서드 
	//--------------------------------------------------------------------------------------------------------
	
	public ArrayList<Book> bookInfo(String roomName) throws SQLException{
		Book book = null;
		ArrayList<Book> bookList = new ArrayList<Book>();
		String sql = null;
		if(roomName != null)
		{
			sql = "SELECT book_checkin, book_checkout FROM book WHERE goods_name=? AND book_state=1";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, roomName);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				book = new Book();
				book.setBook_checkin(resultSet.getString("book_checkin"));
				book.setBook_checkout(resultSet.getString("book_checkout"));
				bookList.add(book);
			}
		}
		
		else{
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
		}
		
		close();
		return bookList;	
	}
	
	
	public void close(){
		if (preparedStatement != null) try { preparedStatement.close(); } catch(SQLException ex) {}
		if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}
}
