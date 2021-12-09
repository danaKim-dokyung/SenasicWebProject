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


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length()+1);

		try {
			if(cmd.equals("upload.admin")) {
				
				int maxSize = 1024*1024*10; //10mb
				String savePath = request.getServletContext().getRealPath("files");
				File filePath = new File(savePath);
				if(!filePath.exists()) {filePath.mkdir();}
				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
				multi.getParameter(savePath);
				String oriName = multi.getOriginalFileName("file");
				System.out.println(oriName);
				String sysName = multi.getFilesystemName("file");
				//미완성	
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
