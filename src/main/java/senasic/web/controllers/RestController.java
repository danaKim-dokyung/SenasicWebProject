package senasic.web.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import senasic.web.DAO.RestBoardDAO;
import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.RestBoardDTO;


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
				MenuDTO menu = dao.getMenu(result.getTitle());
				request.setAttribute("dto", result);
				request.setAttribute("menu", menu);
				request.getRequestDispatcher("/Restaurant/detail.jsp").forward(request, response);
			}else if(cmd.equals("reply.rest")) {
				//파일 먼저 다운
				int maxSize = 1024*1024*10; //10mb
				//oracle 주소에 넣는방법 찾기
				String savePath = request.getServletContext().getRealPath("ReplyImg");
				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}				
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
				System.out.println(savePath);

				multi.getParameter(savePath);
				String oriName = multi.getOriginalFileName("photo");
				
				System.out.println(oriName);
				String sysName = multi.getFilesystemName("photo");
				//String id = request.getSession().getAttribute(cmd);
				String id = "임시";
				int seq = Integer.parseInt(multi.getParameter("seq"));
				String contents = multi.getParameter("contents");
				double rate = Double.parseDouble(multi.getParameter("rating"));
				int result = dao.insertReview(seq, id, contents, sysName, rate);
				System.out.println(result);
				response.sendRedirect("/load.rest?seq="+seq);
			}
		}catch(Exception e) {
			e.getStackTrace();
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
