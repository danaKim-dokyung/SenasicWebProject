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
	private String photo;
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
	public final String getPhoto() {
		return photo;
	}
	public final void setPhoto(String photo) {
		this.photo = photo;
	}
	public final String getLink() {
		return link;
	}
	public final void setLink(String link) {
		this.link = link;
	}
	public RestBoardDTO(int seq, String title, String locate, String locate_detail, String category, String open_hour,
			int rate, int recommend, String garage, String phone, String photo, String link) {
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
		this.photo = photo;
		this.link = link;
	}
	public RestBoardDTO() {
	}

}
