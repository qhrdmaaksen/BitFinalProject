package bean;

public class TOP50 {
	private String productname ; // 상품 이름
	private int pno ; // 상품 번호
	private int price ; // 가격
	private int amount ; // 총 금액
	private String pimg1 ; // 상품 사진
	
	public TOP50() {	}

	public TOP50(String productname, int pno, int price, int amount, String pimg1) {
		super();
		this.productname = productname;
		this.pno = pno;
		this.price = price;
		this.amount = amount;
		this.pimg1 = pimg1;
	}

	@Override
	public String toString() {
		return "TOP50 [productname=" + productname + ", pno=" + pno + ", price=" + price + ", amount=" + amount
				+ ", pimg1=" + pimg1 + "]";
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPimg1() {
		return pimg1;
	}

	public void setPimg1(String pimg1) {
		this.pimg1 = pimg1;
	}

	

	
	
	
	
	

	

		
	
}