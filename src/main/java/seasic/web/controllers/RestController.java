package seasic.web.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import senasic.web.dao.RestBoardDAO;
import senasic.web.dto.RestBoardDTO;


@WebServlet("*.rest")
public class RestController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");	
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length()+1);
		RestBoardDAO dao = RestBoardDAO.getInstance();
		System.out.println(cmd);
		try {
			if(cmd.equals("load.rest")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				RestBoardDTO result = dao.detailPage(seq);				
				System.out.println(result.getTitle());
				request.setAttribute("dto", result);
				request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.getStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
