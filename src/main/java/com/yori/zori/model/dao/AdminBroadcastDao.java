package com.yori.zori.model.dao;
//package com.yozo.admin.dao;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//
//import com.yozo.broadcast.dto.BroadcastDto;
//import com.yozo.common.SqlMapConfig;
//import com.yozo.user.dto.MemberDto;
//
//public class AdminBroadcastDao extends SqlMapConfig{
//	private String namespace = "adminbroadcast-mapper.";
//	
//	public List<> selectList(){
//		System.out.println("dao list입장");
//	      SqlSession session = null;
//	      List<> list = null;
//	      
//	      try {
//	    	 System.out.println("dao list 중간");
//	         session = getSqlSessionFactory().openSession(false);
//	         list = session.selectList(namespace+"selectList");
//	      } catch (Exception e) {
//	    	 System.out.println("dao errors");
//	         e.printStackTrace();
//	      } finally {
//	         session.close();
//	      }
//	      return list;
//	}
//	public int update(BroadcastDto dto) {
//		System.out.println("업데이트 입장");
//		SqlSession session = null;
//		int res = 0;
//		
//		try {
//			System.out.println("중간");
//			session = getSqlSessionFactory().openSession(false);
//			System.out.println(dto.getReservation_confirm());
//			System.out.println(session);
//			res = session.update("adminbroadcast-mapper.update", dto);
//			System.out.println(res);
//			System.out.println("왓냐");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			session.commit();
//			session.close();
//		}
//		return res;
//	}
//	
//	public int delete(int reservation_no) {
//		SqlSession session = null;
//		int res = 0;
//		
//		try {
//			session = getSqlSessionFactory().openSession();
//			res = session.delete(namespace+"delete", reservation_no);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//		return res;
//	}
//	
//	public int multidelete(String[] reservation_no) {
//		int count = 0;
//		Map<String, String[]> map = new HashMap<>();
//		map.put("reservation_no", reservation_no);
//		SqlSession session = null;
//		
//		try {
//			session = getSqlSessionFactory().openSession(false);
//			count = session.delete(namespace+"multidelte",map);
//			if(count == reservation_no.length) {
//				session.commit();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//		return count;
//	}
//}
