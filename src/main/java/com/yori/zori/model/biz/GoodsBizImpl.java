package com.yori.zori.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yori.zori.model.dao.GoodsDao;
import com.yori.zori.model.dto.AnswerDto;
import com.yori.zori.model.dto.GoodsDto;

@Service
public class GoodsBizImpl {

   @Autowired
   private GoodsDao dao;
   
   public int insert(GoodsDto dto) {
      return dao.insert(dto) ;
   }
   
   public List<GoodsDto> selectList(){
      return dao.selectList();
   }
   public GoodsDto selectOne(int goods_no) {
      return dao.selectOne(goods_no);
   }
   public int update(GoodsDto dto) {
      return dao.update(dto);
   }
   public int delete(int goods_no) {
      return dao.delete(goods_no);
   }
   
   public int multiDelete(String[] goods_no) {
      return dao.multiDelete(goods_no);
   }
   
   
   //detail 댓글달기 시작 
   public List<AnswerDto> answerList(int goods_no){
      return dao.answerList(goods_no);
   }
   
   public int answerinsert(AnswerDto dto) {
      return dao.answerinsert(dto);
   }
   
   //관리자 댓글 끼어서 달기
   public int rereplyinsert(AnswerDto dto) {
      return dao.rereplyinsert(dto);
   }
   
   public int rereplyupdate(int goods_re_no) {
      return dao.rereplyupdate(goods_re_no);
            
   }
   public int answerProc(AnswerDto dto) {
      
      int rereplyupdate = dao.rereplyupdate(dto.getGoods_re_no());
      int rereplyinsert = dao.rereplyinsert(dto);
      
      return rereplyupdate + rereplyinsert;
      
   }

public int answerDelete(int goods_re_no) {
	// TODO Auto-generated method stub
	return dao.replydelete(goods_re_no);
}
   
}