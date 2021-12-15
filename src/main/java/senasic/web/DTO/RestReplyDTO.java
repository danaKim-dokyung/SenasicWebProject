package senasic.web.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class RestReplyDTO {
	private int seq;
	private int par_seq;
	private String writer;
	private String contents;
	private String photo;
	private double rate;
	private int recommand;
	private Timestamp time;
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public RestReplyDTO(int seq, int par_seq, String writer, String contents, String photo, double rate,
			int recommand, Timestamp time, String id) {
		this.seq = seq;
		this.par_seq = par_seq;
		this.writer = writer;
		this.contents = contents;
		this.photo = photo;
		this.rate = rate;
		this.recommand = recommand;
		this.time = time;
		this.id = id;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
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
	public RestReplyDTO() {
	}
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.time.getTime());
	}
	
}
