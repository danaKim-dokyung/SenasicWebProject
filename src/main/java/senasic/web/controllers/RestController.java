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

import senasic.web.DAO.RecDAO;
import senasic.web.DAO.RestBoardDAO;
import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.RcmdDTO;
import senasic.web.DTO.RestBoardDTO;
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
		System.out.println(cmd);
		try {
			if(cmd.equals("load.rest")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				RestBoardDTO result = dao.detailPage(seq);				
				MenuDTO menu = dao.getMenu(result.getTitle());
				request.setAttribute("dto", result);
				request.setAttribute("menu", menu);
				request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
			}else if(cmd.equals("reply.rest")) {
				//파일 먼저 다운
				int maxSize = 1024*1024*10; //10mb
				//oracle 주소에 넣을 방법 찾기
				//주소 변경
				String savePath = "C:\\Users\\limdo\\git\\senasic6\\src\\main\\webapp\\Restaurant/ReplyImg";
				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}				
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				multi.getParameter(savePath);
				String oriName = multi.getOriginalFileName("photo");
				
				System.out.println(oriName);
				String sysName = multi.getFilesystemName("photo");
				//String id = "임시";
	    		String id = request.getSession().getAttribute("loginID").toString();

				int seq = Integer.parseInt(multi.getParameter("seq"));
				String contents = multi.getParameter("contents");
				double rate = Double.parseDouble(multi.getParameter("rating"));
				String imgPath = "\\Restaurant\\ReplyImg\\";
				int result = dao.insertReview(seq, id, contents, imgPath+sysName, rate);
				System.out.println(result);
				response.sendRedirect("/load.rest?seq="+seq);
			}else if(cmd.equals("/like.rest")) {
	            int recseq =  Integer.parseInt(request.getParameter("seq"));
	            String recid = request.getParameter("id");
	            rdao.recinsert(new RcmdDTO(recseq,recid));
	         }else if(cmd.equals("fboard.rest")) {
	             
	             List<RestBoardDTO> carousel = dao.Carousel();
	             
	             int currentPage = Integer.parseInt(request.getParameter("cpage"));
	             int pageTotalCount = dao.getPageTotalCount();
	             
	             if(currentPage <1) {currentPage = 1;}
	             if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
	             
	             int start = currentPage * Statics.REST_COUNT_PER_PAGE - (Statics.REST_COUNT_PER_PAGE-1);
	             int end = currentPage * Statics.REST_COUNT_PER_PAGE;
	             List<RestBoardDTO> list = dao.selectByList(start, end);
	             String navi = dao.getPageNavi(currentPage);
	             System.out.println(carousel.size());
	             request.setAttribute("list", list);
	             request.setAttribute("navi", navi);
	             request.setAttribute("carousel", carousel);
	             request.getRequestDispatcher("/Restaurant/foodboard.jsp").forward(request, response);
	             
	             
	          }else if(cmd.equals("detail.rest")){
	             int seq = Integer.parseInt(request.getParameter("seq"));
	             RestBoardDTO dto = dao.selectBySeq(seq);
	             request.setAttribute("dto", dto);
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
