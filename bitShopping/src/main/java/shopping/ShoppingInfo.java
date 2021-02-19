package shopping;

public class ShoppingInfo {
	//mid 컬럼은 shoppingInfos 테이블에 저장할 때만 사용 된다. 
	private String mid; // 고객 아이디 
	private int productcode; // 상품 번호 
	private int qty; // 상품 수량
	private int price; // 상품 가격
	private int discount; // 할인
	private String pimg; // 상품 사진 

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
