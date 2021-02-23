package shopping;

public class ShoppingInfo {
	//mid 컬럼은 shoppingInfos 테이블에 저장할 때만 사용 된다. 
	private String mid; // 고객 아이디 
	private int productcode; // 상품 번호 
	private String productname; // 상품 이름
	private int qty; // 상품 수량
	private int price; // 상품 가격
	private double discount; // 할인
	private String pimg; // 상품 사진 

	public ShoppingInfo() {
		
	}

	@Override
	public String toString() {
		return "ShoppingInfo [mid=" + mid + ", productcode=" + productcode + ", productname=" + productname + ", qty="
				+ qty + ", price=" + price + ", discount=" + discount + ", pimg=" + pimg + "]";
	}

	public ShoppingInfo(String mid, int productcode, String productname, int qty, int price, double discount,
			String pimg) {
		super();
		this.mid = mid;
		this.productcode = productcode;
		this.productname = productname;
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
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

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	
	
	
	
}
