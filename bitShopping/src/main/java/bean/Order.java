package bean;

public class Order {
	private int oid ; // 주문 번호
	private String mid ; // 고객 아이디
	private String orderdate ; // 주문 날짜
	private String invoice ; // 송장 번호 
	private String remark ; 
	
	
	public Order() {	}

	

	@Override
	public String toString() {
		return "Order [oid=" + oid + ", mid=" + mid + ", orderdate=" + orderdate + ", invoice=" + invoice + ", remark="
				+ remark + "]";
	}



	public Order(int oid, String mid, String orderdate, String invoice, String remark) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.orderdate = orderdate;
		this.invoice = invoice;
		this.remark = remark;
	}



	public int getOid() {
		return oid;
	}


	public void setOid(int oid) {
		this.oid = oid;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}


	public String getInvoice() {
		return invoice;
	}


	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}