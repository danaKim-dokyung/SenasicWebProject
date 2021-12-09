package senasic.web.DTO;

public class MenuDTO {
	private String shop;
	private String menu1;
	private String menu2;
	private String menu3;
	public final String getShop() {
		return shop;
	}
	public final void setShop(String shop) {
		this.shop = shop;
	}
	public final String getMenu1() {
		return menu1;
	}
	public final void setMenu1(String menu1) {
		this.menu1 = menu1;
	}
	public final String getMenu2() {
		return menu2;
	}
	public final void setMenu2(String menu2) {
		this.menu2 = menu2;
	}
	public final String getMenu3() {
		return menu3;
	}
	public final void setMenu3(String menu3) {
		this.menu3 = menu3;
	}
	public MenuDTO(String shop, String menu1, String menu2, String menu3) {
		this.shop = shop;
		this.menu1 = menu1;
		this.menu2 = menu2;
		this.menu3 = menu3;
	}
	public MenuDTO() {
	}
	
}
