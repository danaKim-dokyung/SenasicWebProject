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
import senasic.web.DTO.RestReplyDTO;
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
						,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
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
		String sql = "insert into rest_reply values(reply_seq.nextval,?,(select nn from member where id=?),?,?,?,default,default,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.setString(2, writer);
			pstat.setString(3,contents);
			pstat.setString(4, photo);
			pstat.setDouble(5, rate);
			pstat.setString(6, writer);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	//전체
	public int getRestCount() throws Exception{
		String sql = "select count(*) from Rest_board";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			rs.next();
			return rs.getInt(1);
		}
	}
	//검색
	public int getRestCount(String target) throws Exception{
		String sql ="select count(*) from Rest_board where title like ? or locate like ? or locate_detail like ? or category = ?";			
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
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
	
	public int getRestCount(String type, String target) throws Exception{
		String sql = "";
		if(type.equals("category")) {
			sql = "select count(*) from Rest_board where category like ?";			
		}
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, target);

			try(ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);

			}
		}
	}
	//일반
	public int getPageTotalCount() throws Exception{

		int restTotalCount = this.getRestCount(); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
		int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.

		if(restTotalCount % Statics.REST_COUNT_PER_PAGE == 0) {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE;
		}else {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE + 1; //
		}
		return pageTotalCount;
	}
	
	//검색
	public int getPageTotalCount(String target) throws Exception{

		int restTotalCount = this.getRestCount(target); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
		int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.

		if(restTotalCount % Statics.REST_COUNT_PER_PAGE == 0) {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE;
		}else {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE + 1; //
		}
		
		return pageTotalCount;
	}
	
	public int getPageTotalCount(String type, String target) throws Exception{

		int restTotalCount = this.getRestCount(type, target); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
		int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.

		if(restTotalCount % Statics.REST_COUNT_PER_PAGE == 0) {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE;
		}else {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE + 1; //
		}
		System.out.println(restTotalCount);
		System.out.println(pageTotalCount);
		
		return pageTotalCount;
	}

	public List getPageNavi(int currentPage) throws Exception{

		int restTotalCount = this.getRestCount(); // �쁽�옱 珥� 紐뉕컻�쓽 寃뚯떆湲� �엳�뒗吏�

		int pageTotalCount =0; // �럹�씠吏� 珥� 媛��닔
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

	public List getPageNavi(int currentPage,String type, String target) throws Exception{

		int restTotalCount = this.getRestCount(type, target); // �쁽�옱 珥� 紐뉕컻�쓽 寃뚯떆湲� �엳�뒗吏�

		int pageTotalCount =0; // �럹�씠吏� 珥� 媛��닔
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
							,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public List<RestBoardDTO> selectByCategory(String category, int start, int end)throws Exception{
		String sql = "select * from (select Rest_board.* , row_number() over(order by seq desc) rn from Rest_board where category = ?)where rn between ? and ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, category);
			pstat.setInt(2, start);
			pstat.setInt(3, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<RestBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					RestBoardDTO dto = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
							,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
					list.add(dto);
				}
				
				return list;
			}
		}
	}

	public List<RestBoardDTO> selectBySearch(String target, int start, int end)throws Exception{
		String sql = "select * from (select Rest_board.* , row_number() over(order by seq desc) rn from Rest_board where title like ? or locate like ? or locate_detail like ? or category like ?)where rn between ? and ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+target+"%");
			pstat.setString(2, "%"+target+"%");
			pstat.setString(3, "%"+target+"%");
			pstat.setString(4, "%"+target+"%");
			pstat.setInt(5, start);
			pstat.setInt(6, end);
			try(ResultSet rs = pstat.executeQuery()){
				List<RestBoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					RestBoardDTO dto = new RestBoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)
							,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
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
								,Math.round(rs.getDouble(7)*100)/100.0,rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
						carousel.add(dto);
					}
				}
				return carousel;
			}

		}
	}



	public List<RestReplyDTO> listReply(int seq,int start, int end) throws Exception{
		String sql = "select * from (select Rest_reply.* , row_number() over(order by write_time desc) rn from Rest_reply where par_seq = ?)where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			try(ResultSet rs = pstat.executeQuery()){
				List<RestReplyDTO> list = new ArrayList();
				while(rs.next()) {
					RestReplyDTO dto = new RestReplyDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getInt(7),rs.getTimestamp(8),rs.getString(9));
					list.add(dto);
				}
				return list;
			}
		}
	}

	public int updateRate(int seq) throws Exception{
		String sql = "update rest_board set rate = (select avg(rate) from rest_reply where par_seq = ?) where seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.setInt(2, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int getRestReviewCount(int seq) throws Exception{
		String sql = "select count(*) from rest_reply where par_seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){


				rs.next();
				return rs.getInt(1);
			}
		}
	}

	public int getReviewPageTotalCount(int seq) throws Exception{

		int restTotalCount = this.getRestReviewCount(seq); // �쁽�옱 珥� 寃뚯떆湲� 紐뉕컻�엳�뒗吏�
		int pageTotalCount = 0; // 珥� 紐뉕컻�쓽 �럹�씠吏� 留뚮뱾�뼱吏� 寃껋씤吏�.

		if(restTotalCount % Statics.REST_COUNT_PER_PAGE == 0) {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE;
		}else {
			pageTotalCount = restTotalCount / Statics.REST_COUNT_PER_PAGE + 1; //
		}
		return pageTotalCount;
	}

	public List getReviewPageNavi(int currentPage, int seq) throws Exception{

		int restTotalCount = this.getRestReviewCount(seq); // �쁽�옱 珥� 紐뉕컻�쓽 寃뚯떆湲� �엳�뒗吏�

		int pageTotalCount =0; // �럹�씠吏� 珥� 媛��닔
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

	public int reviewN(int seq) throws Exception{
		String sql = "select count(*) from rest_reply where par_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				int result = rs.getInt(1);
				return result;
			}
		}
	}
	
	public int delReview(int seq) throws Exception{
		String sql = "delete from rest_reply where seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
