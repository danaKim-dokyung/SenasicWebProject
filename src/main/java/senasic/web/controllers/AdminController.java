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

import senasic.web.DAO.AdminDAO;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length()+1);
		AdminDAO dao = AdminDAO.getInstance();
		try {
			if(cmd.equals("upload.admin")) {
				int maxSize = 1024*1024*10; //10mb
				String savePath = request.getServletContext().getRealPath("RestImg");
				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}
				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				multi.getParameter(savePath);

				String oriName1 = multi.getOriginalFileName("photo[0]");
				System.out.println(oriName1);
				String sysName1 = multi.getFilesystemName("photo[0]");
				String oriName2 = multi.getOriginalFileName("photo[1]");
				System.out.println(oriName2);
				String sysName2 = multi.getFilesystemName("photo[1]");
				String oriName3 = multi.getOriginalFileName("photo[2]");
				System.out.println(oriName3);
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
				
				int result = dao.writeRest(title, loc, loc_detail, ctg, hour, garage, phone, sysName1, sysName2, sysName3, link);
				int menu = dao.insertMenu(title, m1, p1, m2, p2, m3, p3);
				
				response.sendRedirect("/admin/restBoardWrite.jsp");
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
