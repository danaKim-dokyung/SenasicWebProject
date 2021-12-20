package senasic.web.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MrDTO {
	private int seq;
	private int par_seq;
	private String writer;
	private String contents;
	private String photo;
	private double rate;
	private int recommand;
	private Timestamp write_time;
	private String id;
	private String title;
	
	
	public MrDTO(int seq, int par_seq, String writer, String contents, String photo, double rate, int recommand,
			Timestamp write_time, String id, String title) {
		super();
		this.seq = seq;
		this.par_seq = par_seq;
		this.writer = writer;
		this.contents = contents;
		this.photo = photo;
		this.rate = rate;
		this.recommand = recommand;
		this.write_time = write_time;
		this.id = id;
		this.title = title;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPar_seq() {
		return par_seq;
	}

	public void setPar_seq(int par_seq) {
		this.par_seq = par_seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getRecommand() {
		return recommand;
	}

	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}

	public Timestamp getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Timestamp write_time) {
		this.write_time = write_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.write_time.getTime());
	}
	
	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.write_time.getTime(); // 글이 작성된 시청의 Timestamp
		
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
