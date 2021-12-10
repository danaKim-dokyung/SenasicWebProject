package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
         String sql = "insert into member values(?,?)";
         try(Connection con = this.getConnection();
               PreparedStatement pstat = con.prepareStatement(sql);){

            pstat.setString(1,dto.getId());
            pstat.setInt(2,dto.getRest_seq());
           
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
         con.commit();
         return result;
      }
     }
}