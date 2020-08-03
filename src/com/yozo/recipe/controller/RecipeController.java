package com.yozo.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.yozo.recipe.biz.RecipeBiz;
import com.yozo.recipe.dto.RecipeDto;

/**
 * Servlet implementation class RecipeController
 */
@WebServlet("/recipe.do")
public class RecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RecipeController() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("recipe.do왔다~");
		String command=request.getParameter("command");
		RecipeBiz biz=new RecipeBiz();
		
		//Json데이터 DB에 입력
		if(command.equals("jsoninsert")) {
			System.out.println("jsoninsert!!왔다");
			String rson=request.getParameter("rson");
			
			JsonElement element=JsonParser.parseString(rson);
					//어떤 형식일지를 알 수 없기 떄문에 어떤 JSON데이터 형태도 저장할 수 있는 JSONElement형태로 받아 준다 
					//jsonelement는 json요소를 나타내는 클래스
					//jsonparser클래스의parseString메소드로 JSON형태의 문자열을 JSON타입으로 변경해주고
								//	처음 Json요소를 가져올 때 기본적으로 jsonelement형태로 받아온다 
								//	문자열을 JSON형태로 바꿔준다
								//지정된 JSON 문자열을 구문 분석 트리로 구문 분석
			
			List<RecipeDto> list=new ArrayList<RecipeDto>();
		//	for(int i=0;i<rson.length;i++) {
				/*String[] arr=rson[i].split(regex)*/
				System.out.println(rson);
		//	}
		/*	int res=biz.insert();*/
			
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(s);
	}

}
