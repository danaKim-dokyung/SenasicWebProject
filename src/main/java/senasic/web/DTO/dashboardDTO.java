package senasic.web.DTO;

import java.sql.Date;

public class dashboardDTO {
	private Date timeline;
	private int countU;
	private int countC;
	private int countR;
	public dashboardDTO(Date timeline, int countU, int countC, int countR) {
		this.timeline = timeline;
		this.countU = countU;
		this.countC = countC;
		this.countR = countR;
	}
	public Date getTimeline() {
		return timeline;
	}
	public void setTimeline(Date timeline) {
		this.timeline = timeline;
	}
	public int getCountU() {
		return countU;
	}
	public void setCountU(int countU) {
		this.countU = countU;
	}
	public int getCountC() {
		return countC;
	}
	public void setCountC(int countC) {
		this.countC = countC;
	}
	public int getCountR() {
		return countR;
	}
	public void setCountR(int countR) {
		this.countR = countR;
	}
	
}
