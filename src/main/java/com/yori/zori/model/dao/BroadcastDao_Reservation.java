package com.yori.zori.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yori.zori.model.dto.BroadcastDto_Reservation;

public class BroadcastDao_Reservation{
	private String namespace = "Broadcast_Reservation.";

	public List<BroadcastDto_Reservation> checklist(String id) {
		SqlSession session = null;
		List<BroadcastDto_Reservation> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectlist",id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

	public BroadcastDto_Reservation selectone(int seq) {
		SqlSession session = null;
		BroadcastDto_Reservation dto = null;
		session = getSqlSessionFactory().openSession(false);
		dto = session.selectOne(namespace + "selectOne", seq);
		return dto;
	}

	public int insert(BroadcastDto_Reservation dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return res;
	}

	public int update(BroadcastDto_Reservation dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "update", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return res;
	}

	public int delete(int seq) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "delete", seq);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
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
