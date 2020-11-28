package com.yori.zori.model.dto;

import java.sql.Date;

public class BroadcastDto {

	private int broadcast_no;
	private String member_id;
	private String broadcast_title;
	private String broadcast_content;
	private Date broadcast_regdate;
	private int broadcast_viewcount;
	private String broadcast_mdate;
	
	public BroadcastDto() {

	}

	public BroadcastDto(int broadcast_no, String member_id, String broadcast_title, String broadcast_content,
			Date broadcast_regdate, int broadcast_viewcount, String broadcast_mdate) {
		this.broadcast_no = broadcast_no;
		this.member_id = member_id;
		this.broadcast_title = broadcast_title;
		this.broadcast_content = broadcast_content;
		this.broadcast_regdate = broadcast_regdate;
		this.broadcast_viewcount = broadcast_viewcount;
		this.broadcast_mdate = broadcast_mdate;
	}

	public int getBroadcast_no() {
		return broadcast_no;
	}

	public void setBroadcast_no(int broadcast_no) {
		this.broadcast_no = broadcast_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBroadcast_title() {
		return broadcast_title;
	}

	public void setBroadcast_title(String broadcast_title) {
		this.broadcast_title = broadcast_title;
	}

	public String getBroadcast_content() {
		return broadcast_content;
	}

	public void setBroadcast_content(String broadcast_content) {
		this.broadcast_content = broadcast_content;
	}

	public Date getBroadcast_regdate() {
		return broadcast_regdate;
	}

	public void setBroadcast_regdate(Date broadcast_regdate) {
		this.broadcast_regdate = broadcast_regdate;
	}

	public int getBroadcast_viewcount() {
		return broadcast_viewcount;
	}

	public void setBroadcast_viewcount(int broadcast_viewcount) {
		this.broadcast_viewcount = broadcast_viewcount;
	}

	public String getBroadcast_mdate() {
		return broadcast_mdate;
	}

	public void setBroadcast_mdate(String broadcast_mdate) {
		this.broadcast_mdate = broadcast_mdate;
	}


}
