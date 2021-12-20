package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.PetBoardDTO;
import senasic.web.DTO.PetBoard_RelpyDTO;
import senasic.web.DTO.petBoard_recDTO;
import statics.Statics;

public class PetBoardDAO {

	private static PetBoardDAO instance;

	public static PetBoardDAO getInstance() {
		if (instance == null) {
			instance = new PetBoardDAO();
		}
		return instance;
	}

	private PetBoardDAO() {
	}

	// Oracle DB 연결하기
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// 테이블 전체 조회
	public List<PetBoardDTO> selectAll() throws Exception {
		String sql = "select * from pet_board order by seq desc";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

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

	// 글쓰기. board 테이블에 insert
	public int insert(String longinID, String category, String writer, String title, String contents) throws Exception {
		String sql = "insert into pet_board values(?,?,pet_board_seq.nextval,?,?,?,sysdate,default,default,default)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, longinID);
			pstat.setString(2, category);
			pstat.setString(3, writer);
			pstat.setString(4, title);
			pstat.setString(5, contents);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 게시글을 정해진 갯수만큼만 출력
	public List<PetBoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

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

	public int bGood(int id) throws Exception {
		String sql = "update pet_board set good_count = good_count + 1 where seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, id);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 게시글 카테고리 기준으로 정해진만큼만 출력
	public List<PetBoardDTO> selectByCategory(String category_c, int start, int end) throws Exception {
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board where category = ?) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category_c);
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

					PetBoardDTO dto = new PetBoardDTO(id,category, seq, writer, title, contents, write_date, view_count,
							good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 페이징 전체보기.
	private int getRecordCount() throws Exception {
		String sql = "select count(*) from pet_board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public int getPageTotalCount() throws Exception {
		int recordTotalCount = this.getRecordCount();

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

	// 페이지 네비게이터
	public String getPageNavi(int cpage) throws Exception {
		// 총 몇개의 레코드(글)을 가지고 있는지
		int recordTotalCount = this.getRecordCount();

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
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE_PETBOARD * Statics.NAVI_COUNT_PER_PAGE_PETBOARD + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE_PETBOARD - 1;

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

		String pageNavi_str = "";
		if (needPrev) {
			pageNavi_str += "<a href='/list.pet?cpage=" + (startNavi - 1) + "&check_num=2" + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi_str += "<a href='/list.pet?cpage=" + i  + "&check_num=2" + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi_str += "<a href='/list.pet?cpage=" + (endNavi + 1) + "&check_num=2" + "'>></a>";
		}
		
		System.out.println(pageNavi_str);
		
//		List<String> pageNavi = new ArrayList<String>(Arrays.asList(pageNavi_str.split(",")));
		
//		System.out.println(pageNavi.size());
		return pageNavi_str;
	}

	// 페이징 카테고리별
	public int getRecordCountByCategory(String category) throws Exception {
		String sql = "select count(*) from pet_board where category = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 페이징 카테고리별
	public int getPageTotalCountByCategory(String category) throws Exception {
		int recordTotalCount = this.getRecordCountByCategory(category);
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

	// 페이지 네비게이터 (카테고리별)
	public String getPageNaviByCategory(int cpage, String category) throws Exception {
		// 총 몇개의 레코드(글)을 가지고 있는지
		int recordTotalCount = this.getRecordCountByCategory(category);

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
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE_PETBOARD * Statics.NAVI_COUNT_PER_PAGE_PETBOARD + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE_PETBOARD - 1;

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
			pageNavi += "<a href='/category.pet?cpage=" + (startNavi - 1) + "&category=" + category + "&check_num=3" + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/category.pet?cpage=" + i + "&category=" + category + "&check_num=3" + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='/category.pet?cpage=" + (endNavi + 1) + "&category=" + category + "&check_num=3" + "'>></a>";
		}
		return pageNavi;
		
	}

	public List<PetBoardDTO> information(int id_r) throws Exception {
		String sql = "select * from pet_board where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, id_r);
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

	// 조회수 증가
	public int addViewCount(int seq) throws Exception {
		String sql = "update pet_board set view_count = view_count + 1 where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 게시판 삭제
	public int delete(int seq) throws Exception {
		String sql = "delete from pet_board where seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 게시판 검색
	public List<PetBoardDTO> search(String keyword, String searchWord, int start, int end) throws Exception {

//		String sql = "select * from pet_board where " + keyword + " like ? ";
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board where "
				+ keyword + " like ?) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchWord + "%");
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

					PetBoardDTO dto = new PetBoardDTO(id,category, seq, writer, title, contents, write_date, view_count,
							good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 검색
	public int getRecordCountBySearch(String keyword, String searchWord) throws Exception {
		String sql = "select count(*) from pet_board where " + keyword + " like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchWord + "%");

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 검색
	public int getPageTotalCountBySearch(String keyword, String searchWord) throws Exception {
		int recordTotalCount = this.getRecordCountBySearch(keyword, searchWord);
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

	// 검색 네비게이터
	public String getPageNaviBySearch(int cpage, String keyword, String searchWord) throws Exception {
		// 총 몇개의 레코드(글)을 가지고 있는지
		int recordTotalCount = this.getRecordCountBySearch(keyword, searchWord);

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

		// 시작 페이지 구하는 공식
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE_PETBOARD * Statics.NAVI_COUNT_PER_PAGE_PETBOARD + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE_PETBOARD - 1;

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
			pageNavi += "<a href='/search.pet?cpage=" + (startNavi - 1) + "&keyword=" + keyword + "&searchWord="
					+ searchWord + "&check_num=4" + "&check_category=1" +"'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/search.pet?cpage=" + i + "&keyword=" + keyword + "&searchWord=" + searchWord + "&check_num=4" + "&check_category=1" + "'>"
					+ i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='/search.pet?cpage=" + (endNavi + 1) + "&keyword=" + keyword + "&searchWord="
					+ searchWord + "&check_num=4" + "&check_category=1" +"'>></a>";
		}
		System.out.println(pageNavi);
		return pageNavi;

	}

	// 댓글 쓰기
	public int insertReply(int board_seq, String writer, String comments) throws Exception {
		String sql = "insert into pet_board_reply values(pet_board_reply_seq.nextval,?,?,?,sysdate)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, board_seq);
			pstat.setString(2, writer);
			pstat.setString(3, comments);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 댓글 삭제하기
	public int deleteComment(int seq) throws Exception {
		String sql = "delete from pet_board_reply where seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 댓글 불러오기
	public List<PetBoard_RelpyDTO> selectAllReply(int boardSeq) throws Exception {
		String sql = "select * from pet_board_reply where board_seq = ? order by 1";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, boardSeq);
			try (ResultSet rs = pstat.executeQuery();) {

				List<PetBoard_RelpyDTO> list = new ArrayList();

				while (rs.next()) {
					int seq = rs.getInt("seq");
					int board_seq = rs.getInt("board_seq");
					String writer = rs.getString("writer");
					String comments = rs.getString("comments");
					Timestamp write_date = rs.getTimestamp("write_date");

					PetBoard_RelpyDTO dto = new PetBoard_RelpyDTO(seq, board_seq, writer, comments, write_date);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 해당게시물 댓글 수 조회
	public int getCountComment(int seq) throws Exception {
		String sql = "select count(*) from pet_board_reply where board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	// 게시물 댓글수 갱신
	public int updateComment(int seq) throws Exception {
		String sql = "update pet_board set comment_count = (select count(*) from pet_board_reply where board_seq = ?) where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			pstat.setInt(2, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}
	

	// 추천여부 확인
	public int recCheck(int seq, String id) throws Exception {
		String sql = "select count(board_no) from pet_board_ex_rec where board_no = ? and rec_id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				int result = rs.getInt(1);
				return result;
			}
		}
	}

	// 추천한 게시글와 id 저장
	public int recInsert(petBoard_recDTO dto) throws Exception {
		String sql = "insert into pet_board_ex_rec values(?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, dto.getBoard_no());
			pstat.setString(2, dto.getRec_id());

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 추천 취소
	public int recDelete(int seq, String id) throws Exception {
		String sql = "delete from pet_board_ex_rec where board_no = ? and rec_id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 추천수 갱신
	public int recUpdate(int seq) throws Exception {
		String sql = "update pet_board set good_count = (select count(board_no) from pet_board_ex_rec where board_no = ?) where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			pstat.setInt(2, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	// 추천수 가져오기.
	public int getRecNum(int seq) throws Exception {
		String sql = "select good_count from pet_board where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				int result = rs.getInt(1);
				return result;
			}
		}
	}
	
	//게시물 수정
	public int Modify(String category, String title, String contents, int seq) throws Exception {
		String sql = "update pet_board set category = ?, title = ?, contents =  ?, write_date = sysdate where seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category);
			pstat.setString(2, title);
			pstat.setString(3, contents);
			pstat.setInt(4, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	
	
}
