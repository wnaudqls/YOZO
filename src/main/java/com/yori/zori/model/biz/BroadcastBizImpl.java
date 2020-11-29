package com.yori.zori.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dto.BroadcastDto;
import com.yori.zori.model.dto.BroadcastDto_Reservation;
import com.yori.zori.model.dao.BroadcastDao;
import com.yori.zori.model.dao.BroadcastDao_Reservation;
import com.yori.zori.model.dao.BroadcastDao_ReservationImpl;

@Service
public class BroadcastBizImpl implements BroadcastBiz{
	
	@Autowired
	private BroadcastDao Broadcastdao;
	
	@Autowired
	private BroadcastDao_Reservation dao_Reservation;
	
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
