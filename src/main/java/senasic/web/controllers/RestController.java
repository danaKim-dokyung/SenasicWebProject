package senasic.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import senasic.web.DAO.RecDAO;
import senasic.web.DAO.RestBoardDAO;
import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.RcmdDTO;
import senasic.web.DTO.RestBoardDTO;
import senasic.web.DTO.RestReplyDTO;
import statics.Statics;


@WebServlet("*.rest")
public class RestController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");	
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length()+1);
		RestBoardDAO dao = RestBoardDAO.getInstance();
		RecDAO rdao = RecDAO.getInstance();
		Gson g = new Gson();

		System.out.println(cmd);
		try {
			if(cmd.equals("load.rest")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String id = request.getSession().getAttribute("loginID").toString();
				RestBoardDTO result = dao.detailPage(seq);		
				MenuDTO menu = dao.getMenu(result.getTitle());
				int currentPage=1;
				if(request.getParameter("rvpg")!=null) {currentPage = Integer.parseInt(request.getParameter("rvpg"));}
	            int pageTotalCount = dao.getReviewPageTotalCount(seq);
	            if(currentPage <1) {currentPage = 1;}
	             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
	             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
	             int end = currentPage * Statics.REST_COUNT_PER_PAGE;

	             List<RestReplyDTO> reply = dao.listReply(seq,start,end);
	             List<Integer> navi = dao.getReviewPageNavi(currentPage,seq);
	             
		            int RecCheck = rdao.recCheck(seq, id); //추천 여부 확인, 1 추천 0 기록없음
		            int user = 0;
		            if(RecCheck == 1) {
		            	user = 0;
		            }else if(RecCheck==0) {
			            user = 1;
		            }
	             
	             
	             request.setAttribute("startR", start-1);
	             request.setAttribute("endR", end+1);
	             request.setAttribute("navi", navi);
	             request.setAttribute("rvPg", currentPage);
				request.setAttribute("dto", result);
				request.setAttribute("menu", menu);
				request.setAttribute("reply", reply);
				request.setAttribute("RecCheck", RecCheck);
				request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
			}else if(cmd.equals("reply.rest")) {
				//�뙆�씪 癒쇱� �떎�슫
				int maxSize = 1024*1024*10; //10mb
				//oracle 二쇱냼�뿉 �꽔�쓣 諛⑸쾿 李얘린
				//二쇱냼 蹂�寃�
				String savePath = "C:\\Users\\limdo\\git\\senasic6\\src\\main\\webapp\\Restaurant/ReplyImg";
				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}				
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				multi.getParameter(savePath);
				String oriName = multi.getOriginalFileName("photo");
				
				System.out.println(oriName);
				String sysName = multi.getFilesystemName("photo");
				//String id = "�엫�떆";
	    		String id = request.getSession().getAttribute("loginID").toString();

				int seq = Integer.parseInt(multi.getParameter("seq"));
				String contents = multi.getParameter("contents");
				double rate = Double.parseDouble(multi.getParameter("rating"));
				String imgPath = "\\Restaurant\\ReplyImg\\";
				int result = dao.insertReview(seq, id, contents, imgPath+sysName, rate);
				int update = dao.updateRate(seq);
				response.sendRedirect("/load.rest?seq="+seq);
			}else if(cmd.equals("like.rest")) {
	            int recseq =  Integer.parseInt(request.getParameter("seq"));
	            String recid = request.getSession().getAttribute("loginID").toString();
	            int result = rdao.recCheck(recseq, recid); //추천 여부 확인, 1 추천 0 기록없음
	            int user = 0;
	            if(result == 1) {
	            	rdao.recDelete(recseq, recid);
	            	user = 0;
	            }else if(result==0) {
		            rdao.recinsert(new RcmdDTO(recseq,recid));
		            user = 1;
	            }
	            int a = rdao.recUpdate(recseq);
	            int num = rdao.getRecNum(recseq);
	            
	            int[] arr = new int[2];
	            arr[0] = num;
	            arr[1] = user;
	            String answer = g.toJson(arr);
	            response.getWriter().append(answer);
	            
	         }else if(cmd.equals("fboard.rest")) {
	             
	             List<RestBoardDTO> carousel = dao.Carousel();
	             
	             RestBoardDTO ct= carousel.get(0);
				 RestBoardDTO ct1= carousel.get(1);
				 RestBoardDTO ct2= carousel.get(2);
	             
	             int currentPage = Integer.parseInt(request.getParameter("cpage"));
	             int pageTotalCount = dao.getPageTotalCount();
	             
	             if(currentPage <1) {currentPage = 1;}
	             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
	             
	             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
	             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
	             List<RestBoardDTO> list = dao.selectByList(start, end);
	             List<Integer> navi = dao.getPageNavi(currentPage);
	            
	             System.out.println(carousel.size());
	             request.setAttribute("list", list);
	             request.setAttribute("navi", navi);
	             request.setAttribute("carousel", carousel);
	             request.setAttribute("ct", ct);
				 request.setAttribute("ct1", ct1);
				 request.setAttribute("ct2", ct2);
				 request.setAttribute("startB", start-1);
	             request.setAttribute("endB", end+1);
	             request.setAttribute("fbPg", currentPage); // 이름 고쳐주기
	             request.getRequestDispatcher("/Restaurant/foodboard.jsp").forward(request, response);
	             
	             
	          }else if(cmd.equals("detail.rest")){
	             int seq = Integer.parseInt(request.getParameter("seq"));
	             RestBoardDTO dto = dao.selectBySeq(seq);
	             request.setAttribute("dto", dto);
	             request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
	          
	          }else if(cmd.equals("board1.rest")) {
	        	  
	        	  List<RestBoardDTO> carousel = dao.Carousel();
		          RestBoardDTO ct= carousel.get(0); 
	        	  int seq = Integer.parseInt(request.getParameter("seq"));
	        	  RestBoardDTO dto = dao.selectBySeq(seq);
	        	  
	        	  request.setAttribute("dto", dto);
	        	  request.setAttribute("ct", ct);
	        	  response.sendRedirect("/load.rest?seq="+seq);
//	        	  request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request,response);

	        	  
	          }else if(cmd.equals("borad2.rest")) {
	        	  
	        	  List<RestBoardDTO> carousel = dao.Carousel();
	        	  RestBoardDTO ct1= carousel.get(1);
	        	  int seq = Integer.parseInt(request.getParameter("seq"));
	        	  RestBoardDTO dto = dao.selectBySeq(seq);
	        	  
	        	  request.setAttribute("dto", dto);
	        	  request.setAttribute("ct1", ct1);
	        	  response.sendRedirect("/Restaurant/detail.jsp");
//	        	  request.getRequestDispatcher("/Restaurant/detail.jsp?seq="+seq).forward(request,response);
	        	  
	          }else if(cmd.equals("board3.rest")) {
	        	  
	        	  List<RestBoardDTO> carousel = dao.Carousel();
	        	  RestBoardDTO ct2= carousel.get(2);
	        	  int seq = Integer.parseInt(request.getParameter("seq"));
	        	  RestBoardDTO dto = dao.selectBySeq(seq);
	        	  
	        	  request.setAttribute("dto", dto);
	        	  request.setAttribute("ct2", ct2);
	        	  response.sendRedirect("/Restaurant/detail.jsp");
//	        	  request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request,response);
	        	  
	          }

		}catch(Exception e) {
			e.getStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
