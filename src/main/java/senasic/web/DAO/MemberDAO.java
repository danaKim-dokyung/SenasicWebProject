package senasic.web.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MemberDTO;

public class MemberDAO {

	// 싱글턴
	   private static MemberDAO instance = null;
	   public static MemberDAO getInstance() {
	      if(instance == null) {
	         instance = new MemberDAO();
	      }
	      return instance;
	   }
	   private MemberDAO() {}
	   

	   private Connection getConnection() throws Exception{
	      Context ctx = new InitialContext();
	      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	      return ds.getConnection();
	   }
	   //아이디 중복 확인
	   public boolean isIdExist(String id) throws Exception{
	      String sql = "select * from member where id=?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, id);
	         try(ResultSet rs = pstat.executeQuery()){
	            return rs.next();
	         }
	      }
	   }
	   //닉네임 중복 확인
	   public boolean isNicknameExist(String nn) throws Exception{
	      String sql = "select * from member where nn=?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, nn);
	         try(ResultSet rs = pstat.executeQuery()){
	            return rs.next();
	         }
	      }
	   }	   
	   
	   //정보 입력
	   public int insert(MemberDTO dto)throws Exception {
	      String sql = "insert into member values(?,?,?,?,?,?,?)";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){

	         pstat.setString(1,dto.getId());
	         pstat.setString(2,dto.getPw());
	         pstat.setString(3,dto.getNn());
	         pstat.setString(4,dto.getM());
	         pstat.setInt(5,dto.getPh());
	         pstat.setString(6,dto.getAge());
	         pstat.setString(7,dto.getGender());
	         int result = pstat.executeUpdate();
	         return result;
	      }   
	   }
	   //로그인 시도 
	   public boolean isLoginAllowed(String id, String pw) throws Exception{
	      String sql = "select * from member where id = ? and pw = ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){         
	         pstat.setString(1, id);
	         pstat.setString(2, pw);
	         try(ResultSet rs = pstat.executeQuery()){
	            return rs.next();
	         }
	      }
	   }
	   //아이디로 정보 삭제
	   public int delete(String id) throws Exception{
	      String sql = "delete from member where id = ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, id);
	         int result = pstat.executeUpdate();
	         con.commit();
	         return result;
	      }
	   }
	   //아이디로 비번 찾기
	   public MemberDTO selectById(String paramId) throws Exception{
	      String sql = "select * from member where id = ?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql)){
	         pstat.setString(1, paramId);
	         try(ResultSet rs = pstat.executeQuery()){

	            MemberDTO dto = new MemberDTO();
	            if(rs.next()) {
	               dto.setId(rs.getString("id"));
	               dto.setPw(rs.getString("pw"));
	               dto.setNn(rs.getString("nn"));
	               dto.setM(rs.getString("m"));
	               dto.setPh(rs.getInt("ph"));
	               dto.setAge(rs.getString("age"));
	               dto.setGender(rs.getString("gender"));
	               return dto;
	            }
	            return null;
	         }
	      }

	   }


	
	
	
}
