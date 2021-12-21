package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MemberDTO;
import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.RestBoardDTO;
import senasic.web.DTO.dashboardDTO;
import statics.Statics;

public class AdminDAO {
	private static AdminDAO instance;
	public static AdminDAO getInstance() {
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}
	private AdminDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//식당게시판 글 삽입
	public int writeRest(String title,String loc, String loc_detail, String ctg, String hour, String garage, String phone, String ph1, String ph2, String ph3,String link) throws Exception{
		String sql = "insert into rest_board values(rest_board_seq.nextval,?,?,?,?,?,default,default,?,?,?,?,?,?)";
		//시퀀스명 확인
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setString(1, title);
			pstat.setString(2, loc);
			pstat.setString(3, loc_detail);
			pstat.setString(4, ctg);
			pstat.setString(5, hour);
			
			pstat.setString(6, garage);
			pstat.setString(7, phone);
			pstat.setString(8, ph1);
			pstat.setString(9, ph2);
			pstat.setString(10, ph3);
			pstat.setString(11, link);			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int insertMenu(String title, String m1,int p1, String m2, int p2, String m3, int p3) throws Exception{
		String sql = "insert into menu values(?,?,?,?,?,?,?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setString(1, title);
			pstat.setString(2, m1);
			pstat.setInt(3, p1);
			pstat.setString(4, m2);
			pstat.setInt(5, p2);
			pstat.setString(6, m3);
			pstat.setInt(7, p3);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	
	//식당게시판 수정
	public int getRestCount() throws Exception{
	      String sql = "select count(*) from Rest_board";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ResultSet rs = pstat.executeQuery();){
	         
	         rs.next();
	         return rs.getInt(1);
	      }
	   }
	
	public int getRestCount(String target) throws Exception{
	      String sql = "select count(*) from Rest_board where title like ? or locate like ? or locate_detail like ? or category = ?"; //수정
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	      pstat.setString(1, "%"+target+"%");
	      pstat.setString(2, "%"+target+"%");
	      pstat.setString(3, "%"+target+"%");
	      pstat.setString(4, "%"+target+"%");

	     try(ResultSet rs = pstat.executeQuery();){
	         
	         rs.next();
	         return rs.getInt(1);
	            }
	      }
	   }
	
	   
	   public int getPageTotalCount() throws Exception{
	      
	      int restTotalCount = this.getRestCount(); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
	      int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.
	      
	      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
	         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
	      }else {
	         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1; //
	      }
	      return pageTotalCount;
	   }
		//검색
		public int getPageTotalCount(String target) throws Exception{

			int restTotalCount = this.getRestCount(target); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
			int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.
		      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
			         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
			      }else {
			         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1; //
			      }
			      return pageTotalCount;
		}
	   
	   public List getPageNavi(int currentPage) throws Exception{
	   
	      int restTotalCount = this.getRestCount(); // �쁽�옱 珥� 紐뉕컻�쓽 寃뚯떆湲� �엳�뒗吏�
	      
	      int pageTotalCount =0; // �럹�씠吏� 珥� 媛��닔
	      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
	         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
	      }else {
	         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
	      }
	      int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
	      int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
	      
	      if(endNavi > pageTotalCount) {
	         endNavi = pageTotalCount;
	      }
	      
	      boolean needPrev = true; // needPrev => �쇊履� �솕�궡�몴
	      boolean needNext = true; // needNext => �삤瑜몄そ �솕�궡�몴
	      
	      if(startNavi == 1) {
	         needPrev = false;
	      }
	      
	      if(endNavi == pageTotalCount) {
	         needNext = false;
	      }
	      
	      List<Integer> pageNavi = new ArrayList<>();
	      if(needPrev) {pageNavi.add(startNavi-1) ;}
	      for(int i = startNavi; i<=endNavi; i++) {
	         pageNavi.add(i);
	      }
	      if(needNext) { pageNavi.add(endNavi+1);}
	      return pageNavi;
	   }
	
	   public List getPageNaviSearch(int currentPage, String target) throws Exception{

			int restTotalCount = this.getRestCount(target); // �쁽�옱 珥� 紐뉕컻�쓽 寃뚯떆湲� �엳�뒗吏�

			int pageTotalCount =0; // �럹�씠吏� 珥� 媛��닔
			if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
				pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
			}else {
				pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
			}
			int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
			int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}

			boolean needPrev = true; // needPrev => �쇊履� �솕�궡�몴
			boolean needNext = true; // needNext => �삤瑜몄そ �솕�궡�몴

			if(startNavi == 1) {
				needPrev = false;
			}

			if(endNavi == pageTotalCount) {
				needNext = false;
			}

			List<Integer> pageNavi = new ArrayList<>();
			if(needPrev) {pageNavi.add(startNavi-1) ;}
			for(int i = startNavi; i<=endNavi; i++) {
				pageNavi.add(i);
			}
			if(needNext) { pageNavi.add(endNavi+1);}
			return pageNavi;
		}
	   
	   public RestBoardDTO getRestBoardInfo(int num) throws Exception{
		   String sql = "select * from rest_board where seq = ?";
		   try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				   ){
			   pstat.setInt(1, num);
			   try(ResultSet rs = pstat.executeQuery();){
				   rs.next();
					RestBoardDTO result = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
									,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
					return result;
			   }
		   }
	   }
	   
	   public MenuDTO getMenuInfo(String title) throws Exception{
		   String sql = "select * from menu where shop= ?";
		   try(Connection con = this.getConnection();
				 PreparedStatement pstat = con.prepareStatement(sql);
				   ){
			   pstat.setString(1, title);
			   try(ResultSet rs = pstat.executeQuery();){
				   rs.next();
				   MenuDTO dto = new MenuDTO(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7));
				   return dto;
			   }
			   
		   }
	   } 
	   
		public int updateRest(String title,String loc, String loc_detail, String ctg, String hour, String garage, String phone, String ph1, String ph2, String ph3,String link, int seq) throws Exception{
			String sql = "update rest_board set title = ?, locate = ?, locate_detail = ?, category = ?, open_hour =?, garage = ?, phone = ?, photo1 = ?, photo2 = ?, photo3 = ?, link = ? where seq = ?";
			//시퀀스명 확인
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, title);
				pstat.setString(2, loc);
				pstat.setString(3, loc_detail);
				pstat.setString(4, ctg);
				pstat.setString(5, hour);
				
				pstat.setString(6, garage);
				pstat.setString(7, phone);
				pstat.setString(8, ph1);
				pstat.setString(9, ph2);
				pstat.setString(10, ph3);
				pstat.setString(11, link);
				pstat.setInt(12, seq);
				int result = pstat.executeUpdate();
				return result;
			}
		}
		
		public int updateMenu(String title, String m1,int p1, String m2, int p2, String m3, int p3, String shop) throws Exception{
			String sql = "update menu set menu1 = ?, price1 = ?, menu2 = ?, price2 = ?, menu3 = ?, price3 = ?, shop = ? where shop = ?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, m1);
				pstat.setInt(2, p1);
				pstat.setString(3, m2);
				pstat.setInt(4, p2);
				pstat.setString(5, m3);
				pstat.setInt(6, p3);
				pstat.setString(7, title);
				pstat.setString(8, shop);
				int result = pstat.executeUpdate();
				return result;
			}
		}
		
		public int deleteRest(int seq) throws Exception{
			String sql = "delete from rest_board where seq = ?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setInt(1, seq);
				int result = pstat.executeUpdate();
				return result;
			}
		}
		
		public int deleteMenu(String title) throws Exception{
			String sql = "delete from menu where shop = ?";
			try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, title);
				int result = pstat.executeUpdate();
				return result;
			}
		}
	   
	//멤버 영역
	public int getMemberCount() throws Exception{
	      String sql = "select count(*) from member";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ResultSet rs = pstat.executeQuery();){
	         rs.next();
	         return rs.getInt(1);
	      }
	   }

	public int getMemberCount(String target) throws Exception{
	      String sql = "select count(*) from member where id like ? or nn like ? or ph like ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, "%"+target+"%");   
	         pstat.setString(2, "%"+target+"%");   
	         pstat.setString(3, "%"+target+"%");   
	    	  
	    	 try(ResultSet rs = pstat.executeQuery();){
	         rs.next();
	         return rs.getInt(1);
	    	  
	      }
	      }
	   }
	
	   public int getMemberTotalCount() throws Exception{
		      
		      int restTotalCount = this.getMemberCount(); // 현재 총 게시글 몇개있는지
		      int pageTotalCount = 0; // 총 몇개의 페이지 만들어질 것인지.
		      
		      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
		      }else {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1; //
		      }
		      return pageTotalCount;
		   }
	   
	   public int getMemberTotalCount(String target) throws Exception{
		      
		      int restTotalCount = this.getMemberCount(target); // 현재 총 게시글 몇개있는지
		      int pageTotalCount = 0; // 총 몇개의 페이지 만들어질 것인지.
		      
		      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
		      }else {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1; //
		      }
		      return pageTotalCount;
		   }
		   
		   public List getMemberNavi(int currentPage) throws Exception{
		   
		      int restTotalCount = this.getMemberCount(); // 현재 총 몇개의 게시글 있는지
		      
		      int pageTotalCount =0; // 페이지 총 갯수
		      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
		      }else {
		         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
		      }
		      int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		      int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
		      
		      if(endNavi > pageTotalCount) {
		         endNavi = pageTotalCount;
		      }
		      
		      boolean needPrev = true; // needPrev => 왼쪽 화살표
		      boolean needNext = true; // needNext => 오른쪽 화살표
		      
		      if(startNavi == 1) {
		         needPrev = false;
		      }
		      
		      if(endNavi == pageTotalCount) {
		         needNext = false;
		      }
		      
		      List<Integer> pageNavi = new ArrayList<>();
		      if(needPrev) {pageNavi.add(startNavi-1) ;}
		      for(int i = startNavi; i<=endNavi; i++) {
		         pageNavi.add(i);
		      }
		      if(needNext) { pageNavi.add(endNavi+1);}
		      return pageNavi;
		   }
		   
		   
		   public List getMemberNavi(int currentPage, String target) throws Exception{
			   
			      int restTotalCount = this.getMemberCount(target); // 현재 총 몇개의 게시글 있는지
			      
			      int pageTotalCount =0; // 페이지 총 갯수
			      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
			         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
			      }else {
			         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
			      }
			      int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
			      int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;
			      
			      if(endNavi > pageTotalCount) {
			         endNavi = pageTotalCount;
			      }
			      
			      boolean needPrev = true; // needPrev => 왼쪽 화살표
			      boolean needNext = true; // needNext => 오른쪽 화살표
			      
			      if(startNavi == 1) {
			         needPrev = false;
			      }
			      
			      if(endNavi == pageTotalCount) {
			         needNext = false;
			      }
			      
			      List<Integer> pageNavi = new ArrayList<>();
			      if(needPrev) {pageNavi.add(startNavi-1) ;}
			      for(int i = startNavi; i<=endNavi; i++) {
			         pageNavi.add(i);
			      }
			      if(needNext) { pageNavi.add(endNavi+1);}
			      return pageNavi;
			   }
		   
		   
		   
		   
		    public List<MemberDTO> listMember(int start, int end) throws Exception{
		    	String sql = "select * from (select member.* , row_number() over(order by seq desc) rn from member)where rn between ? and ?";
		    	
		    	try(Connection con = this.getConnection();
		    		PreparedStatement pstat = con.prepareStatement(sql);
		    			){
		    		pstat.setInt(1, start);
		    		pstat.setInt(2, end);
		    		try(ResultSet rs = pstat.executeQuery()){
		    			List<MemberDTO> list = new ArrayList();
		    			while(rs.next()) {
		    				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
		    				list.add(dto);
		    			}
		    			return list;
		    		}
		    	}
		    }
		    
		    public List<MemberDTO> listSearchMember(int start, int end, String target) throws Exception{
		    	String sql = "select * from (select member.* , row_number() over(order by seq desc) rn from member where id like ? or nn like ? or ph like ?)where rn between ? and ?";
		    	
		    	try(Connection con = this.getConnection();
		    		PreparedStatement pstat = con.prepareStatement(sql);
		    			){
		    		pstat.setString(1, "%"+target+"%");
		    		pstat.setString(2, "%"+target+"%");
		    		pstat.setString(3, "%"+target+"%");
		    		pstat.setInt(4, start);
		    		pstat.setInt(5, end);
		    		try(ResultSet rs = pstat.executeQuery()){
		    			List<MemberDTO> list = new ArrayList();
		    			while(rs.next()) {
		    				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
		    				list.add(dto);
		    			}
		    			return list;
		    		}
		    	}
		    }
		    
		    
		    
		    
		    
		    
		    public MemberDTO getMember(int num) throws Exception{
		    	String sql = "select * from member where seq = ?";
		    	try(Connection con = this.getConnection();
		    		PreparedStatement pstat = con.prepareStatement(sql);
		    			){
		    		pstat.setInt(1, num);
		    		try(ResultSet rs = pstat.executeQuery();){
		    			rs.next();
	    				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
	    				return dto;
		    		}
		    	}
		    }
		    
		    public int modifyM(String id, String nickname, String email, int age, String gender, String phone) throws Exception{
		    	String sql = "update member set nn=?,m=?,age=?,gender=?,ph=? where id = ?";
		    	try(Connection con = this.getConnection();
		    		PreparedStatement pstat = con.prepareStatement(sql);
		    			){
		    		pstat.setString(1, nickname);
		    		pstat.setString(2, email);
		    		pstat.setInt(3, age);
		    		pstat.setString(4, gender);
		    		pstat.setString(5, phone);
		    		pstat.setString(6, id);
		    		int result = pstat.executeUpdate();
		    		return result;
		    	}
		    }
		    
		    public int deleteMember(int seq) throws Exception{
		    	String sql = "delete from member where seq = ?";
		    	try(Connection con = this.getConnection();
		    		PreparedStatement pstat = con.prepareStatement(sql);
		    			){
		    		pstat.setInt(1, seq);
		    		int result = pstat.executeUpdate();
		    		return result;
		    	}
		    }
		    
		    
			// 페이징 전체보기.
			private int getPetRecordCount() throws Exception {
				String sql = "select count(*) from pet_board";
				try (Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
						ResultSet rs = pstat.executeQuery();) {
					rs.next();
					return rs.getInt(1);
				}
			}
			
			private int getPetRecordCount(String target) throws Exception {
				String sql = "select count(*) from pet_board where id like ? or category like ? or writer like ? or title like ? or contents like ?";
				try (Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
						){
					pstat.setString(1, "%"+target+"%");
					pstat.setString(2, "%"+target+"%");
					pstat.setString(3, "%"+target+"%");
					pstat.setString(4, "%"+target+"%");
					pstat.setString(5, "%"+target+"%");

					try(ResultSet rs = pstat.executeQuery();) {
						rs.next();
						return rs.getInt(1);	
				}
				
				}
			}
			
			public int getPetPageTotalCount() throws Exception {
				int recordTotalCount = this.getPetRecordCount();

				// 총 페이지의 개수
				int pageTotalCount = 0;

				// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
				if (recordTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
					pageTotalCount = recordTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
					// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
				} else {
					pageTotalCount = recordTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1;
				}
				return pageTotalCount;
			}
			
			public int getPetPageTotalCount(String target) throws Exception {
				int recordTotalCount = this.getPetRecordCount(target);

				// 총 페이지의 개수
				int pageTotalCount = 0;

				// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
				if (recordTotalCount % Statics.ADMIN_COUNT_PER_PAGE == 0) {
					pageTotalCount = recordTotalCount / Statics.ADMIN_COUNT_PER_PAGE;
					// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
				} else {
					pageTotalCount = recordTotalCount / Statics.ADMIN_COUNT_PER_PAGE + 1;
				}
				return pageTotalCount;
			}
			
			
			   public List getPetNavi(int currentPage) throws Exception{
				   
				      int restTotalCount = this.getPetRecordCount(); // 현재 총 몇개의 게시글 있는지
				      int pageTotalCount =0; // 페이지 총 갯수
				      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
				         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
				      }else {
				         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
				      }
				      int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
				      int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

				      if(endNavi > pageTotalCount) {
				         endNavi = pageTotalCount;
				      }
				      
				      boolean needPrev = true; // needPrev => 왼쪽 화살표
				      boolean needNext = true; // needNext => 오른쪽 화살표
				      
				      if(startNavi == 1) {
				         needPrev = false;
				      }
				      
				      if(endNavi == pageTotalCount) {
				         needNext = false;
				      }

				      
				      List<Integer> pageNavi = new ArrayList<>();
				      if(needPrev) {pageNavi.add(startNavi-1) ;}
				      for(int i = startNavi; i<=endNavi; i++) {
				         pageNavi.add(i);
				      }
				      if(needNext) { pageNavi.add(endNavi+1);}
				      return pageNavi;
				   }
			   public List getPetNavi(int currentPage, String target) throws Exception{
				   
				      int restTotalCount = this.getPetRecordCount(target); // 현재 총 몇개의 게시글 있는지
				      int pageTotalCount =0; // 페이지 총 갯수
				      if(restTotalCount % Statics.ADMIN_COUNT_PER_PAGE ==0) {
				         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE ;
				      }else {
				         pageTotalCount = restTotalCount / Statics.ADMIN_COUNT_PER_PAGE +1 ;
				      }
				      int startNavi = (currentPage-1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
				      int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

				      if(endNavi > pageTotalCount) {
				         endNavi = pageTotalCount;
				      }
				      
				      boolean needPrev = true; // needPrev => 왼쪽 화살표
				      boolean needNext = true; // needNext => 오른쪽 화살표
				      
				      if(startNavi == 1) {
				         needPrev = false;
				      }
				      
				      if(endNavi == pageTotalCount) {
				         needNext = false;
				      }

				      
				      List<Integer> pageNavi = new ArrayList<>();
				      if(needPrev) {pageNavi.add(startNavi-1) ;}
				      for(int i = startNavi; i<=endNavi; i++) {
				         pageNavi.add(i);
				      }
				      if(needNext) { pageNavi.add(endNavi+1);}
				      return pageNavi;
				   }
			   
				public List<PetBoardDTO> selectByBound(int start, int end, String target) throws Exception {
					String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board where id like ? or category like ? or writer like ? or title like ? or contents like ?) where rn between ? and ?";
					try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

						pstat.setString(1, "%"+target+"%");
						pstat.setString(2, "%"+target+"%");
						pstat.setString(3, "%"+target+"%");
						pstat.setString(4, "%"+target+"%");
						pstat.setString(5, "%"+target+"%");
						pstat.setInt(6, start);
						pstat.setInt(7, end);

						try (ResultSet rs = pstat.executeQuery();) {
							List<PetBoardDTO> list = new ArrayList();

							while (rs.next()) {
								String id = rs.getString("id");
								String category = rs.getString("category");
								int seq = rs.getInt("seq");
								String writer = rs.getString("writer");
								String title = rs.getString("title");
								String contents = rs.getString("contents");
								Timestamp write_date = rs.getTimestamp("write_date");
								int view_count = rs.getInt("view_count");
								int good_count = rs.getInt("good_count");
								int comment_count = rs.getInt("comment_count");

								PetBoardDTO dto = new PetBoardDTO(id,category, seq, writer, title, contents, write_date, view_count,
										good_count, comment_count);
								list.add(dto);
							}
							return list;
						}
					}
				}
				
				
				//dashboard
				public int checkDash() throws Exception{
					String sql = "select count(*) from dashboard where timeline>?";
					try(Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
						){
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						pstat.setString(1, format.format(System.currentTimeMillis()));
						try(ResultSet rs = pstat.executeQuery()){
							rs.next();
							int result = rs.getInt(1);
							return result;
						}
					}
				}
				
				public int insertDash() throws Exception{
					String sql = "insert into dashboard values(default,(select count(*) from member), (select count(*) from pet_board),(select count(*) from rest_reply))";
					try(Connection con = this.getConnection();
						Statement stat = con.createStatement();
							){
						int result = stat.executeUpdate(sql);
						return result;
					}
				}
				
				public int updateDash() throws Exception{
					String sql = "update dashboard set user_c = (select count(*) from member), write_c = (select count(*) from pet_board), review_c = (select count(*) from rest_reply) where timeline > ?";
					try(Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
								){
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						pstat.setString(1, format.format(System.currentTimeMillis()));
						int result = pstat.executeUpdate();
						return result;						
						}
				}
				
				public List getDashboard(int start, int end) throws Exception{
					String sql = "select * from (select dashboard.*,row_number() over(order by timeline desc) rn from dashboard) where rn between ? and ?";
					try(Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
							){
						pstat.setInt(1, start);
						pstat.setInt(2, end);
						try(ResultSet rs = pstat.executeQuery();){
							List<dashboardDTO> list = new ArrayList();

							while(rs.next()) {
								list.add(new dashboardDTO(rs.getDate(1),rs.getInt(2),rs.getInt(3),rs.getInt(4)));
							}
							return list;
						}
					}
				}
}
