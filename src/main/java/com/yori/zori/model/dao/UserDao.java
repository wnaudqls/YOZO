package com.yori.zori.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.yori.zori.model.dto.MemberDto;

public class UserDao{

	private String namespace = "member";
	
	public MemberDto login(String member_id, String member_pw) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		
		 
		
		

		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+".login",dto);
		System.out.println(rdto);
		session.close();
		
		
		return rdto;
	}
	
	public MemberDto idCheck(String member_id) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_id(member_id);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+".idcheck",dto);
		
		session.close();
		
		
		return rdto;
	}
	public MemberDto nickCheck(String member_nick) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_nick(member_nick);
		 
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+".nickcheck",dto);
		
		session.close();
		
		
		return rdto;
	}
	
	public boolean insert(MemberDto dto) {
		
		SqlSession session = null;
		int insertRs = 0;
		System.out.println("userDao    dto = "+dto );
		
		session = getSqlSessionFactory().openSession(true);
		insertRs = session.insert(namespace+".insert",dto);
		if(insertRs>0) {
			session.commit();
		}
		
		System.out.println("JOIN 결과는 ?? : "+ insertRs);
		
		return (insertRs > 0)? true : false;
	}
	
	public boolean update(MemberDto dto) {
		
		SqlSession session = null;
		int updateRs = 0;
		System.out.println("userDao    dto = "+dto );
		
		session = getSqlSessionFactory().openSession(true);
		updateRs = session.update(namespace+".update",dto);
		if(updateRs>0) {
			session.commit();
		}
		System.out.println("개인정보 수정 결과는 ?? : "+ updateRs);
		
		return (updateRs > 0)? true : false;
	}
	
	public boolean delete(MemberDto dto) {
		
		SqlSession session = null;
		int deleteRs = 0;
		System.out.println("userDao    dto = "+dto );
		
		session = getSqlSessionFactory().openSession(true);
		deleteRs = session.update(namespace+".delete",dto);
		if(deleteRs>0) {
			session.commit();
		}
		
		System.out.println("계정 삭제 결과는 ?? : "+ deleteRs);
		
		return (deleteRs > 0)? true : false;
	}
	
	public MemberDto findId(String member_email) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_email(member_email);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+".findId",dto);
		
		session.close();
		
		
		return rdto;
	}
	public MemberDto findPw(String member_email) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_email(member_email);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+".findPw",dto);
		
		session.close();
		
		
		return rdto;
	}
	
	

	
	
	
}
