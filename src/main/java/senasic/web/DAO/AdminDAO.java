package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MemberDTO;
import senasic.web.DTO.RestBoardDTO;
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
		    				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8));
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
	    				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getInt(8));
	    				return dto;
		    		}
		    	}
		    }
}
