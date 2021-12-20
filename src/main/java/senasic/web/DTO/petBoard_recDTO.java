package senasic.web.DTO;

public class petBoard_recDTO {
	private int board_no;
	private String rec_id;
	
	
	public petBoard_recDTO(int board_no, String rec_id) {
		super();
		this.board_no = board_no;
		this.rec_id = rec_id;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getRec_id() {
		return rec_id;
	}
	public void setRec_id(String rec_id) {
		this.rec_id = rec_id;
	}
	
}
