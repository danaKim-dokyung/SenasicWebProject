package senasic.web.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import senasic.web.DTO.MemberDTO;
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
			//상세페이지
			if(cmd.equals("load.rest")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				String id = "1";
				if(request.getSession().getAttribute("loginID")!=null) {
					id = request.getSession().getAttribute("loginID").toString();					
				}else {
					id = "123";
				}
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
	             
		            int recCheck = rdao.recCheck(seq, id); //추천 여부 확인, 1 추천 0 기록없음
		            int user = 0;
		            if(recCheck == 1) {
		            	user = 0;
		            }else if(recCheck==0) {
			            user = 1;
		            }
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
		             //writer가 들어가야함 
		           
		            List<String> str= new ArrayList<String>(); 
		            for(RestReplyDTO a: reply) {
		            	
		            	 String writer = a.getId();
		            	 
		            	 str.add(dao.selectprofile(writer));
		        
		            }
		           
		            
		             
		           
	             request.setAttribute("Fnum", Fnum);
	             request.setAttribute("Snum", Snum);
	             request.setAttribute("navi", navi);
	             request.setAttribute("rvPg", currentPage);
				request.setAttribute("dto", result);
				request.setAttribute("menu", menu);
				request.setAttribute("reply", reply);
				request.setAttribute("user", user);
				request.setAttribute("str", str);
				request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
				
				//댓글달기
			}else if(cmd.equals("reply.rest")) {
				//�뙆�씪 癒쇱� �떎�슫
				int maxSize = 1024*1024*10; //10mb
				//oracle 二쇱냼�뿉 �꽔�쓣 諛⑸쾿 李얘린
				//二쇱냼 蹂�寃�
				String savePath = "/usr/local/tomcat8/apache-tomcat-8.5.73/webapps/upload";
				//String savePath = "C:\\";
			//String savePath = request.getServletContext().getRealPath(savePath);

				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}				
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				multi.getParameter(savePath);
				String oriName = multi.getOriginalFileName("photo");
				
				//System.out.println(oriName);
				String sysName = multi.getFilesystemName("photo");
				//String id = "�엫�떆";
	    		String id = request.getSession().getAttribute("loginID").toString();

				int seq = Integer.parseInt(multi.getParameter("seq"));
				String contents = multi.getParameter("contents");
				double rate = Double.parseDouble(multi.getParameter("rating"));
				String imgPath = "/upload/";
				int result = dao.insertReview(seq, id, contents, imgPath+sysName, rate);
				int update = dao.updateRate(seq);
				response.sendRedirect("/load.rest?seq="+seq);
				
				//식당 추천
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
	            //메인 화면
	         }else if(cmd.equals("fboard.rest")) {

	             List<RestBoardDTO> carousel = dao.Carousel();
	             
	             RestBoardDTO ct= carousel.get(0);
				 RestBoardDTO ct1= carousel.get(1);
				 RestBoardDTO ct2= carousel.get(2);
				 //리뷰 수
				 int reviewN1 = dao.reviewN(ct.getSeq());
				 int reviewN2 = dao.reviewN(ct1.getSeq());
				 int reviewN3 = dao.reviewN(ct2.getSeq());

				 int currentPage = Integer.parseInt(request.getParameter("cpage"));

				 
	             String ctg = request.getParameter("category");

	             //분류
	             if(ctg==null) {
		             int pageTotalCount = dao.getPageTotalCount();
		             
		             if(currentPage <1) {currentPage = 1;}
		             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
		             
		             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
		             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
		             List<RestBoardDTO> list = dao.selectByList(start, end);
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
	             }
	             else if(ctg.equals("all")) {
	            	 String target = request.getParameter("target");
	            	 
	            	
	               //방법 1.target.substring(5,6).equals("#")
	            	 //target.length()>6 그냥 입력했을떄 6글자 넘어갈수 있어서 
	                 if(target.length()>6) { //#강남구 #분식
	                	 if(target.substring(5,6).equals("#")) {
	                		 String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
			                 target =target.replaceAll(match, "");
		                	    String  word =  target.split("\\s")[0];
				                System.out.println(word);
				                //음식 종류
				                String  word1 =  target.split("\\s")[1];
				                System.out.println(word1);
				           	 int pageTotalCount = dao.getPageTotalCount1(word,word1);
				             if(currentPage <1) {currentPage = 1;}
				             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

				             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
				             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
				             
				             List<RestBoardDTO> list1 = dao.selectBySearch1(word,word1,start, end);

				            
				             List<Integer> navi1 = dao.getPageNaviSearch1(currentPage,word,word1);

				             int Fnum = 0;
				             int NavCheck = navi1.size();
				             if(NavCheck==12){
				            	 Fnum = navi1.get(10);
				             }else if(NavCheck>9) {
					             Fnum = navi1.get(9);	            	 
				             }
				             int Snum = 0;
				             if(NavCheck>2) {
					             Snum = navi1.get(1);		            	 
				             }
				             //요기까지
				             
				            
				             request.setAttribute("list", list1);
				            
				             request.setAttribute("navi", navi1);
							 request.setAttribute("Fnum", Fnum);
							 request.setAttribute("Snum", Snum);
				            	 request.setAttribute("category", "all");		
				            	 request.setAttribute("type", "category");
				            	 String target1 = word+word1;
				            	 request.setAttribute("target", target1);
				            	 
	                	 }else {
	                		 String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
			                 target =target.replaceAll(match, "");
			                 System.out.println(target);
			            	 int pageTotalCount = dao.getPageTotalCount(target);
				             if(currentPage <1) {currentPage = 1;}
				             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

				             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
				             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
				             List<RestBoardDTO> list = dao.selectBySearch(target,start, end);
				             

				             List<Integer> navi = dao.getPageNaviSearch(currentPage,target);
				           

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
				             //요기까지
				             
				             request.setAttribute("list", list);
				           
				             request.setAttribute("navi", navi);
				             
							 request.setAttribute("Fnum", Fnum);
							 request.setAttribute("Snum", Snum);
				            	 request.setAttribute("category", "all");		
				            	 request.setAttribute("type", "category");
				            	 request.setAttribute("target", target);
			             
		                 
	                	 }
	                	
	                	 
	                	 
	                	
			            	
	              
	                 }else{
	                	 String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		                 target =target.replaceAll(match, "");
		                 System.out.println(target);
		            	 int pageTotalCount = dao.getPageTotalCount(target);
			             if(currentPage <1) {currentPage = 1;}
			             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

			             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
			             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
			             List<RestBoardDTO> list = dao.selectBySearch(target,start, end);
			             

			             List<Integer> navi = dao.getPageNaviSearch(currentPage,target);
			           

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
			             //요기까지
			             
			             request.setAttribute("list", list);
			           
			             request.setAttribute("navi", navi);
			             
						 request.setAttribute("Fnum", Fnum);
						 request.setAttribute("Snum", Snum);
			            	 request.setAttribute("category", "all");		
			            	 request.setAttribute("type", "category");
			            	 request.setAttribute("target", target);
		             
	                 }
	           
	                 
	            	 
	            	 //여기부터
				
		            	 
	             }else{
					 int pageTotalCount = dao.getPageTotalCount("category",ctg);
		             if(currentPage <1) {currentPage = 1;}
		             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}

		             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
		             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
		             List<RestBoardDTO> list = dao.selectByCategory(ctg,start, end);

		             List<Integer> navi = dao.getPageNavi(currentPage,"category",ctg);

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
		            	 request.setAttribute("category", ctg);			    
		            	 request.setAttribute("type", "category");

		             }

	             request.setAttribute("carousel", carousel);
	             request.setAttribute("ct", ct);
				 request.setAttribute("ct1", ct1);
				 request.setAttribute("ct2", ct2);
				 request.setAttribute("reviewN1", reviewN1);
				 request.setAttribute("reviewN2", reviewN2);
				 request.setAttribute("reviewN3", reviewN3);
	             request.setAttribute("fbPg", currentPage);
	             request.getRequestDispatcher("/Restaurant/foodboard.jsp").forward(request, response);
	             
	             
	             //리뷰삭제
	          }else if(cmd.equals("reviewDel.rest")) {
	        	  int num = Integer.parseInt(request.getParameter("num"));
	        	  System.out.println(num);
	        	  int result = dao.delReview(num);
	        	  int seq = Integer.parseInt(request.getParameter("seq"));
	        	  response.sendRedirect("/load.rest?seq="+seq);
	          
	          //리뷰 추천
	          }else if(cmd.equals("reviewLike.rest")) {
		            int recseq =  Integer.parseInt(request.getParameter("seq"));
		            String recid = request.getSession().getAttribute("loginID").toString();
		            int result = rdao.recReviewCheck(recseq, recid); //추천 여부 확인, 1 추천 0 기록없음
		            int user = 0;
		            if(result==0) {
			            rdao.recReviewInsert(new RcmdDTO(recseq,recid));
			            user = 1;
		            }
		            int a = rdao.recReviewUpdate(recseq);
		            int num = rdao.getRecReviewNum(recseq);
		            int[] arr = new int[2];
		            arr[0] = num;
		            arr[1] = user;
		            String answer = g.toJson(arr);
		            response.getWriter().append(answer);

	          }

		}catch(Exception e) {
			e.getStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
