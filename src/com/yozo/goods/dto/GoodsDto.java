package com.yozo.goods.dto;

import java.util.Date;

public class GoodsDto {
	
	private int goods_no;
	private String member_id;
	private String goods_title;
	private int goods_price;
	private int goods_quantity;
	private String goods_content;
	private Date goods_regdate;
	private String goods_main_photo;
	
	//기본생성자
	public GoodsDto() {
		
	}

	
	
	public GoodsDto(int goods_no, String member_id, String goods_title, int goods_price, int goods_quantity,
			 String goods_content, Date goods_regdate, String goods_main_photo) {
		super();
		this.goods_no = goods_no;
		this.member_id = member_id;
		this.goods_title = goods_title;
		this.goods_price = goods_price;
		this.goods_quantity = goods_quantity;
		this.goods_content = goods_content;
		this.goods_regdate = goods_regdate;
		this.goods_main_photo = goods_main_photo;
	}



	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getGoods_title() {
		return goods_title;
	}

	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getGoods_quantity() {
		return goods_quantity;
	}

	public void setGoods_quantity(int goods_quantity) {
		this.goods_quantity = goods_quantity;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public Date getGoods_regdate() {
		return goods_regdate;
	}

	public void setGoods_regdate(Date goods_regdate) {
		this.goods_regdate = goods_regdate;
	}

	public String getGoods_main_photo() {
		return goods_main_photo;
	}

	public void setGoods_main_photo(String goods_main_photo) {
		this.goods_main_photo = goods_main_photo;
	}

	@Override
	public String toString() {
		return "GoodsDto [goods_no=" + goods_no + ", member_id=" + member_id + ", goods_title=" + goods_title
				+ ", goods_price=" + goods_price + ", goods_quantity=" + goods_quantity + ", goods_content="
				+ goods_content + ", goods_regdate=" + goods_regdate + ", goods_main_photo=" + goods_main_photo + "]";
	}

	
	

	
	
		
	
	

}
