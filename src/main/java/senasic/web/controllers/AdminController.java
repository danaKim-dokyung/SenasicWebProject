package senasic.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import senasic.web.DAO.AdminDAO;
import senasic.web.DAO.PetBoardDAO;
import senasic.web.DAO.RestBoardDAO;
import senasic.web.DTO.MemberDTO;
import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.RestBoardDTO;
import senasic.web.DTO.dashboardDTO;
import statics.Statics;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length()+1);
		AdminDAO dao = AdminDAO.getInstance();
		RestBoardDAO rbdao = RestBoardDAO.getInstance();
		PetBoardDAO pdao = PetBoardDAO.getInstance();
		try {
			if(cmd.equals("rbUpload.admin")) { //식당게시판 글 업로드
				int maxSize = 1024*1024*10; //10m
				//savepath 경로 변경
				String savePath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
//				String savePath = request.getServletContext().getRealPath("files");

				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}
				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				multi.getParameter(savePath);

				String oriName1 = multi.getOriginalFileName("photo[0]");
				String sysName1 = multi.getFilesystemName("photo[0]");
				String oriName2 = multi.getOriginalFileName("photo[1]");
				String sysName2 = multi.getFilesystemName("photo[1]");
				String oriName3 = multi.getOriginalFileName("photo[2]");
				String sysName3 = multi.getFilesystemName("photo[2]");

				String title = multi.getParameter("title");
				String ctg = multi.getParameter("category");
				String loc = multi.getParameter("location");
				String loc_detail = multi.getParameter("location_detail");
				String phone = multi.getParameter("phone");
				String hour = multi.getParameter("hour");
				String garage = multi.getParameter("garage");
				String link = multi.getParameter("link");
				String m1 = multi.getParameter("menu1");
				int p1 = Integer.parseInt(multi.getParameter("price1"));
				String m2 = multi.getParameter("menu2");
				int p2 = Integer.parseInt(multi.getParameter("price2"));
				String m3 = multi.getParameter("menu3");
				int p3 = Integer.parseInt(multi.getParameter("price3"));
				String root = "/upload/";
				int result = dao.writeRest(title, loc, loc_detail, ctg, hour, garage, phone, root+sysName1, root+sysName2, root+sysName3, link);
				int menu = dao.insertMenu(title, m1, p1, m2, p2, m3, p3);
				response.sendRedirect("/admin/restBoardWrite.jsp");
				
			}else if(cmd.equals("rbEdit.admin")){ //식당게시판 글목록
				int currentPage=1;
				if(request.getParameter("cpage")!=null) {currentPage = Integer.parseInt(request.getParameter("cpage"));}
	            String search = request.getParameter("search");

	             if(search == null){
		             int pageTotalCount = dao.getPageTotalCount();
		             if(currentPage <1) {currentPage = 1;}
		             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
		             
			            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
			            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
						List<RestBoardDTO> list = rbdao.selectByList(start, end);
						List<Integer> navi = dao.getPageNavi(currentPage);
					int Fnum = 0;
		             int NavCheck = navi.size();
		             if(NavCheck==12){
		            	 Fnum = navi.get(10);
		             }else if(NavCheck>9) {
			             Fnum = navi.get(9);	            	 
		             }
		             int Snum = 0;
		             if(NavCheck>1) {
			             Snum = navi.get(1);		            	 
		             }

				            
		             request.setAttribute("list", list);
		             request.setAttribute("navi", navi);
					 request.setAttribute("Fnum", Fnum);
					 request.setAttribute("Snum", Snum);
            }else  if(search!=null){
			 int pageTotalCount = dao.getPageTotalCount(search);
            if(currentPage <1) {currentPage = 1;}
            if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

	            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
	            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
				List<RestBoardDTO> list = rbdao.selectBySearch(search,start, end);
				List<Integer> navi = dao.getPageNaviSearch(currentPage, search);

            int Fnum = 0;
            int NavCheck = navi.size();
            if(NavCheck==12){
           	 Fnum = navi.get(10);
            }else if(NavCheck>9) {
	             Fnum = navi.get(9);	            	 
            }
            int Snum = 0;
            if(NavCheck>2) {
	             Snum = navi.get(1);		            	 
            }
            
            request.setAttribute("list", list);
            request.setAttribute("navi", navi);
			 request.setAttribute("Fnum", Fnum);
			 request.setAttribute("Snum", Snum);
           request.setAttribute("search", search);			    
            }
	             String seqID = request.getSession().getAttribute("seqID").toString();
	             request.setAttribute("seqID", seqID);
	             request.setAttribute("cpage", currentPage);
	             request.getRequestDispatcher("/admin/restBoardEdit.jsp").forward(request, response);
	             
			}else if(cmd.equals("rbWrite.admin")) { //식당게시판 글쓰기 접근,전체 접근권한 예정
				//수정에정
	             String seqID = request.getSession().getAttribute("seqID").toString();
	             request.setAttribute("seqID", seqID);
				request.getRequestDispatcher("/admin/restBoardWrite.jsp").forward(request, response);
				
			}else if(cmd.equals("rbDetail.admin")){ //식당게시판 상세정보 수정접근
				int num = Integer.parseInt(request.getParameter("num"));
				RestBoardDTO dto = dao.getRestBoardInfo(num);
				MenuDTO Mdto = dao.getMenuInfo(dto.getTitle());
				request.setAttribute("dto", dto);
				request.setAttribute("Mdto", Mdto);
				request.getRequestDispatcher("/admin/restBoardEditDetail.jsp").forward(request, response);
				
			}else if(cmd.equals("rbModify.admin")) { //식당게시판 정보 수정
				
				int maxSize = 1024*1024*10; //10m
				//savepath 경로 변경
				String savePath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
//				String savePath = request.getServletContext().getRealPath("files");

				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}
				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
				RestBoardDTO real = dao.getRestBoardInfo(Integer.parseInt(multi.getParameter("seq")));
				
				multi.getParameter(savePath);
				String root = "/upload/";

				String oriName1 = multi.getOriginalFileName("photo[0]");
				String sysName1 = multi.getFilesystemName("photo[0]");
				if(sysName1 ==null) {
					sysName1=real.getPhoto1().substring(root.length());
				}
				String oriName2 = multi.getOriginalFileName("photo[1]");
				String sysName2 = multi.getFilesystemName("photo[1]");
				if(sysName2 == null) {
					sysName2=real.getPhoto2().substring(root.length());
				}
				String oriName3 = multi.getOriginalFileName("photo[2]");
				String sysName3 = multi.getFilesystemName("photo[2]");
				if(sysName3 ==null) {
					sysName3=real.getPhoto3().substring(root.length());
				}
				String title = multi.getParameter("title");
				String ctg = multi.getParameter("category");
				String loc = multi.getParameter("location");
				String loc_detail = multi.getParameter("location_detail");
				String phone = multi.getParameter("phone");
				String hour = multi.getParameter("hour");
				String garage = multi.getParameter("garage");
				String link = multi.getParameter("link");
				String m1 = multi.getParameter("menu1");
				int p1 = Integer.parseInt(multi.getParameter("price1"));
				String m2 = multi.getParameter("menu2");
				int p2 = Integer.parseInt(multi.getParameter("price2"));
				String m3 = multi.getParameter("menu3");
				int p3 = Integer.parseInt(multi.getParameter("price3"));
				int result = dao.updateRest(title, loc, loc_detail, ctg, hour, garage, phone, root+sysName1, root+sysName2, root+sysName3, link, real.getSeq());
				int menu = dao.updateMenu(title, m1, p1, m2, p2, m3, p3, real.getTitle());
				request.getRequestDispatcher("/rbDetail.admin?num="+real.getSeq()).forward(request, response);
				
			}else if(cmd.equals("rbDelete.admin")){
				int seq = Integer.parseInt(request.getParameter("num"));
				RestBoardDTO real = dao.getRestBoardInfo(seq);
				int result = dao.deleteRest(seq);
				int menu = dao.deleteMenu(real.getTitle());
				response.sendRedirect("/rbEdit.admin");
				
			}else if(cmd.equals("member.admin")) {
				int currentPage=1;
				if(request.getParameter("cpage")!=null) {currentPage = Integer.parseInt(request.getParameter("cpage"));}
	            String search = request.getParameter("search");

	             if(search == null){
		             int pageTotalCount = dao.getMemberCount();
		             
		             if(currentPage <1) {currentPage = 1;}
		             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
		             
			            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
			            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
						List<MemberDTO> list = dao.listMember(start, end);
						List<Integer> navi = dao.getMemberNavi(currentPage);
					int Fnum = 0;
		             int NavCheck = navi.size();
		             if(NavCheck==12){
		            	 Fnum = navi.get(10);
		             }else if(NavCheck>9) {
			             Fnum = navi.get(9);	            	 
		             }
		             int Snum = 0;
		             if(NavCheck>1) {
			             Snum = navi.get(1);		            	 
		             }

				            
		             request.setAttribute("list", list);
		             request.setAttribute("navi", navi);
					 request.setAttribute("Fnum", Fnum);
					 request.setAttribute("Snum", Snum);

             }else  if(search!=null){
			 int pageTotalCount = dao.getMemberCount(search);
             if(currentPage <1) {currentPage = 1;}
             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

	            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
	            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
				List<MemberDTO> list = dao.listSearchMember(start, end, search);
				List<Integer> navi = dao.getMemberNavi(currentPage, search);

             int Fnum = 0;
             int NavCheck = navi.size();
             if(NavCheck==12){
            	 Fnum = navi.get(10);
             }else if(NavCheck>9) {
	             Fnum = navi.get(9);	            	 
             }
             int Snum = 0;
             if(NavCheck>2) {
	             Snum = navi.get(1);		            	 
             }
             String seqID = request.getSession().getAttribute("seqID").toString();
             request.setAttribute("seqID", seqID);
             request.setAttribute("list", list);
             request.setAttribute("navi", navi);
			 request.setAttribute("Fnum", Fnum);
			 request.setAttribute("Snum", Snum);
            request.setAttribute("search", search);			    
             }
	             request.setAttribute("cpage", currentPage);
				request.getRequestDispatcher("/admin/member.jsp").forward(request, response);
				
			}else if(cmd.equals("mEdit.admin")) {
				int num = Integer.parseInt(request.getParameter("num"));
				
				MemberDTO dto = dao.getMember(num);
				if(dto.getPh().length()==9) {
					request.setAttribute("phoneFirst", dto.getPh().substring(0,2));
					request.setAttribute("phoneMiddle", dto.getPh().substring(2,5));
					request.setAttribute("phoneLast", dto.getPh().substring(5, 9));									
				}else if(dto.getPh().length()==10 && dto.getPh().substring(0,2).equals("02")) {
					request.setAttribute("phoneFirst", dto.getPh().substring(0,2));
					request.setAttribute("phoneMiddle", dto.getPh().substring(2,6));
					request.setAttribute("phoneLast", dto.getPh().substring(6, 10));					
				}else if(dto.getPh().length()==10){
					request.setAttribute("phoneFirst", dto.getPh().substring(0,3));
					request.setAttribute("phoneMiddle", dto.getPh().substring(3,6));
					request.setAttribute("phoneLast", dto.getPh().substring(6, 10));										
				}else {
					request.setAttribute("phoneFirst", dto.getPh().substring(0,3));
					request.setAttribute("phoneMiddle", dto.getPh().substring(3,7));
					request.setAttribute("phoneLast", dto.getPh().substring(7, 11));					
				}
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/admin/memberEdit.jsp").forward(request, response);
				
			}else if(cmd.equals("modifyM.admin")) {
				
				int maxSize = 1024*1024*10; //10m
				//savepath 경로 변경
				String savePath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
//				String savePath = "C:\\Users\\limdo\\git\\senasic6\\src\\main\\webapp//upload";

				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}
				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
		   		int seq = Integer.parseInt(multi.getParameter("seq"));
				MemberDTO real = dao.getMember(seq); //멤버 수정후
     
				String root = "/upload/"; //루트 수정
				String oriName1 = multi.getOriginalFileName("photo");
				String sysName1 = multi.getFilesystemName("photo");
				if(sysName1 ==null) {
					//sysName1=real.getImg().substring(root.length());
				}
				multi.getParameter(savePath);
				String id= multi.getParameter("id");
        		String nn = multi.getParameter("nn");
        		String m = multi.getParameter("m");
        		String p1 = multi.getParameter("phone1");
        		String p2 = multi.getParameter("phone2");
        		String p3 = multi.getParameter("phone3");
        		int age = Integer.parseInt(multi.getParameter("age"));
        		String gender = multi.getParameter("gender");
        		
        		String ph = (p1+p2+p3);
        		
    			dao.modifyM(id,nn,m,age,gender,ph);
    			response.sendRedirect("/mEdit.admin?num="+seq);
        	   
			}else if(cmd.equals("deleteM.admin")){
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = dao.deleteMember(seq);
				response.sendRedirect("/member.admin");
				
				
			}else if(cmd.equals("pet.admin")) {
				int currentPage=1;
				if(request.getParameter("cpage")!=null) {currentPage = Integer.parseInt(request.getParameter("cpage"));}
	            String search = request.getParameter("search");

	             if(search == null){
		             int pageTotalCount = dao.getPetPageTotalCount();
		             
		             if(currentPage <1) {currentPage = 1;}
		             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
		             
			            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
			            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
						List<PetBoardDTO> list = pdao.selectByBound(start, end);
						List<Integer> navi = dao.getPetNavi(currentPage);
					int Fnum = 0;
		             int NavCheck = navi.size();
		             if(NavCheck==12){
		            	 Fnum = navi.get(10);
		             }else if(NavCheck>9) {
			             Fnum = navi.get(9);	            	 
		             }
		             int Snum = 0;
		             if(NavCheck>1) {
			             Snum = navi.get(1);		            	 
		             }
				            
		             request.setAttribute("list", list);
		             request.setAttribute("navi", navi);
					 request.setAttribute("Fnum", Fnum);
					 request.setAttribute("Snum", Snum);

             }else  if(search!=null){
	             int pageTotalCount = dao.getPetPageTotalCount(search);
             if(currentPage <1) {currentPage = 1;}
             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

	            int start = currentPage * Statics.ADMIN_COUNT_PER_PAGE - (Statics.ADMIN_COUNT_PER_PAGE-1);
	            int end = currentPage * Statics.ADMIN_COUNT_PER_PAGE;
				List<PetBoardDTO> list = dao.selectByBound(start, end, search);
				List<Integer> navi = dao.getPetNavi(currentPage,search);

             int Fnum = 0;
             int NavCheck = navi.size();
             if(NavCheck==12){
            	 Fnum = navi.get(10);
             }else if(NavCheck>9) {
	             Fnum = navi.get(9);	            	 
             }
             int Snum = 0;
             if(NavCheck>2) {
	             Snum = navi.get(1);		            	 
             }
             
             request.setAttribute("list", list);
             request.setAttribute("navi", navi);
			 request.setAttribute("Fnum", Fnum);
			 request.setAttribute("Snum", Snum);
            request.setAttribute("search", search);			    
             }
	             String seqID = request.getSession().getAttribute("seqID").toString();
	             request.setAttribute("seqID", seqID);
	             request.setAttribute("cpage", currentPage);
				request.getRequestDispatcher("/admin/PetBoardEdit.jsp").forward(request, response);
				
			}else if(cmd.equals("delPet.admin")) {
				int seq = Integer.parseInt(request.getParameter("seq"));

				int result = pdao.delete(seq);
				response.sendRedirect("/pet.admin?cpage=1");
			}else if(cmd.equals("dash.admin")) {
				int num = dao.checkDash();
				if(num == 0) {
					dao.insertDash();
				}else {
					dao.updateDash();
				}
				List<dashboardDTO> count = dao.getDashboard(1, 7);
	             String seqID = request.getSession().getAttribute("seqID").toString();
	             request.setAttribute("seqID", seqID);
				request.setAttribute("count", count);
				request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
