package bean;

public class OrderDetail {
	private int odid;
	private int oid;
	private int pno;
	private int qty;
	private int amount;
	private String remark;
	
	
	public OrderDetail() {
		
	}

	public OrderDetail(int odid, int oid, int pno, int qty, int amount, String remark) {
		
		this.odid = odid;
		this.oid = oid;
		this.pno = pno;
		this.qty = qty;
		this.amount = amount;
		this.remark = remark;
	}

	public int getOdid() {
		return odid;
	}

	public void setOdid(int odid) {
		this.odid = odid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "OrderDetail [odid=" + odid + ", oid=" + oid + ", pno=" + pno + ", qty=" + qty + ", amount=" + amount
				+ ", remark=" + remark + "]";
	}
}
	