			package com.yozo.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yozo.recipe.biz.RecipeBiz;
import com.yozo.recipe.dto.RecipeDto;
import com.yozo.user.dto.MemberDto;

/**
 * Servlet implementation class RecipeController
 */
@WebServlet("/recipe.do")
public class RecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecipeController() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("recipe.do왔다~");
		String command = request.getParameter("command");
		RecipeBiz biz = new RecipeBiz();
		HttpSession session=request.getSession();
		
		//레시피 리스트
		if(command.equals("recipe_list")) {
			System.out.println("controller_recipe_list");
			List<RecipeDto> list=biz.selectList();
			if(list!=null) {
				System.out.println("list잘왔네~");
			}else {
				System.out.println("list어딨어ㅡㅡ");
			}
			/* System.out.println(list.get(0)); */
			request.setAttribute("list", list);
			dispatch("/view/recipe/recipe_list.jsp", request, response);
			
			
		}
		//레시피 상세
		else if(command.equals("recipe_detail")) {
			System.out.println("controller_recipe_detai");
			int recipe_no=Integer.parseInt(request.getParameter("recipe_no"));
			RecipeDto dto=biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			System.out.println(dto);
			
			List<String> detail=new ArrayList<String>();
			List<String> material=new ArrayList<String>();
			
			JsonElement element_detail=JsonParser.parseString(dto.getRecipe_detail());
			JsonElement element_material=JsonParser.parseString(dto.getRecipe_material());
			
			JsonArray tmp_detail=element_detail.getAsJsonArray();
				for(int i=0;i<tmp_detail.size();i++) {
					detail.add(tmp_detail.get(i).getAsString());
				}
				
			JsonArray tmp_material=element_material.getAsJsonArray();
				for(int i=0;i<tmp_material.size();i++) {
					material.add(tmp_material.get(i).getAsString());
				}
				
				System.out.println("detail: "+detail);
				System.out.println(detail.get(0));
				System.out.println("material: "+material);
				request.setAttribute("detail", detail);
				request.setAttribute("material", material);
				
			
			dispatch("/view/recipe/recipe_detail.jsp", request, response);
		}
		//레시피 작성
		else if(command.equals("recipe_insert")) {
			System.out.println("controller_recipe_insert");
			//여기서 등록된 값을 받아주어 db로 저장시켜야함!
			
			
			//이미지 업로드 하기 전에 데이터 받아옴 
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			String recipe_main_photo = request.getParameter("recipe_main_photo");
			String recipe_title = request.getParameter("recipe_title");
			String cate_theme = request.getParameter("cate_theme");
			String cate_kind = request.getParameter("cate_kind");
			String main_material_one = request.getParameter("main_material_one");
			String recipe_material  = request.getParameter("recipe_material");
			String recipe_photo = request.getParameter("recipe_photo");
			String recipe_detail = request.getParameter("recipe_detail");
			
			MemberDto id = (MemberDto)session.getAttribute("rdto");
			String member_id = id.getMember_id();
			
			int res = 0;
			res = biz.insert(new RecipeDto(1,recipe_main_photo, member_id, recipe_title, recipe_photo, recipe_detail, null, main_material_one, cate_theme, cate_kind, recipe_material,0));
			
			if(res>0) {
				System.out.println("레시피 인서트 성공");
				jsResponse("레시피를 성공적으로 등록하였습니다.", "recipe.do?command=recipe_list", response);
			}else {
				System.out.println("레시피 인서트 실패;");
				jsResponse("레시피 등록을 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}
			
			
		
		}
		
	
			
		
		//레시피 수정
		else if(command.equals("recipe_update")) {
			System.out.println("controller_recipe_update");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			System.out.println("recipe_ no : " + recipe_no);
			RecipeDto dto = biz.selectOne(recipe_no);
			request.setAttribute("dto", dto);
			dispatch("/view/recipe/recipe_update.jsp", request, response);
		}
		//레시피 삭제
		else if(command.equals("recipe_delete")) {
			System.out.println("controller_recipe_delete");
			int recipe_no = Integer.parseInt(request.getParameter("recipe_no"));
			
			int res = biz.delete(recipe_no);
			if(res>0) {
				System.out.println("레시피 하나 삭제성공");
				jsResponse("레시피를 성공적으로 삭제하였습니다.", "/recipe.do?command=recipe_list", response);
			}else {
				System.out.println("레시피 하나 삭제실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "/recipe.do?command=recipe_list", response);
			}
			
		//레시피 작성 폼
		}else if(command.equals("recipeinsertform")) {
			System.out.println("controller_recipe_insertform");
			response.sendRedirect(request.getContextPath() + "/view/recipe/recipe_insert.jsp");
		
		//레시피 여러개 삭제
		}else if(command.contentEquals("recipemuldel")) {
			System.out.println("controller_recipe_muldel");
			String[] recipe_no = request.getParameterValues("chk");
			System.out.println(recipe_no+ "레시피 번호 오냐? 오냐고 와라!!!!");
			
			int res = biz.multiDelte(recipe_no);
			
			if(res>0) {
				System.out.println("레시피 멀티 딜리트 성공");
				jsResponse("선택하신 레시피를 성공적으로 삭제하였습니다.", "recipe.do?command=recipe_list", response);
			}else {
				System.out.println("레시피 멀티 딜리트 실패");
				jsResponse("레시피를 삭제하는데 실패하였습니다.", "recipe.do?command=recipe_list", response);
			}
			
			//레시피 등록
		
			//이미지 업로드 
		}else if(command.equals("imgupload")) {
			System.out.println("imgUpload왔다잉");
			System.out.println(request.getContentType());
			String realFolder = "";

			String filename1 = ""; // 업로드한 파일이름
			int maxSize = 1024 * 1024 * 5; // 파일 사이즈 설정: 5M
			/* String encType = "multipart/form-data"; */
			String savefile = "recipeimg";
			ServletContext scontext = getServletContext();
			System.out.println("scontext:" + scontext);
			realFolder = scontext.getRealPath(savefile);

			System.out.println("realFolder" + realFolder);

			try {
				MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,
						new DefaultFileRenamePolicy());
				Enumeration<?> files = multi.getFileNames(); // 전송한 전체 파일이름들을 가져온다.
				System.out.println("files" + files);
				String file1 = (String) files.nextElement();
				System.out.println("file1:" + file1);
				// 파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다
				// 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다.(중복 처리)
				filename1 = multi.getFilesystemName(file1);
			} catch (Exception e) {
				System.out.println("레시피 이미지 업로드 컨트롤러에서 에러!");
				e.printStackTrace();
			}

			String fullpath = realFolder + "\\" + filename1;
			System.out.println("fullpath:" + fullpath);
			
			
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
