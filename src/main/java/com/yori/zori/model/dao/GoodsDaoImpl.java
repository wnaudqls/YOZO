package com.yori.zori.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yori.zori.model.dto.AnswerDto;
import com.yori.zori.model.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao{

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int insert(GoodsDto dto) {
		int res = 0;
		System.out.println("여기는 insert dao다 오바오바" + dto);
		try {

			res = session.insert(namespace + "insert", dto);
		} catch (Exception e) {

		}
		return res;
	}
	@Override
	public List<GoodsDto> selectList() {

		List<GoodsDto> list = null;

		try {
			list = session.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("selectList 오류");
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public GoodsDto selectOne(int goods_no) {
		GoodsDto dto = null;

		try {
			dto = session.selectOne(namespace + "selectOne", goods_no);
		} catch (Exception e) {
			System.out.println("selectOne 오류");
			e.printStackTrace();
		}

		return dto;

	}
	@Override
	public int update(GoodsDto dto) {
		int res = 0;

		try {
			res = session.update(namespace + "update", dto);

		} catch (Exception e) {
			System.out.println("update오류");
			e.printStackTrace();
		}

		return res;
	}
	@Override
	// 굿즈 게시글 하나 삭제
	public int delete(int goods_no) {
		int res = 0;

		try {
			res = session.delete(namespace + "delete", goods_no);

		} catch (Exception e) {
			System.out.println("delete 오류");
			e.printStackTrace();
		}
		return res;
	}
	@Override
	// 굿즈 게시글 여러개 삭제
	public int multiDelete(String[] goods_no2) {
		int count = 0;
		// 스트링 타입으로 스트링 배열 보낼 거!
		Map<String, String[]> map = new HashMap<>();
		map.put("goods_no", goods_no2);

		try {
			count = session.delete(namespace + "muldelete", map);

		} catch (Exception e) {
			System.out.println("goods dao에서 멀딜 오류");
			e.printStackTrace();
		}
		return count;
	}

	// 댓글시작
	@Override
	public List<AnswerDto> answerList(int goods_no) {
		System.out.println("dao : selectList왔나?");

		List<AnswerDto> list = null;

		try {

			list = session.selectList(namespace + "answerList", goods_no);
		} catch (Exception e) {
			System.out.println("answerList 오류(다오)");
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public int answerinsert(AnswerDto dto) {

		int res = 0;

		try {

			System.out.println(dto);
			res = session.insert(namespace + "answerinsert", dto);
		} catch (Exception e) {
			System.out.println("answerinsert오류");
			e.printStackTrace();
		}
		return res;
	}

	// 원댓글삭제
	@Override
	public int answerdelete(int goods_re_no) {

		int res = 0;

		try {
			res = session.delete(namespace + "answerdelete", goods_re_no);
		} catch (Exception e) {
			System.out.println("goodsdao에서 answerdelete오류");
			e.printStackTrace();
		}
		return res;
	}

	// 끼어드는 곳 , 즉 댓글이 들어갈 공간을 만들어줌
	@Override
	public int rereplyupdate(int goods_re_no) {

		int res = 0;
		System.out.println("모야" + goods_re_no);
		try {
			res = session.update(namespace + "rereplyupdate", goods_re_no);
		} catch (Exception e) {
			System.out.println("goodsdao에서 rereplyupdate오류");
			e.printStackTrace();
		}
		return res;
	}

	// 관리자의 댓글
	@Override
	public int rereplyinsert(AnswerDto dto) {

		int res = 0;

		try {

			res = session.insert(namespace + "rereplyinsert", dto);
		} catch (Exception e) {
			System.out.println("goodsdao에서 rereplyInsert오류 ");
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public int replydelete(int goods_re_no) {

		int res = 0;

		try {

			res = session.delete(namespace + "rereplydelete", goods_re_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}