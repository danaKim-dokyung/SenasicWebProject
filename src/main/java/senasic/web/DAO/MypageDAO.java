package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MrDTO;
import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.RestBoardDTO;
import statics.Statics;

public class MypageDAO {

	private static MypageDAO instance;

	public static MypageDAO getInstance() {
		if (instance == null) {
			instance = new MypageDAO();
		}
		return instance;
	}

	private MypageDAO() {
	}

	// Oracle DB 연결하기
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public List<PetBoardDTO> selectByLoginID(String loginID, int start, int end) throws Exception {
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board where id = ?) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, loginID);
			pstat.setInt(2, start);
			pstat.setInt(3, end);

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

					PetBoardDTO dto = new PetBoardDTO(id, category, seq, writer, title, contents, write_date,
							view_count, good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 페이징 (내가쓴 글)
	public int getRecordCountByLoginID(String loginID) throws Exception {
		String sql = "select count(*) from pet_board where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, loginID);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 페이징 (내가쓴 글)
	public int getPageTotalCountByLoginID(String loginID) throws Exception {
		int recordTotalCount = this.getRecordCountByLoginID(loginID);
		// 총 페이지의 개수
		int pageTotalCount = 0;

		// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// 페이지 네비게이터 (내가쓴 글)
	public String getPageNaviByLoginID(int cpage, String loginID) throws Exception {
		// 총 몇개의 레코드(글)을 가지고 있는지
		int recordTotalCount = this.getRecordCountByLoginID(loginID);

		// 총 페이지의 개수
		int pageTotalCount = 0;

		// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// 현재 페이지
		int currentPage = cpage;

		// 혹시라도 현재페이지가 1페이지보다 작으면 1로 만들어라, 현재페이지가 토달 카운트 보다 크면 현재페이지는 토탈카운트 페이지로.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 시작 페이지 구하는 공식!!!!!!
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE_MYPAGE * Statics.NAVI_COUNT_PER_PAGE_MYPAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE_MYPAGE - 1;

		// 공식에 의해 발생한 endnavi 값이 실제 페이지 전체 개수보다 클경우
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if (needPrev) {
			pageNavi += "<a href='pet_board.my?cpage=" + (startNavi - 1) + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='pet_board.my?cpage=" + i + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='pet_board.my?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;

	}

	// ID로 댓글 리스트 뽑아오기

//		public List<RestReplyDTO> reviewByLoginID(String loginID, int start, int end) throws Exception {
//			String sql = "select * from (select rest_reply.*,row_number() over(order by seq desc) rn from rest_reply where id like ?) where rn between ? and ?";
//			try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//				pstat.setString(1, loginID);
//				pstat.setInt(2, start);
//				pstat.setInt(3, end);
//
//				try (ResultSet rs = pstat.executeQuery();) {
//					List<RestReplyDTO> list = new ArrayList();
//					
//					while (rs.next()) {
//						
//						int seq = rs.getInt("seq");
//						int par_seq = rs.getInt("par_seq");
//						String writer = rs.getString("writer");
//						String contents = rs.getString("contents");
//						String photo = rs.getString("photo");
//						double rate = rs.getDouble("rate");
//						int recommand = rs.getInt("recommand");
//						Timestamp time = rs.getTimestamp("write_time");
//						String id = rs.getString("id");
//
//						RestReplyDTO dto = new RestReplyDTO(seq, par_seq, writer, contents, photo, rate, recommand, time, id);
//						list.add(dto);
//						
//					}
//					return list;
//				}
//			}
//		}

	// Test
	public List<MrDTO> reviewByLoginID(String loginID, int start, int end) throws Exception {
		String sql = "select * from (select r.*,b.title,row_number() over(order by r.seq desc) rn from rest_reply r join rest_board b on(r.par_seq = b.seq) where id = ?) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, loginID);
			pstat.setInt(2, start);
			pstat.setInt(3, end);

			try (ResultSet rs = pstat.executeQuery();) {
				List<MrDTO> list = new ArrayList();

				while (rs.next()) {

					int seq = rs.getInt("seq");
					int par_seq = rs.getInt("par_seq");
					String writer = rs.getString("writer");
					String contents = rs.getString("contents");
					String photo = rs.getString("photo");
					double rate = rs.getDouble("rate");
					int recommand = rs.getInt("recommand");
					Timestamp time = rs.getTimestamp("write_time");
					String id = rs.getString("id");
					String title = rs.getString("title");

					MrDTO dto = new MrDTO(seq, par_seq, writer, contents, photo, rate, recommand, time, id, title);
					list.add(dto);

				}
				return list;
			}
		}
	}

	// 댓글 페이징

	// 페이징 (내가쓴 리뷰)
	public int getReviewCountByLoginID(String loginID) throws Exception {
		String sql = "select count(*) from rest_reply where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, loginID);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 페이징 (내가쓴 리뷰)
	public int getReviewTotalCountByLoginID(String loginID) throws Exception {
		int recordTotalCount = this.getReviewCountByLoginID(loginID);

		// 총 페이지의 개수
		int pageTotalCount = 0;

		// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// 페이지 네비게이터 (내가쓴 리뷰)
	public String getReviewNaviByLoginID(int cpage, String loginID) throws Exception {
		// 총 몇개의 레코드(글)을 가지고 있는지
		int recordTotalCount = this.getReviewCountByLoginID(loginID);

		System.out.println(recordTotalCount);

		// 총 페이지의 개수
		int pageTotalCount = 0;

		// 페이지가 딱 떨어지면 페이지 추가할 필요 없음 ex)100개 글 나누기 10 = 10개의 페이지
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// 페이지가 딱 떨어지지 않으면 1을 더해서 페이지를 하나 더 만들어라
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// 현재 페이지
		int currentPage = cpage;

		// 혹시라도 현재페이지가 1페이지보다 작으면 1로 만들어라, 현재페이지가 토달 카운트 보다 크면 현재페이지는 토탈카운트 페이지로.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// 시작 페이지 구하는 공식!!!!!!
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE_MYPAGE * Statics.NAVI_COUNT_PER_PAGE_MYPAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE_MYPAGE - 1;

		// 공식에 의해 발생한 endnavi 값이 실제 페이지 전체 개수보다 클경우
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if (needPrev) {
			pageNavi += "<a href='my_review.my?cpage=" + (startNavi - 1) + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='my_review.my?cpage=" + i + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='my_review.my?cpage=" + (endNavi + 1) + "'>></a>";
		}
		return pageNavi;

	}

	// review 삭제하기
	public int deleteReview(int seq) throws Exception {
		String sql = "delete from rest_reply where seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 식당 정보 가져오기

	public List<RestBoardDTO> getRestInformation(int[] arr) throws Exception {
		String sql = "select * from rest_board where seq in (?,?,?,?,?,?,?,?,?,?) order by rate desc";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			
			for(int i = 0; i < arr.length; i ++) {
				pstat.setInt(i+1, arr[i]);
			}
			
			try (ResultSet rs = pstat.executeQuery();) {
				List<RestBoardDTO> list = new ArrayList();

				while (rs.next()) {
					RestBoardDTO dto = new RestBoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setLocate(rs.getString("locate"));
					dto.setLocate_detail(rs.getString("locate_detail"));
					dto.setCategory(rs.getString("category"));
					dto.setOpen_hour(rs.getString("open_hour"));
					dto.setRate(rs.getDouble("rate"));
					dto.setRecommend(rs.getInt("recommand"));
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
	}
	
	// 게시판 삭제
    public int delete_board(int seq) throws Exception {
        String sql = "delete from pet_board where seq=?";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, seq);

            int result = pstat.executeUpdate();
            return result;
        }
    }

}
