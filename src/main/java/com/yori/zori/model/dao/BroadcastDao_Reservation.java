package com.yori.zori.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yori.zori.model.dto.BroadcastDto_Reservation;

public interface BroadcastDao_Reservation{
 String namespace = "Broadcast_Reservation.";

	public List<BroadcastDto_Reservation> checklist(String id);

	public BroadcastDto_Reservation selectone(int seq);

	public int insert(BroadcastDto_Reservation dto);

	public int update(BroadcastDto_Reservation dto);

	public int delete(int seq);
	
	/*
	public int multidelete(String[] seq) {

	}

	public List<BroadcastDto> getViewList(String id, String yM) {

	}

	public int getViewCount(String id, String ymd) {

	}*/
}
