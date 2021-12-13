package senasic.web.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
        	int maxSize = 1024*1024*10;
        	String savePath = "C:\\Users\\BOSS\\Pictures";
			File filePath = new File(savePath);
			if(!filePath.exists()) {filePath.mkdir();}				
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

			multi.getParameter(savePath);
            	        		
				
        		String id= multi.getParameter("id");
        		String pw = passwordUtils.getSHA512(multi.getParameter("pw"));
        		String nn = multi.getParameter("nn");
        		String m = multi.getParameter("m");
        		String p1 = multi.getParameter("phone1");
        		String p2 = multi.getParameter("phone2");
        		String p3 = multi.getParameter("phone3");
        		int age = Integer.parseInt(request.getParameter("age"));
        		String gender = multi.getParameter("gender");
          String img = "1";

        		int ph = Integer.parseInt(p1+p2+p3);

        		
        		
        		String ph = (p1+p2+p3);
        		
        		System.out.println("수정 예정");
    			dao.insert(new MemberDTO(id,pw,nn,m,ph,age,gender,0,img));
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
