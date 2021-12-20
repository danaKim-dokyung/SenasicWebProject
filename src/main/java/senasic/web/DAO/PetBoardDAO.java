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

	// Oracle DB �뿰寃고븯湲�
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// �뀒�씠釉� �쟾泥� 議고쉶
	public List<PetBoardDTO> selectAll() throws Exception {
		String sql = "select * from pet_board order by seq desc";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			List<PetBoardDTO> list = new ArrayList();

			while (rs.next()) {
				String category = rs.getString("category");
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");
				int good_count = rs.getInt("good_count");
				int comment_count = rs.getInt("comment_count");

				PetBoardDTO dto = new PetBoardDTO(category, seq, writer, title, contents, write_date, view_count,
						good_count, comment_count);
				list.add(dto);
			}
			return list;
		}
	}

	//insert
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


	// 寃뚯떆湲��쓣 �젙�빐吏� 媛��닔留뚰겮留� 異쒕젰
	public List<PetBoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try (ResultSet rs = pstat.executeQuery();) {
				List<PetBoardDTO> list = new ArrayList();

				while (rs.next()) {
					String category = rs.getString("category");
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					int good_count = rs.getInt("good_count");
					int comment_count = rs.getInt("comment_count");

					PetBoardDTO dto = new PetBoardDTO(category, seq, writer, title, contents, write_date, view_count,
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

	// 寃뚯떆湲� 移댄뀒怨좊━ 湲곗��쑝濡� �젙�빐吏꾨쭔�겮留� 異쒕젰
	public List<PetBoardDTO> selectByCategory(String category_c, int start, int end) throws Exception {
		String sql = "select * from (select pet_board.*,row_number() over(order by seq desc) rn from pet_board where category = ?) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category_c);
			pstat.setInt(2, start);
			pstat.setInt(3, end);

			try (ResultSet rs = pstat.executeQuery();) {
				List<PetBoardDTO> list = new ArrayList();

				while (rs.next()) {
					String category = rs.getString("category");
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					int good_count = rs.getInt("good_count");
					int comment_count = rs.getInt("comment_count");

					PetBoardDTO dto = new PetBoardDTO(category, seq, writer, title, contents, write_date, view_count,
							good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// �럹�씠吏� �쟾泥대낫湲�.
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

		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// �럹�씠吏� �꽕鍮꾧쾶�씠�꽣
	public String getPageNavi(int cpage) throws Exception {
		// 珥� 紐뉕컻�쓽 �젅肄붾뱶(湲�)�쓣 媛�吏�怨� �엳�뒗吏�
		int recordTotalCount = this.getRecordCount();

		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// �쁽�옱 �럹�씠吏�
		int currentPage = cpage;

		// �샊�떆�씪�룄 �쁽�옱�럹�씠吏�媛� 1�럹�씠吏�蹂대떎 �옉�쑝硫� 1濡� 留뚮뱾�뼱�씪, �쁽�옱�럹�씠吏�媛� �넗�떖 移댁슫�듃 蹂대떎 �겕硫� �쁽�옱�럹�씠吏��뒗 �넗�깉移댁슫�듃 �럹�씠吏�濡�.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// �떆�옉 �럹�씠吏� 援ы븯�뒗 怨듭떇!!!!!!
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 怨듭떇�뿉 �쓽�빐 諛쒖깮�븳 endnavi 媛믪씠 �떎�젣 �럹�씠吏� �쟾泥� 媛쒖닔蹂대떎 �겢寃쎌슦
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
			pageNavi_str += "<a href='/list.pet?cpage=" + (startNavi - 1) + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi_str += "<a href='/list.pet?cpage=" + i + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi_str += "<a href='/list.pet?cpage=" + (endNavi + 1) + "'>></a>";
		}
		
//		List<String> pageNavi = new ArrayList<String>(Arrays.asList(pageNavi_str.split(",")));
		
//		System.out.println(pageNavi.size());
		return pageNavi_str;
	}

	// �럹�씠吏� 移댄뀒怨좊━蹂�
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

	// �럹�씠吏� 移댄뀒怨좊━蹂�
	public int getPageTotalCountByCategory(String category) throws Exception {
		int recordTotalCount = this.getRecordCountByCategory(category);
		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// �럹�씠吏� �꽕鍮꾧쾶�씠�꽣 (移댄뀒怨좊━蹂�)
	public String getPageNaviByCategory(int cpage, String category) throws Exception {
		// 珥� 紐뉕컻�쓽 �젅肄붾뱶(湲�)�쓣 媛�吏�怨� �엳�뒗吏�
		int recordTotalCount = this.getRecordCountByCategory(category);

		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// �쁽�옱 �럹�씠吏�
		int currentPage = cpage;

		// �샊�떆�씪�룄 �쁽�옱�럹�씠吏�媛� 1�럹�씠吏�蹂대떎 �옉�쑝硫� 1濡� 留뚮뱾�뼱�씪, �쁽�옱�럹�씠吏�媛� �넗�떖 移댁슫�듃 蹂대떎 �겕硫� �쁽�옱�럹�씠吏��뒗 �넗�깉移댁슫�듃 �럹�씠吏�濡�.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// �떆�옉 �럹�씠吏� 援ы븯�뒗 怨듭떇!!!!!!
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 怨듭떇�뿉 �쓽�빐 諛쒖깮�븳 endnavi 媛믪씠 �떎�젣 �럹�씠吏� �쟾泥� 媛쒖닔蹂대떎 �겢寃쎌슦
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
			pageNavi += "<a href='/category.pet?cpage=" + (startNavi - 1) + "&category=" + category + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/category.pet?cpage=" + i + "&category=" + category + "'>" + i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='/category.pet?cpage=" + (endNavi + 1) + "&category=" + category + "'>></a>";
		}
		return pageNavi;
		
	}

	public List<PetBoardDTO> information(int id) throws Exception {
		String sql = "select * from pet_board where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, id);
			try (ResultSet rs = pstat.executeQuery();) {

				List<PetBoardDTO> list = new ArrayList();

				while (rs.next()) {
					String category = rs.getString("category");
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					int good_count = rs.getInt("good_count");
					int comment_count = rs.getInt("comment_count");

					PetBoardDTO dto = new PetBoardDTO(category, seq, writer, title, contents, write_date, view_count,
							good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 議고쉶�닔 利앷�
	public int addViewCount(int seq) throws Exception {
		String sql = "update pet_board set view_count = view_count + 1 where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 寃뚯떆�뙋 �궘�젣
	public int delete(int seq) throws Exception {
		String sql = "delete from pet_board where seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 寃뚯떆�뙋 寃��깋
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
					String category = rs.getString("category");
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					int good_count = rs.getInt("good_count");
					int comment_count = rs.getInt("comment_count");

					PetBoardDTO dto = new PetBoardDTO(category, seq, writer, title, contents, write_date, view_count,
							good_count, comment_count);
					list.add(dto);
				}
				return list;
			}
		}
	}

	// 寃��깋
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

	// 寃��깋
	public int getPageTotalCountBySearch(String keyword, String searchWord) throws Exception {
		int recordTotalCount = this.getRecordCountBySearch(keyword, searchWord);
		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	// 寃��깋 �꽕鍮꾧쾶�씠�꽣
	public String getPageNaviBySearch(int cpage, String keyword, String searchWord) throws Exception {
		// 珥� 紐뉕컻�쓽 �젅肄붾뱶(湲�)�쓣 媛�吏�怨� �엳�뒗吏�
		int recordTotalCount = this.getRecordCountBySearch(keyword, searchWord);

		// 珥� �럹�씠吏��쓽 媛쒖닔
		int pageTotalCount = 0;

		// �럹�씠吏�媛� �뵳 �뼥�뼱吏�硫� �럹�씠吏� 異붽��븷 �븘�슂 �뾾�쓬 ex)100媛� 湲� �굹�늻湲� 10 = 10媛쒖쓽 �럹�씠吏�
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
			// �럹�씠吏�媛� �뵳 �뼥�뼱吏�吏� �븡�쑝硫� 1�쓣 �뜑�빐�꽌 �럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�씪
		} else {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}

		// �쁽�옱 �럹�씠吏�
		int currentPage = cpage;

		// �샊�떆�씪�룄 �쁽�옱�럹�씠吏�媛� 1�럹�씠吏�蹂대떎 �옉�쑝硫� 1濡� 留뚮뱾�뼱�씪, �쁽�옱�럹�씠吏�媛� �넗�떖 移댁슫�듃 蹂대떎 �겕硫� �쁽�옱�럹�씠吏��뒗 �넗�깉移댁슫�듃 �럹�씠吏�濡�.
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		// �떆�옉 �럹�씠吏� 援ы븯�뒗 怨듭떇
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 怨듭떇�뿉 �쓽�빐 諛쒖깮�븳 endnavi 媛믪씠 �떎�젣 �럹�씠吏� �쟾泥� 媛쒖닔蹂대떎 �겢寃쎌슦
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
					+ searchWord + "'><</a>,";
		}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/search.pet?cpage=" + i + "&keyword=" + keyword + "&searchWord=" + searchWord + "'>"
					+ i + "</a>,";
		}

		if (needNext) {
			pageNavi += "<a href='/search.pet?cpage=" + (endNavi + 1) + "&keyword=" + keyword + "&searchWord="
					+ searchWord + "'>></a>";
		}
		return pageNavi;

	}

	// �뙎湲� �벐湲�
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

	// �뙎湲� �궘�젣�븯湲�
	public int deleteComment(int seq) throws Exception {
		String sql = "delete from pet_board_reply where seq=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// �뙎湲� 遺덈윭�삤湲�
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

	// �빐�떦寃뚯떆臾� �뙎湲� �닔 議고쉶
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
	
	// 寃뚯떆臾� �뙎湲��닔 媛깆떊
	public int updateComment(int seq) throws Exception {
		String sql = "update pet_board set comment_count = (select count(*) from pet_board_reply where board_seq = ?) where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			pstat.setInt(2, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}
	

	// 異붿쿇�뿬遺� �솗�씤
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

	// 異붿쿇�븳 寃뚯떆湲��� id ���옣
	public int recInsert(petBoard_recDTO dto) throws Exception {
		String sql = "insert into pet_board_ex_rec values(?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, dto.getBoard_no());
			pstat.setString(2, dto.getRec_id());

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 異붿쿇 痍⑥냼
	public int recDelete(int seq, String id) throws Exception {
		String sql = "delete from pet_board_ex_rec where board_no = ? and rec_id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 異붿쿇�닔 媛깆떊
	public int recUpdate(int seq) throws Exception {
		String sql = "update pet_board set good_count = (select count(board_no) from pet_board_ex_rec where board_no = ?) where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			pstat.setInt(2, seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	// 異붿쿇�닔 媛��졇�삤湲�.
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
	
	//寃뚯떆臾� �닔�젙
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
