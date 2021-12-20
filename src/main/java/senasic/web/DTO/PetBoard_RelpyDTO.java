package senasic.web.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PetBoard_RelpyDTO {
	
	private int seq;
	private int board_seq;
	private String writer;
	private String comments;
	private Timestamp write_date;
	
	
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getBoard_seq() {
		return board_seq;
	}


	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public Timestamp getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}


	
	
	
	public PetBoard_RelpyDTO(int seq, int board_seq, String writer, String comments, Timestamp write_date) {
		super();
		this.seq = seq;
		this.board_seq = board_seq;
		this.writer = writer;
		this.comments = comments;
		this.write_date = write_date;
	}
	
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.write_date.getTime());
	}
	
	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.write_date.getTime(); // 글이 작성된 시청의 Timestamp
		
		long time_gap = current_time - write_time;
		
		if(time_gap < 6000) {
			return "1분 이내";
		}else if(time_gap < 300000) {
			return "5분 이내";
		}else if(time_gap < 3600000) {
			return "1시간 이내";
		}else if (time_gap < 7200000) {
			return "2시간 이내";
		}else {
			return getFormdDate();
		}
	}
	
	
	
	
	

}
