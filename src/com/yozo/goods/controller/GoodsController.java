package com.yozo.goods.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yozo.goods.biz.GoodsBiz;
import com.yozo.goods.dto.GoodsDto;


/**
 * Servlet implementation class GoodsController
 */
@WebServlet("/goods.do")
public class GoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public GoodsController() {
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		System.out.println("정신차리지");
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		GoodsBiz biz = new GoodsBiz();
		
		//굿즈 상품 등독
		if(command.equals("goodsinsertres")) {
			System.out.println("goodsinsertres왔음");
			//response.sendRedirect(request.getContextPath()+"/view/goods/goods_insert.jsp");
			String goods_title = request.getParameter("goods_title");
			int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
			int goods_price = Integer.parseInt(request.getParameter("goods_price"));
			String goods_content = request.getParameter("goods_content");
			String goods_main_photo=request.getParameter("goods_main_photo");
			int res=0;
			System.out.println(goods_content);
			 res = biz.insert(new GoodsDto(1,"session값",goods_title,goods_price,goods_quantity,"사진", goods_content,null,goods_main_photo));
			 
			 if(res>0) {
				 dispatch("goods_list.jsp", request, response);
			 }else {
				 jsResponse("작성 실패","유정쓰가만든 goods_insertform", response);
			 }
			 
			 

		}else if(command.equals("goodsinsertform")) {
			response.sendRedirect(request.getContextPath()+"/view/goods/goods_insert.jsp");
		}else if(command.equals("goodslist")) {
			response.sendRedirect(request.getContextPath()+"/view/goods/goods_list.jsp");
		}
		 //test
		else if(command.equals("imgUpload")) {
			System.out.println("imgUpload왔다잉");
			System.out.println(request.getContentType());
			String realFolder = ""; 
			String filename1 = "";	//업로드한 파일이름  	
			int maxSize = 1024*1024*5; 	//파일 사이즈 설정: 5M
			String encType = "multipart/form-data"; 	
			String savefile = "imgtest"; 
			ServletContext scontext = getServletContext();
			System.out.println("scontext:"+scontext);
			realFolder = scontext.getRealPath(savefile);
			System.out.println("realFolder"+realFolder);
			
			try{ 
			MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, new DefaultFileRenamePolicy()); 
			Enumeration<?> files = multi.getFileNames(); //전송한 전체 파일이름들을 가져온다.
			System.out.println("files"+files);
			String file1 = (String)files.nextElement();
			System.out.println("file1:"+file1);
			//파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다
			//이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다.(중복 처리)
			filename1 = multi.getFilesystemName(file1); 
			} catch(Exception e) { 
				System.out.println("이런 싸발면");
			e.printStackTrace(); 
			} 
			 
			String fullpath = realFolder + "\\" + filename1; 
			System.out.println("fullpath:"+fullpath);
		}
		
		
	}
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" +
					"alert('"+msg+"');" +
					"location.href='" + url + "';" +
					"</script>";
		response.getWriter().append(s);
	}
	
	

}
