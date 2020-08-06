package com.yozo.broadcast.biz;

import java.util.List;


import com.yozo.broadcast.dao.BroadcastDao;
import com.yozo.broadcast.dao.BroadcastDao_Reservation;
import com.yozo.broadcast.dto.BroadcastDto;
import com.yozo.broadcast.dto.BroadcastDto_Reservation;

public class BroadcastBiz{
	public BroadcastDao Broadcastdao = new BroadcastDao();
	public BroadcastDao_Reservation dao_Reservation = new BroadcastDao_Reservation(); 
	public List<BroadcastDto> selectList(String ymd) {
		return Broadcastdao.selectList(ymd);

	}
	
	public BroadcastDto selectone(int seq) {

		return Broadcastdao.selectone(seq);
	}

	public int insert(BroadcastDto_Reservation dto) {
	
		return dao_Reservation.insert(dto);
	}

	public int update(BroadcastDto dto) {
	
		return Broadcastdao.update(dto);
	}

	public int delete(int seq) {
	
		return Broadcastdao.delete(seq);
	}
	public List<BroadcastDto_Reservation> checklist(String id){
		return dao_Reservation.checklist(id);
	}
}
