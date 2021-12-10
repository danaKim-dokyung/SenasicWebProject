package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	private static AdminDAO instance;
	public static AdminDAO getInstance() {
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}
	private AdminDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int writeRest(String title,String loc, String loc_detail, String ctg, String hour, String garage, String phone, String ph1, String ph2, String ph3,String link) throws Exception{
		String sql = "insert into rest_board values(rest_board_seq.nextval,?,?,?,?,?,default,default,?,?,?,?,?,?)";
		//시퀀스명 확인
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setString(1, title);
			pstat.setString(2, loc);
			pstat.setString(3, loc_detail);
			pstat.setString(4, ctg);
			pstat.setString(5, hour);
			
			pstat.setString(6, garage);
			pstat.setString(7, phone);
			pstat.setString(8, ph1);
			pstat.setString(9, ph2);
			pstat.setString(10, ph3);
			pstat.setString(11, link);			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int insertMenu(String title, String m1,int p1, String m2, int p2, String m3, int p3) throws Exception{
		String sql = "insert into menu values(?,?,?,?,?,?,?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			){
			pstat.setString(1, title);
			pstat.setString(2, m1);
			pstat.setInt(3, p1);
			pstat.setString(4, m2);
			pstat.setInt(5, p2);
			pstat.setString(6, m3);
			pstat.setInt(7, p3);
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
