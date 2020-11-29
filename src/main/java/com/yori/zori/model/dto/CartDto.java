package com.yori.zori.model.dto;


public class CartDto {
	  private String member_id;
	    private int goods_no;
	    private String goods_title;
	    private int goods_price;
	    private int money;
	    private int amount;
	    private String goods_main_photo;
	   public CartDto() {
	      super();
	      // TODO Auto-generated constructor stub
	   }
	   public CartDto(String member_id, int goods_no, String goods_title, int goods_price, int money, int amount,
	         String goods_main_photo) {
	      super();
	      this.member_id = member_id;
	      this.goods_no = goods_no;
	      this.goods_title = goods_title;
	      this.goods_price = goods_price;
	      this.money = money;
	      this.amount = amount;
	      this.goods_main_photo = goods_main_photo;
	   }
	   @Override
	   public String toString() {
	      return "CartDTO [member_id=" + member_id + ", goods_no=" + goods_no + ", goods_title=" + goods_title
	            + ", goods_price=" + goods_price + ", money=" + money + ", amount=" + amount + ", goods_main_photo="
	            + goods_main_photo + "]";
	   }
	   public String getMember_id() {
	      return member_id;
	   }
	   public void setMember_id(String member_id) {
	      this.member_id = member_id;
	   }
	   public int getGoods_no() {
	      return goods_no;
	   }
	   public void setGoods_no(int goods_no) {
	      this.goods_no = goods_no;
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
	   public int getMoney() {
	      return money;
	   }
	   public void setMoney(int money) {
	      this.money = money;
	   }
	   public int getAmount() {
	      return amount;
	   }
	   public void setAmount(int amount) {
	      this.amount = amount;
	   }
	   public String getGoods_main_photo() {
	      return goods_main_photo;
	   }
	   public void setGoods_main_photo(String goods_main_photo) {
	      this.goods_main_photo = goods_main_photo;
	   }
}
