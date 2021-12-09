package senasic.web.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MenuDTO;
import senasic.web.DTO.RestBoardDTO;


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
				MenuDTO result = new MenuDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
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
}
