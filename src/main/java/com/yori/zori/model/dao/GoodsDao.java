package com.yori.zori.model.dao;

import java.util.List;

import com.yori.zori.model.dto.AnswerDto;
import com.yori.zori.model.dto.GoodsDto;

public interface GoodsDao {

	String namespace = "goods.";

	public int insert(GoodsDto dto);

	public List<GoodsDto> selectList();

	public GoodsDto selectOne(int goods_no);
	

	public int update(GoodsDto dto);

	// 굿즈 게시글 하나 삭제
	public int delete(int goods_no);

	// 굿즈 게시글 여러개 삭제
	public int multiDelete(String[] goods_no2);

	// 댓글시작

	public List<AnswerDto> answerList(int goods_no);
	public int answerinsert(AnswerDto dto);

	// 원댓글삭제
	public int answerdelete(int goods_re_no);
	// 끼어드는 곳 , 즉 댓글이 들어갈 공간을 만들어줌
	public int rereplyupdate(int goods_re_no);

	// 관리자의 댓글
	public int rereplyinsert(AnswerDto dto);

	public int replydelete(int goods_re_no);

}