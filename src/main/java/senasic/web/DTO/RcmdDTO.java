package senasic.web.DTO;

public class RcmdDTO {
   private int rest_seq;
   private String id;
   public int getRest_seq() {
      return rest_seq;
   }
   public void setRest_seq(int rest_seq) {
      this.rest_seq = rest_seq;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public RcmdDTO(int rest_seq, String id) {
      super();
      this.rest_seq = rest_seq;
      this.id = id;
   }
   public RcmdDTO() {
      super();
   
   }
}