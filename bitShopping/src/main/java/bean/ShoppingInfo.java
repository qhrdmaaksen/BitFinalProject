package bean;

public class ShoppingInfo {
	private String mid;
	private int productcode;
	private int qty;
	private int price;
	private int discount;
	private String pimg;
	
	public ShoppingInfo() {
		
	}

	public ShoppingInfo(String mid, int productcode, int qty, int price, int discount, String pimg) {
		
		this.mid = mid;
		this.productcode = productcode;
		this.qty = qty;
		this.price = price;
		this.discount = discount;
		this.pimg = pimg;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getProductcode() {
		return productcode;
	}

	public void setProductcode(int productcode) {
		this.productcode = productcode;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	@Override
	public String toString() {
		return "ShoppingInfo [mid=" + mid + ", productcode=" + productcode + ", qty=" + qty + ", price=" + price
				+ ", discount=" + discount + ", pimg=" + pimg + "]";
	}
	
	

}
