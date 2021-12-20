package senasic.web.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import senasic.web.DTO.MagazineDTO;

public class MagazineDAO {

	private static MagazineDAO instance = null;
	public static MagazineDAO getInstance() {
		if(instance == null) {
			instance = new MagazineDAO();
		}
		return instance;
	}
	private MagazineDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<MagazineDTO> selectAll() throws Exception{
		String sql = "select * from rest_board";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery()){
			
			List<MagazineDTO> list = new ArrayList<>();
			while(rs.next()) {
				MagazineDTO dto = new MagazineDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setLocate(rs.getString("locate"));
				dto.setLocate_detail(rs.getString("locate_detail"));
				dto.setCategory(rs.getString("category"));
				dto.setOpen_hour(rs.getString("open_hour"));
				dto.setRate(rs.getDouble("rate"));
				dto.setRecommand(rs.getInt("recommand"));
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
