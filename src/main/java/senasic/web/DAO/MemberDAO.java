package senasic.web.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MemberDTO;

public class MemberDAO {

	// �떛湲��꽩
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
	   //�븘�씠�뵒 以묐났 �솗�씤
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
	   //�땳�꽕�엫 以묐났 �솗�씤
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
	   
	   //�젙蹂� �엯�젰
	   public int insert(MemberDTO dto)throws Exception {
	      String sql = "insert into member values(?,?,?,?,?,?,?,mem_seq.nextval,?)";

	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){

	         pstat.setString(1,dto.getId());
	         pstat.setString(2,dto.getPw());
	         pstat.setString(3,dto.getNn());
	         pstat.setString(4,dto.getM());
	         pstat.setString(5,dto.getPh());
	         pstat.setInt(6,dto.getAge());
	         pstat.setString(7,dto.getGender());
	         pstat.setString(8, dto.getImg());
	         int result = pstat.executeUpdate();
	         return result;
	      }   
	   }
	   //濡쒓렇�씤 �떆�룄 
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
	   //�븘�씠�뵒濡� �젙蹂� �궘�젣
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
	   //�븘�씠�뵒濡� 鍮꾨쾲 李얘린
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
	               dto.setPh(rs.getString("ph"));
	               dto.setAge(rs.getInt("age"));
	               dto.setGender(rs.getString("gender"));
	               dto.setSeq(rs.getInt("seq"));
	               return dto;
	            }
	            return null;
	         }
	      }

	   }


	
	
	
}
