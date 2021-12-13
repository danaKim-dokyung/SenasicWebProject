package senasic.web.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PetBoardDTO {
	
	private String category;
	private int seq;
	private String writer;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	private int good_count;
	private int comment_count;
	
	
	
	public PetBoardDTO(String category, int seq, String writer, String title, String contents, Timestamp write_date,
			int view_count, int good_count, int comment_count) {
		super();
		this.category = category;
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
		this.good_count = good_count;
		this.comment_count = comment_count;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public Timestamp getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}


	public int getView_count() {
		return view_count;
	}


	public void setView_count(int view_count) {
		this.view_count = view_count;
	}


	public int getGood_count() {
		return good_count;
	}


	public void setGood_count(int good_count) {
		this.good_count = good_count;
	}


	public int getComment_count() {
		return comment_count;
	}


	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}


	
	
	
	
	
	
	
	// 날자 형식 변환
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
