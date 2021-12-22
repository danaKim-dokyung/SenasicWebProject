package senasic.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import senasic.web.DAO.MemberDAO;
import senasic.web.DAO.MypageDAO;
import senasic.web.DAO.PetBoardDAO;
import senasic.web.DTO.MrDTO;
import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.RestBoardDTO;
import statics.Statics;

@WebServlet("*.my")
public class MypageController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String cmd = requestURI.substring(ctxPath.length());
		
		
		MemberDAO dao = MemberDAO.getInstance();
		PetBoardDAO pet_dao = PetBoardDAO.getInstance();
		MypageDAO my_dao = MypageDAO.getInstance();
		
		System.out.println(cmd);

		try {
			if (cmd.equals("/pet_board.my")) {
				
				
				List<PetBoardDTO> list;
				
				String loginID = (String) request.getSession().getAttribute("loginID");

				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int pageTotalCount;
				
				int check_category = 1;
				
				pageTotalCount = my_dao.getPageTotalCountByLoginID(loginID);

				if (currentPage < 1) {
					currentPage = 1;
				}
				if (currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
				

				list = my_dao.selectByLoginID(loginID,start,end);
				String navi = my_dao.getPageNaviByLoginID(currentPage, loginID);
				
				
				request.setAttribute("check_category", check_category);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/mypage/my_pet_board.jsp").forward(request, response);
				
				
				
			// 내가쓴 리뷰 모아보기
			} else if (cmd.equals("/my_review.my")) {
				
				String loginID = (String) request.getSession().getAttribute("loginID");
				
				List<MrDTO> list; 
				
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int pageTotalCount;
				
				pageTotalCount = my_dao.getReviewTotalCountByLoginID(loginID);

				if (currentPage < 1) {
					currentPage = 1;
				}
				if (currentPage > pageTotalCount) {
					currentPage = pageTotalCount;
				}

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
				

				list = my_dao.reviewByLoginID(loginID, start, end);
				String navi = my_dao.getReviewNaviByLoginID(currentPage, loginID);
				
				System.out.println(list.size());
				
				
				request.setAttribute("cpage", currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/mypage/my_review.jsp").forward(request, response);
				
			}else if(cmd.equals("/delete.my")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				
				
				int result = my_dao.deleteReview(seq);
				
				
				request.setAttribute("cpage", cpage);
				request.setAttribute("seq", seq);
				request.setAttribute("result", result);
				request.getRequestDispatcher("/mypage/my_review.jsp").forward(request, response);
			
				
				
			}else if(cmd.equals("/delete_board.my")){

                int seq = Integer.parseInt(request.getParameter("seq"));
                int cpage = Integer.parseInt(request.getParameter("cpage"));

                System.out.println(seq);
                System.out.println(cpage);

                int result = my_dao.delete_board(seq);

                request.setAttribute("cpage", cpage);
                request.setAttribute("result", result);
                request.getRequestDispatcher("/mypage/my_pet_board.jsp").forward(request, response);
                
                
                //회원 탈퇴
            }else if(cmd.equals("/delete_member.my")){

                int seq = Integer.parseInt(request.getParameter("seq"));

                int result = dao.deleteMember(seq);

                request.getSession().removeAttribute("loginID");
                request.getSession().removeAttribute("seqID");
                request.setAttribute("delete_result", result);
                request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);
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
