package senasic.web.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import senasic.web.DAO.MemberDAO;
import senasic.web.DTO.MemberDTO;
import utils.passwordUtils;

@WebServlet("*.board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		
		
        try {
        	
        	
    		if(cmd.equals("/list.board")) {
    			response.sendRedirect("/board/boardList.jsp");
    		}
    		
        }catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
