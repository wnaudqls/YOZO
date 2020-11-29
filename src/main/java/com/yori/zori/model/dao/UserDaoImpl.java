package com.yori.zori.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.MemberDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public MemberDto login(MemberDto dto) {

		MemberDto rdto = null;

		rdto = session.selectOne(namespace + ".login", dto);
		System.out.println(rdto);

		return rdto;
	}

	@Override
	public MemberDto idCheck(MemberDto dto) {

		MemberDto rdto = null;

		rdto = session.selectOne(namespace + ".idcheck", dto);

		return rdto;
	}

	@Override
	public MemberDto nickCheck(MemberDto dto) {

		MemberDto rdto = null;

		rdto = session.selectOne(namespace + ".nickcheck", dto);

		return rdto;
	}

	@Override
	public boolean insert(MemberDto dto) {

		int insertRs = 0;
		System.out.println("userDao    dto = " + dto);

		insertRs = session.insert(namespace + ".insert", dto);

		System.out.println("JOIN 결과는 ?? : " + insertRs);

		return (insertRs > 0) ? true : false;
	}

	@Override
	public boolean update(MemberDto dto) {

		int updateRs = 0;
		System.out.println("userDao /n dto = " + dto);

		updateRs = session.update(namespace + ".update", dto);

		System.out.println("개인정보 수정 결과는 ?? : " + updateRs);

		return (updateRs > 0) ? true : false;
	}

	@Override
	public boolean delete(MemberDto dto) {

		int deleteRs = 0;
		System.out.println("userDao    dto = " + dto);

		deleteRs = session.update(namespace + ".delete", dto);

		System.out.println("계정 삭제 결과는 ?? : " + deleteRs);

		return (deleteRs > 0) ? true : false;
	}

	@Override
	public MemberDto findId(MemberDto dto) {

		MemberDto rdto = null;
		rdto = session.selectOne(namespace + ".findId", dto);

		return rdto;
	}

	@Override
	public MemberDto findPw(MemberDto dto) {

		MemberDto rdto = null;

		rdto = session.selectOne(namespace + ".findPw", dto);

		return rdto;
	}

}
