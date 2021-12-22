package senasic.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import senasic.web.DAO.PetBoardDAO;
import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.PetBoard_RelpyDTO;
import senasic.web.DTO.petBoard_recDTO;
import statics.Statics;

@WebServlet("*.pet")
public class PetBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		String url = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = url.substring(ctxPath.length());
		Gson g = new Gson();

		System.out.println(cmd);

		PetBoardDAO dao = PetBoardDAO.getInstance();

		try {

			// 게시판 리스트 출력
			if (cmd.equals("/list.pet")) {
				List<PetBoardDTO> list;

				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));

				int pageTotalCount;

				int check_category = 1;

				pageTotalCount = dao.getPageTotalCount();

				if (currentPage < 1) {
					currentPage = 1;
				}
				if (currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

				list = dao.selectByBound(start, end);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("check_num", check_num);
				request.setAttribute("check_category", check_category);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("board/boardList.jsp").forward(request, response);

				// 카테고리
			} else if (cmd.equals("/category.pet")) {

				List<PetBoardDTO> list;

				int check_num = Integer.parseInt(request.getParameter("check_num"));
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");

				if (category.equals("hospital")) {
					category = "병원";
				} else if (category.equals("walk")) {
					category = "산책로";
				} else if (category.equals("food")) {
					category = "음식";
				} else if (category.equals("etc")) {
					category = "기타";
				}

				System.out.println(category);

				int check_category = 0;

				int pageTotalCount = dao.getPageTotalCountByCategory(category);

				if (currentPage < 1) {
					currentPage = 1;
				}
				if (currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

				list = dao.selectByCategory(category, start, end);
				String navi = dao.getPageNaviByCategory(currentPage, category);

				request.setAttribute("check_num", check_num);
				request.setAttribute("check_category", check_category);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("board/boardList.jsp").forward(request, response);

				// 게시판 글쓰기로 이동
			} else if (cmd.equals("/write.pet")) {
				int check_num = Integer.parseInt(request.getParameter("check_num"));

				request.setAttribute("check_num", check_num);
				request.getRequestDispatcher("board/boardWrite.jsp").forward(request, response);

				// 게시판 글 작성 완료
			} else if (cmd.equals("/input.pet")) {
				String longinID = (String) request.getSession().getAttribute("loginID");
				String category = request.getParameter("category");
				String writer = (String) request.getSession().getAttribute("loginID");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				int check_num = Integer.parseInt(request.getParameter("check_num"));

				System.out.println(category);
				System.out.println(writer);
				System.out.println(title);
				System.out.println(contents);

				int result = dao.insert(longinID, category, writer, title, contents);

				System.out.println(result);

				request.setAttribute("category", category);
				request.setAttribute("check_num", check_num);
				request.setAttribute("result", result);
				request.getRequestDispatcher("board/boardWrite.jsp").forward(request, response);

				// 게시판 상세보기
			} else if (cmd.equals("/detail.pet")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String longinID = (String) request.getSession().getAttribute("loginID");
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				int check_category = Integer.parseInt(request.getParameter("check_category"));

				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");

				System.out.println(check_num);

				int recCheck = dao.recCheck(seq, longinID); // 추천 여부
				int user = 0;
				if (recCheck == 1) {
					user = 0;
				} else if (recCheck == 0) {
					user = 1;
				}

				List<PetBoardDTO> list = dao.information(seq);
				List<PetBoard_RelpyDTO> replyList = dao.selectAllReply(seq);
				int CountComment = dao.getCountComment(seq);

				int result = dao.addViewCount(seq);

				request.setAttribute("keyword", keyword);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("check_num", check_num);
				request.setAttribute("check_category", check_category);
				request.setAttribute("CountComment", CountComment);
				request.setAttribute("cpage", cpage);
				request.setAttribute("list", list);
				request.setAttribute("replyList", replyList);
				request.setAttribute("user", user);
				request.getRequestDispatcher("board/boardDetail.jsp").forward(request, response);

				// 댓글 달기
			} else if (cmd.equals("/comment.pet")) {

				String writer = (String) request.getSession().getAttribute("loginID");
				String comment = request.getParameter("comment");
				int board_seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int check_category = Integer.parseInt(request.getParameter("check_category"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");

				System.out.println(check_category);

				int reply = dao.insertReply(board_seq, writer, comment);
				dao.updateComment(board_seq);

				response.sendRedirect(
						"/detail.pet?seq=" + board_seq + "&cpage=" + cpage + "&check_category=" + check_category
								+ "&check_num=" + check_num + "&keyword=" + keyword + "&searchWord=" + searchWord);

				// 댓글 삭제 기능
			} else if (cmd.equals("/deleteComment.pet")) {

				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int check_category = Integer.parseInt(request.getParameter("check_category"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");

				int deleteComment = dao.deleteComment(seq);
				dao.updateComment(board_seq);

				response.sendRedirect(
						"/detail.pet?seq=" + board_seq + "&cpage=" + cpage + "&check_category=" + check_category
								+ "&check_num=" + check_num + "&keyword=" + keyword + "&searchWord=" + searchWord);

				// 게시판 삭제기능
			} else if (cmd.equals("/delete.pet")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");

				if (category.equals("병원")) {
					category = "hospital";
				} else if (category.equals("산책로")) {
					category = "walk";
				} else if (category.equals("음식")) {
					category = "food";
				} else if (category.equals("기타")) {
					category = "etc";
				}

				System.out.println(category);

				int result = dao.delete(seq);

				if (check_num == 1) {
					response.sendRedirect("/pet_board.my?cpage=1");
				} else if (check_num == 2) {
					response.sendRedirect("/list.pet?cpage=1&check_num=" + check_num);
				} else if (check_num == 3) {
					response.sendRedirect(
							"/category.pet?cpage=" + cpage + "&category=" + category + "&check_num=" + check_num);
				}

				// 게시판 수정창으로 이동
			} else if (cmd.equals("/modify.pet")) {

				int seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int check_category = Integer.parseInt(request.getParameter("check_category"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");

				List<PetBoardDTO> list = dao.information(seq);

				request.setAttribute("keyword", keyword);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("check_num", check_num);
				request.setAttribute("check_category", check_category);
				request.setAttribute("list", list);
				request.setAttribute("cpage", cpage);
				request.getRequestDispatcher("board/modify_boardWrite.jsp").forward(request, response);

				// 게시판 수정하기
			} else if (cmd.equals("/modify_board.pet")) {
				String category = request.getParameter("category");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				int seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String longinID = (String) request.getSession().getAttribute("loginID");
				int check_category = Integer.parseInt(request.getParameter("check_category"));
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");

				System.out.println(category);
				System.out.println(title);
				System.out.println(contents);
				System.out.println(seq);
				System.out.println(cpage);
				System.out.println(longinID);

				int result = dao.Modify(category, title, contents, seq);

				int recCheck = dao.recCheck(seq, longinID); // 추천 여부
				int user = 0;
				if (recCheck == 1) {
					user = 0;
				} else if (recCheck == 0) {
					user = 1;
				}

				List<PetBoardDTO> list = dao.information(seq);
				List<PetBoard_RelpyDTO> replyList = dao.selectAllReply(seq);
				int CountComment = dao.getCountComment(seq);

				dao.addViewCount(seq);
				
				request.setAttribute("keyword", keyword);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("check_num", check_num);
				request.setAttribute("check_category", check_category);
				request.setAttribute("CountComment", CountComment);
				request.setAttribute("cpage", cpage);
				request.setAttribute("list", list);
				request.setAttribute("replyList", replyList);
				request.setAttribute("user", user);
				request.setAttribute("result", result);
				request.getRequestDispatcher("board/boardDetail.jsp").forward(request, response);

				// 게시판 검색기능
			} else if (cmd.equals("/search.pet")) {

				String keyword = request.getParameter("keyword");
				String searchWord = request.getParameter("searchWord");
				int check_num = Integer.parseInt(request.getParameter("check_num"));
				int check_category = Integer.parseInt(request.getParameter("check_category"));
				check_num = 4;

				if (keyword.equals("title")) {
					keyword = "제목";
				} else if (keyword.equals("title")) {
					keyword = "작성자";
				}

				if (keyword.equals("제목")) {
					keyword = "title";
				} else if (keyword.equals("작성자")) {
					keyword = "writer";
				}

				List<PetBoardDTO> list;
				int currentPage = Integer.parseInt(request.getParameter("cpage"));

				int pageTotalCount;

				pageTotalCount = dao.getPageTotalCountBySearch(keyword, searchWord);

				if (currentPage < 1) {
					currentPage = 1;
				}
				if (currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;

				list = dao.search(keyword, searchWord, start, end);
				String navi = dao.getPageNaviBySearch(pageTotalCount, keyword, searchWord);

				request.setAttribute("keyword", keyword);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("check_category", check_category);
				request.setAttribute("check_num", check_num);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("board/boardList.jsp").forward(request, response);

				// 추천 기능
			} else if (cmd.equals("/likes.pet")) {

				int rec_seq = Integer.parseInt(request.getParameter("seq"));
				String rec_id = (String) request.getSession().getAttribute("loginID");
				int result = dao.recCheck(rec_seq, rec_id);
				int user = 0;
				if (result == 1) {
					dao.recDelete(rec_seq, rec_id);
					user = 0;
				} else if (result == 0) {
					dao.recInsert(new petBoard_recDTO(rec_seq, rec_id));
					user = 1;
				}

				int a = dao.recUpdate(rec_seq);
				int num = dao.getRecNum(rec_seq);

				int[] arr = new int[2];
				arr[0] = num; // 추천수
				arr[1] = user; // 추천 유무

				String answer = g.toJson(arr);
				response.getWriter().append(answer);

			} else if (cmd.equals("/imageUpload.pet")) {
				int maxSize = 1024 * 1024 * 10;
//				String savePath = request.getServletContext().getRealPath("files");
				String savePath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
//				String savePath = "C:\\Users\\my\\Desktop\\2021_09_Java\\workspace_semi_project\\senasic6\\src\\main\\webapp\\board\\img";
				File filePath = new File(savePath);

				if (!filePath.exists()) {
					filePath.mkdir();
				}

				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8",
						new DefaultFileRenamePolicy());

				String sysName = multi.getFilesystemName("file");
				String oriName = multi.getOriginalFileName("file");

				System.out.println(sysName);
				System.out.println(oriName);
				response.getWriter().append(sysName);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}