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
		
		String command=request.getParameter("command");
		RecipeBiz biz=new RecipeBiz();
		
		//Json데이터 DB에 입력
		if(command.equals("jsoninsert")) {
			String[] rson=request.getParameterValues("rson");
			List<RecipeDto> list=new ArrayList<RecipeDto>();
			for(int i=0;i<rson.length;i++) {
				/*String[] arr=rson[i].split(regex)*/
				System.out.println(list.get(i));
			}
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
