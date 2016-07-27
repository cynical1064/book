package com.tour.dto;

//예약정보
public class Book {
	private int book_index = 0;
	private int goods_index = 0;
	private String goods_name = null;
	private int book_price = 0;
	private String book_name = null;
	private String book_phone = null;
	private String book_pay = null;
	private String book_date = null;
	private String book_checkin = null;
	private String book_checkout = null;
	private int book_count = 0;
	
	public int getBook_index() {
		return book_index;
	}
	public void setBook_index(int book_index) {
		System.out.println("Book.java book_index -> " + book_index);
		this.book_index = book_index;
	}
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		System.out.println("Book.java goods_index -> " + goods_index);
		this.goods_index = goods_index;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		System.out.println("Book.java goods_name -> " + goods_name);
		this.goods_name = goods_name;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		System.out.println("Book.java book_price -> " + book_price);
		this.book_price = book_price;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		System.out.println("Book.java book_name -> " + book_name);
		this.book_name = book_name;
	}
	public String getBook_phone() {
		return book_phone;
	}
	public void setBook_phone(String book_phone) {
		System.out.println("Book.java book_phone -> " + book_phone);
		this.book_phone = book_phone;
	}
	public String getBook_pay() {
		return book_pay;
	}
	public void setBook_pay(String book_pay) {
		System.out.println("Book.java book_pay -> " + book_pay);
		this.book_pay = book_pay;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		System.out.println("Book.java book_date -> " + book_date);
		this.book_date = book_date;
	}
	public String getBook_checkin() {
		return book_checkin;
	}
	public void setBook_checkin(String book_checkin) {
		System.out.println("Book.java book_checkin -> " + book_checkin);
		this.book_checkin = book_checkin;
	}
	public String getBook_checkout() {
		return book_checkout;
	}
	public void setBook_checkout(String book_checkout) {
		System.out.println("Book.java book_checkout -> " + book_checkout);
		this.book_checkout = book_checkout;
	}
	public int getBook_count() {
		return book_count;
	}
	public void setBook_count(int book_count) {
		System.out.println("Book.java book_count -> " + book_count);
		this.book_count = book_count;
	}
	
	
}
