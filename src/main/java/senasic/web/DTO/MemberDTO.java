package senasic.web.DTO;

public class MemberDTO {
	private int seq; 	
	private String id;
	    private String pw;
	    private String nn;
	    private String m;
	    private String ph;
	    private int age;
	    private String gender;
	    public MemberDTO() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    public MemberDTO(String id, String pw, String nn, String m, String ph, int age, String gender, int seq) {
	        super();
	        this.id = id;
	        this.pw = pw;
	        this.nn = nn;
	        this.m = m;
	        this.ph = ph;
	        this.age = age;
	        this.gender = gender;
	        this.seq = seq;
	    }
	    public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public String getId() {
	        return id;
	    }
	    public void setId(String id) {
	        this.id = id;
	    }
	    public String getPw() {
	        return pw;
	    }
	    public void setPw(String pw) {
	        this.pw = pw;
	    }
	    public String getNn() {
	        return nn;
	    }
	    public void setNn(String nn) {
	        this.nn = nn;
	    }
	    public String getM() {
	        return m;
	    }
	    public void setM(String m) {
	        this.m = m;
	    }
	    public String getPh() {
	        return ph;
	    }
	    public void setPh(String ph) {
	        this.ph = ph;
	    }
	    public int getAge() {
	        return age;
	    }
	    public void setAge(int age) {
	        this.age = age;
	    }
	    public String getGender() {
	        return gender;
	    }
	    public void setGender(String gender) {
	        this.gender = gender;
	    }

}
