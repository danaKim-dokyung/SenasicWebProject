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
				
//				int magagine_num = Integer.parseInt(request.getParameter("magagine_num"));
				
				
				
//				List<Integer> seq_list = new ArrayList();
//				int[] seq_arr = new int[10];
//				seq_list.add(21);
//				if(magagine_num == 1) {
					int[] arr = { 21, 22, 23, 16, 39, 40, 41, 42, 43, 44 };
					
//				}
				
//				int[] seq_arr = seq_list.stream().mapToInt(i->i).toArray();
				
//				System.out.println(seq_arr.toString());
					
				List<RestBoardDTO> list = my_dao.getRestInformation(arr);

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
