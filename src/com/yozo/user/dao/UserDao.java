package com.yozo.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.yozo.common.SqlMapConfig;
import com.yozo.user.dto.MemberDto;

public class UserDao extends SqlMapConfig{

	private String namespace = "member.";
	
	public MemberDto login(String member_id, String member_pw) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		
		
		//System.out.println(dto.getMember_pw());
		
		

		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"login",dto);
		System.out.println(rdto);
		session.close();
		
		
		return rdto;
	}
	
	public MemberDto idCheck(String member_id) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		System.out.println("id어딧게"+member_id);
		dto.setMember_id(member_id);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"idcheck",dto);
		
		System.out.println("넌뭐니"+rdto);
		session.close();
		
		
		return rdto;
	}
	public MemberDto nickCheck(String member_nick) {
		
		SqlSession session = null;
		MemberDto rdto = null;
		MemberDto dto = new MemberDto();
		System.out.println("id어딧게"+member_nick);
		dto.setMember_nick(member_nick);
		
		
		session = getSqlSessionFactory().openSession(true);
		rdto = session.selectOne(namespace+"nickcheck",dto);
		
		System.out.println("넌뭐니"+rdto);
		session.close();
		
		
		return rdto;
	}
	
	public MemberDto join(MemberDto dto) {
		
		SqlSession session = null;
		
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//이메일 인증 관련 메소드
	
	private Connection conn;

	private ResultSet rs;



	public String getUserEmail(String member_id) {

		String SQL = "SELECT MEMBER_EMAIL FROM MEMBER WHERE MEMBER_ID = ?";

		try {

			PreparedStatement pstm = conn.prepareStatement(SQL);

			pstm.setString(1, member_id);

			rs = pstm.executeQuery();

			while(rs.next()) {

				return rs.getString(1); // 이메일 주소 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // 데이터베이스 오류

	}

	

	public boolean getUserEmailChecked(String member_id) {

		String SQL = "SELECT USER_EMAIL_CHECKED FROM MEMBER WHERE MEMBER_ID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, member_id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getBoolean(1); // 이메일 등록 여부 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 데이터베이스 오류

	}

	

	public boolean setUserEmailChecked(String member_id) {

		String SQL = "UPDATE MEMBER SET USER_EMAIL_CHECKED = TRUE WHERE MEMBER_ID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, member_id);

			pstmt.executeUpdate();

			return true; // 이메일 등록 설정 성공

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 이메일 등록 설정 실패

	}



	
	
	
	
}
