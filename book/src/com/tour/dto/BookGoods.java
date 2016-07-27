package com.tour.dto;

//예약상품정보
public class BookGoods {
	private int bookgoods_index = 0;
	private String goods_name = null;
	private String bookgoods_date = null;
	private int book_price = 0;
	private int goods_index = 0;
	private int book_index = 0;
	
	public int getBookgoods_index() {
		return bookgoods_index;
	}
	public void setBookgoods_index(int bookgoods_index) {
		System.out.println("BookGoods.java bookgoods_index -> " + bookgoods_index);
		this.bookgoods_index = bookgoods_index;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		System.out.println("BookGoods.java goods_name -> " + goods_name);
		this.goods_name = goods_name;
	}
	public String getBookgoods_date() {
		return bookgoods_date;
	}
	public void setBookgoods_date(String bookgoods_date) {
		System.out.println("BookGoods.java bookgoods_date -> " + bookgoods_date);
		this.bookgoods_date = bookgoods_date;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		System.out.println("BookGoods.java book_price -> " + book_price);
		this.book_price = book_price;
	}
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		System.out.println("BookGoods.java goods_index -> " + goods_index);
		this.goods_index = goods_index;
	}
	public int getBook_index() {
		return book_index;
	}
	public void setBook_index(int book_index) {
		System.out.println("BookGoods.java book_index -> " + book_index);
		this.book_index = book_index;
	}
	
	
}
