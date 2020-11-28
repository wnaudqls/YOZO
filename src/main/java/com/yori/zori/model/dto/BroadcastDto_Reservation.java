package com.yori.zori.model.dto;

import java.sql.Date;

public class BroadcastDto_Reservation {
	int reservation_no;
	Date reservation_time;
	String reservation_confirm;
	public BroadcastDto_Reservation() {
		
	}
	public BroadcastDto_Reservation(int reservation_no, Date reservation_time, String reservation_confirm,
			String member_id) {
		this.reservation_no = reservation_no;
		this.reservation_time = reservation_time;
		this.reservation_confirm = reservation_confirm;
		this.member_id = member_id;
	}

	String member_id;
	public int getReservation_no() {
		return reservation_no;
	}
	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}
	public Date getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(Date reservation_time) {
		this.reservation_time = reservation_time;
	}
	public String getReservation_confirm() {
		return reservation_confirm;
	}
	public void setReservation_confirm(String reservation_confirm) {
		this.reservation_confirm = reservation_confirm;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
