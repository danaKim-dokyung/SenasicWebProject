package senasic.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
        	String savePath = "C:\\"; //경로 문제
			File filePath = new File(savePath);
			if(!filePath.exists()) {filePath.mkdir();}				
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

			multi.getParameter(savePath);
            	        	
			//String root = "\Restaurant\RestImg\";

	                String oriName1 = multi.getOriginalFileName("Pimage");
	                String sysName1 = multi.getFilesystemName("Pimage");
			
				
        		String id= multi.getParameter("id");
        		String pw = passwordUtils.getSHA512(multi.getParameter("pw"));
        		String nn = multi.getParameter("nn");
        		String m = multi.getParameter("m");
        		String p1 = multi.getParameter("phone1");
        		String p2 = multi.getParameter("phone2");
        		String p3 = multi.getParameter("phone3");
        		int age = Integer.parseInt(multi.getParameter("age"));
        		String gender = multi.getParameter("gender");      		
        		String img = multi.getFilesystemName("img");
      	
        		String ph = (p1+p2+p3);
        		
        		System.out.println("수정 예정");
    			dao.insert(new MemberDTO(id,pw,nn,m,ph,age,gender,0,sysName1));
    			response.sendRedirect("/index.jsp");
    			
    			
        	    }else if(cmd.equals("/member/login.mem")){
        	    	String id = request.getParameter("id");
        	    	String nn = request.getParameter("nn");
        	    	String password = passwordUtils.getSHA512(request.getParameter("password"));
        	    	boolean result = dao.isLoginAllowed(id, password);
        	    	        	    	
        	    	if(result) {
        	    		int seqID = dao.selectById(id).getSeq();
        	    		HttpSession session = request.getSession();
        	    		session.setAttribute("loginID", id);  
        	    		session.setAttribute("seqID", seqID);
        	    		response.sendRedirect("/index.jsp");
        	    		// session.setAttribute("loginNN", nn); 媛뺤궗�떂猿� 吏덈Ц 2             	  
        	    	}else {
        	    		
        	    		response.sendRedirect("/member/signin.jsp");
        	    	}
        	    	
        	    }else if(cmd.equals("/logout.mem")){
        	    	request.getSession().removeAttribute("loginID");
        	    	request.getSession().removeAttribute("seqID");
        	    	response.sendRedirect("/index.jsp");
        	    }else if(cmd.equals("/findId.mem")) {
        	    	response.sendRedirect("/member/findId.jsp");
        	    }else if(cmd.equals("/findPw.mem")) {
        	    	response.sendRedirect("/member/findPw.jsp");
        	    }else if(cmd.equals("/resultId.mem")) {
        	    	String m = request.getParameter("m");
        	    	String phone1 = request.getParameter("phone1");
        	    	String phone2 = request.getParameter("phone2");
        	    	String phone3 = request.getParameter("phone3");
        	    	String ph = phone1 + phone2 + phone3; 
        	    	

        	    	MemberDTO findId = dao.selectByMail(m, ph);
        	    	request.setAttribute("id", findId.getId());
        	    	System.out.println(findId.getId());

        	    	if(findId.getId() != null) {
            	    	request.getRequestDispatcher("/member/yourId.jsp").forward(request, response);
        	    	}else if(findId.getId()==null){
        	    		response.sendRedirect("/member/None.jsp");
        	    	}
        	    }else if(cmd.equals("/resultPw.mem")){
        	    	String id = request.getParameter("id");
        	    	String m = request.getParameter("m");

        	    	MemberDTO findPw = dao.selectByFindPw(id, m);
        	    	request.setAttribute("pw", findPw.getPw());
        	    	System.out.println(findPw.getPw());
        	    	if(findPw.getPw() != null) {
            	    	request.getRequestDispatcher("/WEB-INF/yourPw.jsp").forward(request, response);
        	    	}else {
        	    		response.sendRedirect("/member/None.jsp");
        	    	}
        	    }else if(cmd.equals("/changPw.mem")){
        	    	String pw = passwordUtils.getSHA512(request.getParameter("pw"));
        	    	String id = request.getParameter("id");
        	    	
        	    	int result = dao.changePw(id, pw);
        	    	System.out.println(result);
        	    	if(result==1) {
        	    		response.sendRedirect("/member/signin.jsp");
        	    	}else {
        	    		response.sendRedirect("/WEB-INF/yourPw.jsp");
        	    	}
        	    	
        	    	
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
