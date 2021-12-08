package senasic.web.dto;

public class RestBoardDTO {
	private int seq;
	private String title;
	private String locate;
	private String locate_detail;
	private String category;
	private String open_hour;
	private int rate;
	private int recommend;
	private String garage;
	private String phone;
	private String photo1;
	private String photo2;
	private String photo3;
	private String link;
	public final int getSeq() {
		return seq;
	}
	public final void setSeq(int seq) {
		this.seq = seq;
	}
	public final String getTitle() {
		return title;
	}
	public final void setTitle(String title) {
		this.title = title;
	}
	public final String getLocate() {
		return locate;
	}
	public final void setLocate(String locate) {
		this.locate = locate;
	}
	public final String getLocate_detail() {
		return locate_detail;
	}
	public final void setLocate_detail(String locate_detail) {
		this.locate_detail = locate_detail;
	}
	public final String getCategory() {
		return category;
	}
	public final void setCategory(String category) {
		this.category = category;
	}
	public final String getOpen_hour() {
		return open_hour;
	}
	public final void setOpen_hour(String open_hour) {
		this.open_hour = open_hour;
	}
	public final int getRate() {
		return rate;
	}
	public final void setRate(int rate) {
		this.rate = rate;
	}
	public final int getRecommend() {
		return recommend;
	}
	public final void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public final String getGarage() {
		return garage;
	}
	public final void setGarage(String garage) {
		this.garage = garage;
	}
	public final String getPhone() {
		return phone;
	}
	public final void setPhone(String phone) {
		this.phone = phone;
	}
	public final String getPhoto1() {
		return photo1;
	}
	public final void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public final String getPhoto2() {
		return photo2;
	}
	public final void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public final String getPhoto3() {
		return photo3;
	}
	public final void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public final String getLink() {
		return link;
	}
	public final void setLink(String link) {
		this.link = link;
	}
	public RestBoardDTO(int seq, String title, String locate, String locate_detail, String category, String open_hour,
			int rate, int recommend, String garage, String phone, String photo1, String photo2, String photo3,
			String link) {
		this.seq = seq;
		this.title = title;
		this.locate = locate;
		this.locate_detail = locate_detail;
		this.category = category;
		this.open_hour = open_hour;
		this.rate = rate;
		this.recommend = recommend;
		this.garage = garage;
		this.phone = phone;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
		this.link = link;
	}
	public RestBoardDTO() {
	}

}
