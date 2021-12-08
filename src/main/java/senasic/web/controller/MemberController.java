package senasic.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import senasic.web.DAO.MemberDAO;
import senasic.web.DTO.MemberDTO;


@WebServlet("*.mem") 
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
        MemberDAO dao = MemberDAO.getInstance();

	
        try {
        	
        	
    		if(cmd.equals("/signin.mem")) {
    			response.sendRedirect("/member/signin.jsp");
    		}else if(cmd.equals("/signup.mem")){ 
                response.sendRedirect("/member/signup.jsp");

            }else if(cmd.equals("/idCheck.mem")) { // 아이디 중복 체크 기능 
                String id = request.getParameter("id");
                try {
                    boolean result = dao.isIdExist(id);
                    response.getWriter().append(String.valueOf(result));

                }catch(Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
            }else if(cmd.equals("/signupProc.mem")) {
            	        		
        		String id= request.getParameter("id");
        		String pw = request.getParameter("pw");
        		String nn = request.getParameter("nn");
        		String m = request.getParameter("m");
        		String p1 = request.getParameter("phone1");
        		String p2 = request.getParameter("phone2");
        		String p3 = request.getParameter("phone3");
        		String age = request.getParameter("age");
        		String gender = request.getParameter("gender");

        		int ph = Integer.parseInt(p1+p2+p3);
        		
        		System.out.println(id);
    			dao.insert(new MemberDTO(id,pw,nn,m,ph,age,gender));
    			response.sendRedirect("/index.jsp");
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
