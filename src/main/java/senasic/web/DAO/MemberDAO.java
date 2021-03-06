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

public class MemberDAO {

	// �떛湲��꽩

	private static MemberDAO instance = null;

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private MemberDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// �븘�씠�뵒 以묐났 �솗�씤
	public boolean isIdExist(String id) throws Exception {
		String sql = "select * from member where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}

	// �땳�꽕�엫 以묐났 �솗�씤
	public boolean isNicknameExist(String nn) throws Exception {
		String sql = "select * from member where nn=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, nn);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}

	// �젙蹂� �엯�젰
	public int insert(MemberDTO dto) throws Exception {

		String sql = "insert into member values(?,?,?,?,?,?,?,mem_seq.nextval,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getNn());
			pstat.setString(4, dto.getM());
			pstat.setString(5, dto.getPh());
			pstat.setInt(6, dto.getAge());
			pstat.setString(7, dto.getGender());
			if (dto.getImg() == null) {
				pstat.setString(8,
						"https://www.mountsinai.on.ca/wellbeing/our-team/team-images/person-placeholder/image_preview");
			} else {
				pstat.setString(8, dto.getImg());
			}

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 濡쒓렇�씤 �떆�룄
	public boolean isLoginAllowed(String id, String pw) throws Exception {
		String sql = "select * from member where id = ? and pw = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}

	// �븘�씠�뵒濡� �젙蹂� �궘�젣
	public int delete(String id) throws Exception {
		String sql = "delete from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// �븘�씠�뵒濡� 鍮꾨쾲 李얘린
	public MemberDTO selectById(String paramId) throws Exception {
		String sql = "select * from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, paramId);
			try (ResultSet rs = pstat.executeQuery()) {

				MemberDTO dto = new MemberDTO();
				if (rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setNn(rs.getString("nn"));
					dto.setM(rs.getString("m"));
					dto.setPh(rs.getString("ph"));
					dto.setAge(rs.getInt("age"));
					dto.setGender(rs.getString("gender"));
					dto.setSeq(rs.getInt("seq"));
					dto.setImg(rs.getString("photo"));
					return dto;
				}
				return null;
			}
		}

	}

	// 아이디 찾기
	public MemberDTO selectByMail(String paramM, String paramPh) throws Exception {
		String sql = "select * from member where m  = ? and ph = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, paramM);
			pstat.setString(2, paramPh);
			try (ResultSet rs = pstat.executeQuery()) {

				MemberDTO dto = new MemberDTO();
				if (rs.next()) {
					dto.setId(rs.getString("id"));

				}
				System.out.println("여기" + dto.getId());
				return dto;
			}
		}

	}

	// 비밀번호 찾기
	public MemberDTO selectByFindPw(String paramid, String parammm) throws Exception {
		String sql = "select * from member where id  = ? and m = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, paramid);
			pstat.setString(2, parammm);
			try (ResultSet rs = pstat.executeQuery()) {

				MemberDTO dto = new MemberDTO();
				if (rs.next()) {
					dto.setPw(rs.getString("pw"));
					return dto;
				}
				return null;
			}
		}

	}

	public int changePw(String id, String pw) throws Exception {

		String sql = "update member set pw = ? where id = ? ";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, pw);
			pstat.setString(2, id);

			int result = pstat.executeUpdate();
			return result;
		}

	}

	// 회원 정보 불러오기
	public List<MemberDTO> selectById_list(String paramId) throws Exception {
		String sql = "select * from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, paramId);
			try (ResultSet rs = pstat.executeQuery()) {

				List<MemberDTO> list = new ArrayList();
				if (rs.next()) {

					int seq = rs.getInt("seq");
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String nn = rs.getString("nn");
					String m = rs.getString("m");
					String ph = rs.getString("ph");
					int age = rs.getInt("age");
					String gender = rs.getString("gender");
					String photo = rs.getString("photo");

					MemberDTO dto = new MemberDTO(id, pw, nn, m, ph, age, gender, seq, photo);

					list.add(dto);

				}
				return list;
			}
		}
	}

	// 회원 정보 수정
	public int modify(String pw, String nickname, String email, String phone, String id) throws Exception {
		String sql = "update member set pw=?,nn=?,m=?,ph=? where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, pw);
			pstat.setString(2, nickname);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			pstat.setString(5, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	// 회원 정보 수정
	public int modify(String pw, String nickname, String email, String phone, String id, String photo)
			throws Exception {
		String sql = "update member set pw=?,nn=?,m=?,ph=?, photo=? where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, pw);
			pstat.setString(2, nickname);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			pstat.setString(5, photo);
			pstat.setString(6, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

// 회원탈퇴
	public int deleteMember(int seq) throws Exception {
		String sql = "delete from member where seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}

}
