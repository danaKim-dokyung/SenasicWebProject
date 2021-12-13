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

            }else if(cmd.equals("/idCheck.mem")) { // �븘�씠�뵒 以묐났 泥댄겕 湲곕뒫 
                String id = request.getParameter("id");
                try {
                    boolean result = dao.isIdExist(id);
                    response.getWriter().append(String.valueOf(result));

                }catch(Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
            }else if(cmd.equals("/nicknameCheck.mem")){ // �땳�꽕�엫 以묐났 泥댄겕 湲곕뒫
            	String nickname = request.getParameter("nn");
                System.out.println(nickname);

                try {
                    boolean result = dao.isNicknameExist(nickname);
                    response.getWriter().append(String.valueOf(result));
                    

                }catch(Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
        }else if(cmd.equals("/signupProc.mem")) {
            	        		
        		String id= request.getParameter("id");
        		String pw = passwordUtils.getSHA512(request.getParameter("pw"));
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
        	    }else if(cmd.equals("/member/login.mem")){
        	    	String id = request.getParameter("id");
        	    	String nn = request.getParameter("nn");
        	    	String password = passwordUtils.getSHA512(request.getParameter("password"));
        	    	boolean result = dao.isLoginAllowed(id, password);
        	    	        	    	
        	    	if(result) {
        	    		System.out.println("s");
        	    		HttpSession session = request.getSession();
        	    		session.setAttribute("loginID", id);  
        	    		// session.setAttribute("loginNN", nn); 媛뺤궗�떂猿� 吏덈Ц 2             	  
        	    	}
        	    	response.sendRedirect("/index.jsp");
        	    }else if(cmd.equals("/logout.mem")){
        	    	request.getSession().removeAttribute("loginID");
        	    	response.sendRedirect("/index.jsp");
        	    }else if(cmd.equals("/mypage.mem")){
        	    	
        	    	
//        	    	String id = request.getParameter("id");
//        	    	String pw = request.getParameter("pw");
//        	    	String nn = request.getParameter("nn");
//        	    	String m = request.getParameter("m");
        	    	String loginID = (String) request.getSession().getAttribute("loginID");
            		String age = request.getParameter("age");
            		String gender = request.getParameter("gender");
        	    	
            		String id = dao.selectById(loginID).getId();
            		String pw = dao.selectById(loginID).getPw();
            		
            		System.out.println(dao.selectById(loginID).getId());
            		
        	    	response.sendRedirect("/mypage/mypage.jsp");
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
