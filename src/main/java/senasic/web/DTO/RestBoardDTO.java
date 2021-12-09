package senasic.web.DTO;

public class RestBoardDTO {
	private int seq;
	private String title;
	private String locate;
	private String locate_detail;
	private String category;
	private String open_hour;
	private double rate;
	private int recommend;
	private String garage;
	private String phone;
	private String photo1;
	private String photo2;
	private String photo3;
	private String link;

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocate() {
		return locate;
	}
	public void setLocate(String locate) {
		this.locate = locate;
	}
	public String getLocate_detail() {
		return locate_detail;
	}
	public void setLocate_detail(String locate_detail) {
		this.locate_detail = locate_detail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOpen_hour() {
		return open_hour;
	}
	public void setOpen_hour(String open_hour) {
		this.open_hour = open_hour;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getGarage() {
		return garage;
	}
	public void setGarage(String garage) {
		this.garage = garage;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public RestBoardDTO(int seq, String title, String locate, String locate_detail, String category, String open_hour,
			double rate, int recommend, String garage, String phone, String photo1, String photo2, String photo3,
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
