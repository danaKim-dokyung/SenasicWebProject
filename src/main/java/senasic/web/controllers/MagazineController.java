package senasic.web.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import senasic.web.DAO.MypageDAO;
import senasic.web.DTO.RestBoardDTO;

@WebServlet("*.mag")
public class MagazineController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		MypageDAO my_dao = MypageDAO.getInstance();

		try {

			if(cmd.equals("/magagine.mag")) {
				
				int magagine_num = Integer.parseInt(request.getParameter("check_num"));
				
				List<Integer> seq_list = new ArrayList();
				
				
				if(magagine_num == 1) {
					seq_list.add(33);
					seq_list.add(47);
					seq_list.add(32);
					seq_list.add(31);
					seq_list.add(29);
					seq_list.add(28);
					seq_list.add(27);
					seq_list.add(24);
					seq_list.add(21);
					seq_list.add(16);
				}else if(magagine_num == 2) {
					seq_list.add(39);
					seq_list.add(3);
					seq_list.add(26);
					seq_list.add(25);
					seq_list.add(1);
					seq_list.add(7);
					seq_list.add(10);
					seq_list.add(15);
					seq_list.add(19);
					seq_list.add(48);
				}else if(magagine_num == 3) {
					seq_list.add(12);
					seq_list.add(8);
					seq_list.add(51);
					seq_list.add(57);
					seq_list.add(3);
					seq_list.add(31);
					seq_list.add(46);
					seq_list.add(11);
					seq_list.add(10);
					seq_list.add(17);
				}
				else if(magagine_num == 5) {
					seq_list.add(9);
					seq_list.add(30);
					seq_list.add(12);
					seq_list.add(58);
					seq_list.add(53);
					seq_list.add(20);
					seq_list.add(52);
					seq_list.add(7);
					seq_list.add(40);
					seq_list.add(19);
				}else {
					seq_list.add(21);
					seq_list.add(22);
					seq_list.add(23);
					seq_list.add(16);
					seq_list.add(39);
					seq_list.add(40);
					seq_list.add(41);
					seq_list.add(42);
					seq_list.add(43);
					seq_list.add(44);
				}
				
				int[] seq_arr = seq_list.stream().mapToInt(i->i).toArray();
				
				List<RestBoardDTO> list = my_dao.getRestInformation(seq_arr);

				request.setAttribute("magagine_num", magagine_num);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/magazine/magazineDetail.jsp").forward(request, response);

			}else if(cmd.equals("/magagineList.mag")) {
				
				response.sendRedirect("/magazine/magazineList.jsp");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
