package com.tour.dto;

//상품정보
public class Goods {
	private int goods_index = 0;
	private String goods_name = null;
	private int goods_ns1 = 0;	//평일 비수기 가격
	private int goods_ns2 = 0;	//주말 비수기 가격
	private int goods_ys1 = 0;	//평일 성수기 가격
	private int goods_ys2 = 0;	//주말 성수기 가격
	private String goods_state = null;
	
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		System.out.println("Goods_java goods_index -> " + goods_index);
		this.goods_index = goods_index;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		System.out.println("Goods_java goods_name -> " + goods_name);
		this.goods_name = goods_name;
	}
	public int getGoods_ns1() {
		return goods_ns1;
	}
	public void setGoods_ns1(int goods_ns1) {
		System.out.println("Goods_java goods_ns1 -> " + goods_ns1);
		this.goods_ns1 = goods_ns1;
	}
	public int getGoods_ns2() {
		return goods_ns2;
	}
	public void setGoods_ns2(int goods_ns2) {
		System.out.println("Goods_java goods_ns2 -> " + goods_ns2);
		this.goods_ns2 = goods_ns2;
	}
	public int getGoods_ys1() {
		return goods_ys1;
	}
	public void setGoods_ys1(int goods_ys1) {
		System.out.println("Goods_java goods_ys1 -> " + goods_ys1);
		this.goods_ys1 = goods_ys1;
	}
	public int getGoods_ys2() {
		return goods_ys2;
	}
	public void setGoods_ys2(int goods_ys2) {
		System.out.println("Goods_java goods_ys2 -> " + goods_ys2);
		this.goods_ys2 = goods_ys2;
	}
	public String getGoods_state() {
		return goods_state;
	}
	public void setGoods_state(String goods_state) {
		System.out.println("Goods_java goods_state -> " + goods_state);
		this.goods_state = goods_state;
	}
	
	
}
