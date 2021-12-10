package senasic.web.DTO;

public class MenuDTO {
	private String shop;
	private String menu1;
	private int price1;
	private String menu2;
	private int price2;
	private String menu3;
	private int price3;
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
	public final int getPrice1() {
		return price1;
	}
	public final void setPrice1(int price1) {
		this.price1 = price1;
	}
	public final String getMenu2() {
		return menu2;
	}
	public final void setMenu2(String menu2) {
		this.menu2 = menu2;
	}
	public final int getPrice2() {
		return price2;
	}
	public final void setPrice2(int price2) {
		this.price2 = price2;
	}
	public final String getMenu3() {
		return menu3;
	}
	public final void setMenu3(String menu3) {
		this.menu3 = menu3;
	}
	public final int getPrice3() {
		return price3;
	}
	public final void setPrice3(int price3) {
		this.price3 = price3;
	}
	public MenuDTO(String shop, String menu1, int price1, String menu2, int price2, String menu3, int price3) {
		this.shop = shop;
		this.menu1 = menu1;
		this.price1 = price1;
		this.menu2 = menu2;
		this.price2 = price2;
		this.menu3 = menu3;
		this.price3 = price3;
	}

	
}
