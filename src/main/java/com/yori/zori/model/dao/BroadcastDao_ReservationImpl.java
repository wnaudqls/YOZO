package com.yori.zori.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.BroadcastDto_Reservation;

@Repository
public class BroadcastDao_ReservationImpl implements BroadcastDao_Reservation{
	@Autowired
	SqlSessionTemplate session;
	@Override
	public List<BroadcastDto_Reservation> checklist(String id) {
		List<BroadcastDto_Reservation> list = null;
		try {
			list = session.selectList(namespace + "selectlist",id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;

	}
	@Override
	public BroadcastDto_Reservation selectone(int seq) {
		BroadcastDto_Reservation dto = null;
		dto = session.selectOne(namespace + "selectOne", seq);
		return dto;
	}
	@Override
	public int insert(BroadcastDto_Reservation dto) {

		int res = 0;
		try {
		
			res = session.insert(namespace + "insert", dto);
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return res;
	}
	@Override
	public int update(BroadcastDto_Reservation dto) {
	
		int res = 0;
		try {
			
			res = session.insert(namespace + "update", dto);
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return res;
	}
	@Override
	public int delete(int seq) {
	
		int res = 0;
		try {
			
			res = session.insert(namespace + "delete", seq);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return res;
	}
	
	/*
	public int multidelete(String[] seq) {

	}

	public List<BroadcastDto> getViewList(String id, String yM) {

	}

	public int getViewCount(String id, String ymd) {

	}*/
}
