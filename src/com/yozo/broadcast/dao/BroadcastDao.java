package com.yozo.broadcast.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yozo.broadcast.dto.BroadcastDto;

public class BroadcastDao extends Broadcast_SqlConfig {
	private String namespace = "Broadcast.";

	public List<BroadcastDto> selectList(String ymd) {
		SqlSession session = null;
		List<BroadcastDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectlist",ymd);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

	public BroadcastDto selectone(int seq) {
		SqlSession session = null;
		BroadcastDto dto = null;
		session = getSqlSessionFactory().openSession(false);
		dto = session.selectOne(namespace + "selectOne", seq);
		return dto;
	}

	public int insert(BroadcastDto dto) {
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

	public int update(BroadcastDto dto) {
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
