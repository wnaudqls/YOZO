
package com.yori.zori.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yori.zori.model.biz.LikeBiz;
import com.yori.zori.model.biz.LikeBizImpl;
import com.yori.zori.model.dto.LikeDto;


@RestController
public class LikeController extends HttpServlet {

	@Autowired
	LikeBiz biz;

	@RequestMapping("like")
	@ResponseBody
	public Map<String, String> asdf(@RequestBody LikeDto dto) {
		Map<String, String> map = new HashMap<String, String>();
		String vaild = "";
		boolean chk = biz.overlap_check(dto);
		System.out.println("결과: "+chk);
		if(chk) {
			int cancel = biz.cancel_like(dto);
			int delete = biz.delete_like(dto);
			int result = cancel +delete;
			if(result >= 2) {
				vaild = "좋아요 취소 성공";
				System.out.println(vaild);
				map.put("vaild",vaild);
			}
		}else {
			int res = biz.insert_like(dto);
			if(res > 0) {
				int overlap = biz.addcount(dto);
				if(overlap > 0) {
					vaild = "좋아요 추가 성공";
					System.out.println(vaild);
					map.put("vaild",vaild);
				}else {
					vaild = "좋아요 추가 과정에 오류가 발생했습니다.";
					System.out.println(vaild);
					map.put("vaild",vaild);
				}
			}
		}
		return map;
	}
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if (command.equals("like")) {

			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			int member_no = Integer.parseInt(request.getParameter("member_no"));
			
			boolean chk = biz.overlap_check(new LikeDto(member_no, recipe_no));
			System.out.println(chk);
			if (chk) {
				int cancel = biz.cancel_like(recipe_no);
				int delete = biz.delete_like(new LikeDto(member_no, recipe_no));
				System.out.println("레시피번호: " + recipe_no + "유저번호: " + member_no);
				int result = cancel + delete;
				System.out.println(result);
				if (result >= 2) {
					response.getWriter().write("좋아요 취소 성공");
				}
			} else {
				int res = biz.insert_like(new LikeDto(member_no, recipe_no));
				if (res > 0) {

					int overlap = biz.addcount(recipe_no);
					if (overlap > 0) {
						System.out.println("좋아요 추가 성공");
						response.getWriter().write("추가 성공");
					} else {
						System.out.println("오류 발생");
						response.getWriter().write("오류 발생");
					}
				}
			}
		}
	}*/
}
