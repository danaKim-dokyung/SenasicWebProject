package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.RcmdDTO;

public class RecDAO {
   private static RecDAO instance;
   public static RecDAO getInstance() {
      if(instance == null) {
         instance = new RecDAO();
      }
      return instance;
   }
   private RecDAO() {}
   private Connection getConnection() throws Exception{
      Context ctx = new InitialContext();
      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
      return ds.getConnection();
   }
   //게시글 클릭시에 게시글 seq,id저장
     public int recinsert(RcmdDTO dto)throws Exception {
         String sql = "insert into rest_rcmd values(?,?)";
         try(Connection con = this.getConnection();
               PreparedStatement pstat = con.prepareStatement(sql);){

            pstat.setInt(1,dto.getRest_seq());
            pstat.setString(2,dto.getId());
           
            int result = pstat.executeUpdate();
            return result;
         }   
      }
     public int recUpdate(int seq) throws Exception{
      String sql = "update rest_board set recommand = (select count(rest_seq) from rest_rcmd where rest_seq=?) where seq=?";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, seq);
         pstat.setInt(2, seq);
         
         int result = pstat.executeUpdate();
         return result;
      }
     }
     
     public int recCheck(int seq, String id) throws Exception{
    	 String sql = "select count(*) from rest_rcmd where rest_seq = ? and id = ?";
    	 try(Connection con = this.getConnection();
    		PreparedStatement pstat = con.prepareStatement(sql);
    			 ){
    		 pstat.setInt(1, seq);
    		 pstat.setString(2, id);
    		 try(ResultSet rs = pstat.executeQuery();){
    			 rs.next();
    			 int result = rs.getInt(1);
    			 return result;
    		 }
    	 }
     }
     
     public int recDelete(int seq, String id) throws Exception{
    	 String sql = "delete from rest_rcmd where rest_seq = ? and id = ?";
    	try(Connection con = this.getConnection();
    		PreparedStatement pstat = con.prepareStatement(sql);
    			){
    		pstat.setInt(1, seq);
    		pstat.setString(2, id);
    		int result = pstat.executeUpdate();
    		return result;
    	}
     }
     
     public int getRecNum(int seq) throws Exception{
    	 String sql = "select recommand from rest_board where seq = ?";
    	 try(Connection con = this.getConnection();
    		PreparedStatement pstat = con.prepareStatement(sql);
    			 ){
    		 pstat.setInt(1, seq);
    		 try(ResultSet rs = pstat.executeQuery();){
    			 rs.next();
    			 int result = rs.getInt(1);
    			 return result;
    		 }
    	 }
     }
}