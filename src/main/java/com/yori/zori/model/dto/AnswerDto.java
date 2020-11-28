package com.yori.zori.model.dto;

import java.util.Date;

public class AnswerDto {
	
	private int goods_re_no;
	private int goods_no;
	private String member_id;
	private String goods_re_content;
	private Date goods_re_regdate;
	private int goods_re_groupno;
	private int goods_re_seq;
	private int goods_re_titletab;
	private String member_nick;
	private String goods_re_state;
	public AnswerDto() {
		super();
	
	}
	public AnswerDto(int goods_re_no, int goods_no, String member_id, String goods_re_content, Date goods_re_regdate,
			int goods_re_groupno, int goods_re_seq, int goods_re_titletab, String member_nick, String goods_re_state) {
		super();
		this.goods_re_no = goods_re_no;
		this.goods_no = goods_no;
		this.member_id = member_id;
		this.goods_re_content = goods_re_content;
		this.goods_re_regdate = goods_re_regdate;
		this.goods_re_groupno = goods_re_groupno;
		this.goods_re_seq = goods_re_seq;
		this.goods_re_titletab = goods_re_titletab;
		this.member_nick = member_nick;
		this.goods_re_state = goods_re_state;
	}
	public int getGoods_re_no() {
		return goods_re_no;
	}
	public void setGoods_re_no(int goods_re_no) {
		this.goods_re_no = goods_re_no;
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
	public String getGoods_re_content() {
		return goods_re_content;
	}
	public void setGoods_re_content(String goods_re_content) {
		this.goods_re_content = goods_re_content;
	}
	public Date getGoods_re_regdate() {
		return goods_re_regdate;
	}
	public void setGoods_re_regdate(Date goods_re_regdate) {
		this.goods_re_regdate = goods_re_regdate;
	}
	public int getGoods_re_groupno() {
		return goods_re_groupno;
	}
	public void setGoods_re_groupno(int goods_re_groupno) {
		this.goods_re_groupno = goods_re_groupno;
	}
	public int getGoods_re_seq() {
		return goods_re_seq;
	}
	public void setGoods_re_seq(int goods_re_seq) {
		this.goods_re_seq = goods_re_seq;
	}
	public int getGoods_re_titletab() {
		return goods_re_titletab;
	}
	public void setGoods_re_titletab(int goods_re_titletab) {
		this.goods_re_titletab = goods_re_titletab;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getGoods_re_state() {
		return goods_re_state;
	}
	public void setGoods_re_state(String goods_re_state) {
		this.goods_re_state = goods_re_state;
	}
	
	


}
