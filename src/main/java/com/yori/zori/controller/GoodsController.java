package com.yori.zori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.bind.v2.TODO;
import com.yori.zori.goods.biz.GoodsBiz;
import com.yori.zori.goods.dao.CartDAO;
import com.yori.zori.goods.dto.AnswerDto;
import com.yori.zori.goods.dto.GoodsDto;
import com.yori.zori.user.dto.MemberDto;

import net.sf.json.JSONArray;

@WebServlet("/goods.do")
public class GoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GoodsController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		GoodsBizImpl biz = new GoodsBizImpl();
		HttpSession session = request.getSession();

		// 굿즈 상품 등독
		if (command.equals("goodsinsertres")) {
			System.out.println("goodsinsertres왔음");

			String goods_title = request.getParameter("goods_title");
			int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
			int goods_price = Integer.parseInt(request.getParameter("goods_price"));
			String goods_content = request.getParameter("goods_content");
			String goods_main_photo = request.getParameter("goods_main_photo");

			MemberDto id = (MemberDto) session.getAttribute("rdto");
			String member_id = id.getMember_id();

			int res = 0;

			System.out.println(goods_content);

			res = biz.insert(new GoodsDto(1, member_id, goods_title, goods_price, goods_quantity, goods_content, null,

					goods_main_photo));

			if (res > 0) {
				System.out.println("상품등록성공했음");
				jsResponse("상품을 성공적으로 등록하였습니다.", "goods.do?command=goodslist", response);
			} else {
				jsResponse("상품을 등록하는데 실패하였습니다.", "goods.do?command=goodslist", response);
			}

		}
		// 굿즈 인서트 폼
		else if (command.equals("goodsinsertform")) {
			response.sendRedirect(request.getContextPath() + "/view/goods/goods_insert.jsp");

		}
		// 굿즈 리스트
		else if (command.equals("goodslist")) {
			// db에서 값 가지고 오기!
			List<GoodsDto> list = biz.selectList();
			request.setAttribute("list", list);
			ServletContext scontext = getServletContext();
			String savefile = "goodsimages";
			String realFolder = scontext.getRealPath(savefile);
			request.setAttribute("path", realFolder);
			dispatch("/view/goods/goods_list.jsp", request, response);
		}

		// 이미지 업로드
		else if (command.equals("imgUpload")) {
			System.out.println("imgUpload왔다잉");
			System.out.println(request.getContentType());
			String realFolder = "";

			String filename1 = ""; // 업로드한 파일이름
			int maxSize = 1024 * 1024 * 5; // 파일 사이즈 설정: 5M
			/* String encType = "multipart/form-data"; */
			String savefile = "goodsimages";
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
				System.out.println("이런 싸발면");
				e.printStackTrace();
			}

			String fullpath = realFolder + "\\" + filename1;
			System.out.println("fullpath:" + fullpath);

			// 굿즈 상세보기 : 댓글등록
		} else if (command.equals("answerinsert")) {
			System.out.println("answerinsert왔어???왔냐구");

			int goods_no = Integer.parseInt(request.getParameter("goods_no"));
			String member_id = "";
			try {
				MemberDto test = (MemberDto) session.getAttribute("rdto");
				member_id = test.getMember_id();
			} catch (Exception e) {
				System.out.println("헐");
				jsResponse("로그인을 해주세요", "/YORIZORI/view/user/login.jsp", response);
				e.printStackTrace();
			}

			String goods_re_content = request.getParameter("goods_re_content");
			String member_nick = request.getParameter("member_nick");
			System.out.println("answerinsert에서 진짜로 content 뽑는다" + goods_re_content);
			System.out.println(goods_no + member_id + goods_re_content + member_nick);

			/* goods_re 필요없고 / goods_re_no 필요없고 */
			int res = biz
					.answerinsert(new AnswerDto(1, goods_no, member_id, goods_re_content, null, 1, 1, 0, member_nick,"N"));
			System.out.println("int res 지남 if 전");
			if (res > 0) {
				System.out.println("댓글작성성공");
				dispatch("/view/goods/goods_detail.jsp", request, response);
			} else {
				jsResponse("댓글 작성 실패", "goods_answer.jsp", response);
			}

			// 댓글 json형태로 바꿔주고 ajax로 보내기.....
		} else if (command.equals("answerlist")) {
			System.out.println("answerlist도착?");
			int goods_no = Integer.parseInt(request.getParameter("goods_no"));
			System.out.println("answerlistd에서" + goods_no);

			List<AnswerDto> list = biz.answerList(goods_no);
			request.setAttribute("list", list);
			// 번지수 댓글이 나옴
			/* System.out.println(list.get(1)); */

			/* JSONObject obj = new JSONObject(); */

			/* obj.put("list", list); */
			Gson gson = new Gson();
			String str = gson.toJson(list);

			System.out.println("answerlist컨트롤러에서 보낸다" + str);

			PrintWriter out = response.getWriter();
			out.println(str);

		}
		else if (command.equals("answerdelete")) {
			
			System.out.println("answerdelete왔다");
			int goods_re_no=Integer.parseInt(request.getParameter("goods_re_no"));
			int res=biz.answerDelete(goods_re_no);
			if (res > 0) {
				System.out.println("댓글삭제성공");
				dispatch("/view/goods/goods_detail.jsp", request, response);
			} else {
				jsResponse("댓글 삭제 실패", "goods_answer.jsp", response);
			}
		}
		

		// 굿즈 상세페이지
		else if (command.equals("goodsdetail")) {
			int goods_no = Integer.parseInt(request.getParameter("goods_no"));
			System.out.println(goods_no + "굿즈번호");
			GoodsDto dto = biz.selectOne(goods_no);
			request.setAttribute("dto", dto);
			dispatch("/view/goods/goods_detail.jsp", request, response);

		}

		// 관리자 댓글
		else if (command.equals("goodsadminre")) {
			System.out.println("관리자댓글입력컨트롤러왔나요?");

			int goods_re_no = Integer.parseInt(request.getParameter("greno"));
			String goods_re_content = request.getParameter("goods_re_content");
			// 관리자 닉네임이나 아이디 뭐 받아올 때 쓰려고.....흠 확실x
			String member_nick = "";
			String member_id = "";

			if ((MemberDto) session.getAttribute("rdto") != null) {
				MemberDto admin = (MemberDto) session.getAttribute("rdto");
				member_nick = admin.getMember_nick();
				member_id = admin.getMember_id();
			} else {
				jsResponse("로그인 해주세요", "/view/user/login.jsp", response);

			}

			System.out.println("goodsadminre : " + member_nick + goods_re_content);

			// int res = biz.rereplyinsert(new AnserDto(1,goods_no, member_id,
			// goods_re_content,null,goods_re_groupno, goods_re_seq, goods_re_titletab));
			AnswerDto dto = new AnswerDto(goods_re_no, 0, member_id, goods_re_content, null, 0, 0, 0, member_nick,"N");
			int res = biz.answerProc(dto);
			System.out.println("goodsadminre int res 지났고 if 전");
			if (res > 0) {
				System.out.println("관리자님이 문의하신 댓글에 답변을 등록하였습니다.");
				dispatch("/view/goods/goods_detail.jsp", request, response);
			} else {
				jsResponse("관리자 답변 실패함 싸발.", "goods_answer.jsp", response);
			}
		}

		// 굿즈업데이트
		else if (command.equals("goodsupdateres")) {
			System.out.println("굿즈업데이트res왔다");
			int goods_no = Integer.parseInt(request.getParameter("goods_no"));

			MemberDto admin = (MemberDto) session.getAttribute("rdto");
			String member_id = admin.getMember_id();

			String goods_title = request.getParameter("goods_title");
			int goods_quantity = Integer.parseInt(request.getParameter("goods_quantity"));
			int goods_price = Integer.parseInt(request.getParameter("goods_price"));
			String goods_main_photo = request.getParameter("goods_main_photo");
			String goods_content = request.getParameter("goods_content");

			System.out.println("굿즈 업뎃 res 값 가져오나 ? : " + goods_no + member_id + goods_title + goods_quantity
					+ goods_price + goods_main_photo + goods_content);

			GoodsDto dto = new GoodsDto(goods_no, member_id, goods_title, goods_price, goods_quantity, goods_content,
					null, goods_main_photo);
			int res = biz.update(dto);
			if (res > 0) {
				System.out.println("굿즈수정성공");
				jsResponse("상품을 성공적으로 등록하였습니다.", "goods.do?command=goodslist", response);
			} else {
				jsResponse("상품을 등록하는데 실패하였습니다.", "goods.do?command=goodslist", response);

			}

		} else if (command.equals("goodsupdate")) {
			System.out.println("굿즈업데이트왔다");
			int goods_no = Integer.parseInt(request.getParameter("goods_no"));
			System.out.println("goods_no :" + goods_no);
			GoodsDto dto = biz.selectOne(goods_no);
			request.setAttribute("dto", dto);
			dispatch("/view/goods/goods_update.jsp", request, response);
		}
		// 굿즈하나삭제
		else if (command.equals("goodsdelete")) {
			System.out.println("굿즈딜리트컨트롤러왔음");
			int goods_no = Integer.parseInt(request.getParameter("goods_no"));

			int res = biz.delete(goods_no);
			if (res > 0) {
				System.out.println("굿즈삭제성공!");
				jsResponse("상품을 성공적으로 삭제하였습니다.", "goods.do?command=goodslist", response);
			} else {
				System.out.println("굿즈삭제싸발적으로실패");
				jsResponse("상품을 삭제하는데 실패하였습니다.", "goods.do?command=goodslist", response);
			}
			// 굿즈 여러개 삭제
		} else if (command.contentEquals("goodsmuldel")) {
			System.out.println("controller_goods_muldel");
			String[] goods_no = request.getParameterValues("chk");
			System.out.println(goods_no + "굿즈 번호 오냐? 오냐고 와라!!!!");
			CartDao dao = new CartDao();
			// CarDAO 선언
			int result = dao.CartmultiDelete(goods_no);
			// result: CartmuliDelete인데 용도는 굿즈 목록에서 삭제되면 장바구니에 담긴 상품도 같이 삭제
			int res = biz.multiDelete(goods_no);
			// res: 굿즈목록의 상품번호들을 받아옴
			int sum = result + res;
			// sum: result와 res가 삭제한 row의 갯수들을 더함
			if (sum >= 2) {
				// 서로더한 값이 최소치인 2보다 같거나 크면 작동
				System.out.println("goods 멀티 딜리트 성공");
				jsResponse("선택하신 상품을 성공적으로 삭제하였습니다.", "goods.do?command=goodslist", response);
			} else {
				System.out.println("goods 멀티 딜리트 실패");
				jsResponse("선택하신 상품을 삭제하는데 실패하였습니다.", "goods.do?command=goodslist", response);
			}
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