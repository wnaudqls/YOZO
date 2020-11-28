package com.yori.zori.model.biz;

import java.util.List;

import com.yori.zori.model.dto.BroadcastDto;
import com.yori.zori.model.dto.BroadcastDto_Reservation;

public interface AdminBiz {
	public BroadcastDto selectone(int seq);
	public int insert(BroadcastDto_Reservation dto);
	public int update(BroadcastDto dto);
	public int delete(int seq);
	public List<BroadcastDto_Reservation> checklist(String id);
}
