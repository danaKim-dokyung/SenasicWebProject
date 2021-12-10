package senasic.web.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.RestBoardDTO;
import statics.Statics;


public class RestBoardDAO {
	private static RestBoardDAO instance;
	public static RestBoardDAO getInstance() {
		if(instance == null) {
			instance = new RestBoardDAO();
		}
		return instance;
	}
	private RestBoardDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public RestBoardDTO detailPage(int seq) throws Exception{
		String sql = "select * from Rest_board where seq = ?";

		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				RestBoardDTO result = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
								,rs.getDouble(7),rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
				return result;
				
			}
			
		}
	}
	
	public MenuDTO getMenu(String shop) throws Exception{
		String sql = "select * from menu where shop = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, shop);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				MenuDTO result = new MenuDTO(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getInt(7));
				return result;
			}
		}
	}
	
	public int insertReview(int seq,String writer,String contents, String photo, double rate) throws Exception{
		String sql = "insert into rest_reply values(reply_seq.nextval,?,?,?,?,?,default)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.setString(2, writer);
			pstat.setString(3,contents);
			pstat.setString(4, photo);
			pstat.setDouble(5, rate);
			int result = pstat.executeUpdate();
			return result;
		}
	}
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
	      
	      int restTotalCount = this.getRestCount(); // 현재 총 게시글 몇개있는지
	      int pageTotalCount = 0; // 총 몇개의 페이지 만들어질 것인지.
	      
	      if(restTotalCount % Statics.REST_COUNT_PER_PAGE == 0) {
	         pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE;
	      }else {
	         pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE + 1; //
	      }
	      return pageTotalCount;
	   }
	   
	   public String getPageNavi(int currentPage) throws Exception{
	   
	      int restTotalCount = this.getRestCount(); // 현재 총 몇개의 게시글 있는지
	      
	      int pageTotalCount =0; // 페이지 총 갯수
	      if(restTotalCount % Statics.REST_COUNT_PER_PAGE ==0) {
	         pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE ;
	      }else {
	         pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE +1 ;
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
	      
	      String pageNavi = "";
	      if(needPrev) {pageNavi += "<a href='fboard.rest?cpage="+(startNavi-1)+"'> < </a> ";}
	      for(int i = startNavi; i<=endNavi; i++) {
	         pageNavi += "<a href='/fboard.rest?cpage="+i+"'>" + i + "</a> ";
	      }
	      if(needNext) { pageNavi += "<a href='fboard.rest?capge="+(endNavi+1)+"'> > </a>";}
	      return pageNavi;
	   }
	   
	   
	   
	   public List<RestBoardDTO> selectAll() throws Exception{
	      String sql = "select * from Rest_board order by seq desc ";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ResultSet rs = pstat.executeQuery()){
	               
	         List<RestBoardDTO> list = new ArrayList<>();
	         while(rs.next()) {
	            RestBoardDTO dto = new RestBoardDTO();
	            dto.setSeq(rs.getInt("seq"));
	            dto.setTitle(rs.getString("title"));
	            dto.setLocate(rs.getString("locate"));
	            dto.setLocate_detail(rs.getString("locate_detail"));
	            dto.setCategory(rs.getString("category"));
	            dto.setOpen_hour(rs.getString("open_hour"));
	            dto.setRate(rs.getDouble("rate"));
	            dto.setRecommend(rs.getInt("recommend"));
	            dto.setGarage(rs.getString("garage"));
	            dto.setPhone(rs.getString("phone"));
	            dto.setPhoto1(rs.getString("photo1"));
	            dto.setPhoto2(rs.getString("photo2"));
	            dto.setPhoto3(rs.getString("photo3"));
	            dto.setLink(rs.getString("link"));
	            list.add(dto);
	            
	         }
	            return list;
	      }      
	   }
	   
	   
	   
	   
	   public List<RestBoardDTO> selectByList(int start, int end)throws Exception{
	      String sql = "select * from (select Rest_board.* , row_number() over(order by seq desc) rn from Rest_board)where rn between ? and ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setInt(1, start);
	         pstat.setInt(2, end);
	         try(ResultSet rs = pstat.executeQuery()){
	            List<RestBoardDTO> list = new ArrayList<>();
	            while(rs.next()) {
	               RestBoardDTO dto = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
	                            ,rs.getDouble(7),rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
	               list.add(dto);
	            }
	            return list;
	         }
	      }
	   }
	   
	   
	   public RestBoardDTO selectBySeq(int seq) throws Exception{
	      String sql = "select * from Rest_board where seq = ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setInt(1, seq);
	         try(ResultSet rs = pstat.executeQuery();){
	            if(rs.next()) {
	               RestBoardDTO dto = new RestBoardDTO();
	               dto.setSeq(rs.getInt("seq"));
	               dto.setTitle(rs.getString("title"));
	               dto.setLocate(rs.getString("locate"));
	               dto.setLocate_detail(rs.getString("locate_detail"));
	               dto.setCategory(rs.getString("category"));
	               dto.setOpen_hour(rs.getString("open_hour"));
	               dto.setRate(rs.getDouble("rate"));
	               dto.setRecommend(rs.getInt("recommend"));
	               dto.setGarage(rs.getString("garage"));
	               dto.setPhone(rs.getString("phone"));
	               dto.setPhoto1(rs.getString("photo1"));
	               dto.setPhoto2(rs.getString("photo2"));
	               dto.setPhoto3(rs.getString("photo3"));
	               dto.setLink(rs.getString("link"));
	               return dto;
	            }
	         }
	         return null;
	      }
	      
	   }
	   
	   
	   public List<RestBoardDTO> Carousel() throws Exception{
	      String sql = "select * from rest_board order by rate desc";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         
	         try(ResultSet rs = pstat.executeQuery()){
	            List<RestBoardDTO> carousel = new ArrayList<>();
	            for(int i=0; i<3; i++) {
	               if(rs.next()) {
	                  RestBoardDTO dto = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
	                               ,rs.getDouble(7),rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
	                  carousel.add(dto);
	               }
	            }
	            return carousel;
	         }
	         
	      }
	      
	      
	 }
}
