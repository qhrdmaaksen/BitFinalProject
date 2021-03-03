package bean;

public class Order {
	private int oid ; // 주문 번호
	private String mid ; // 고객 아이디
	private String orderdate ; // 주문 날짜
	private String remark ; 
	
	
	public Order() {	}


	public Order(int oid, String mid, String orderdate, String remark) {
		
		this.oid = oid;
		this.mid = mid;
		this.orderdate = orderdate;
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


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Override
	public String toString() {
		return "Order [oid=" + oid + ", mid=" + mid + ", orderdate=" + orderdate + ", remark=" + remark + "]";
	}
	
}
	
