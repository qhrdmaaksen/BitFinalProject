package bean;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private final String MUST_INPUT = "필수 입력 사항입니다." ;
	
	private int pno ;	
	
	@Length(min=3, max=15, message="상품 이름은 3자리 이상 15자리 이하이어야 합니다.")
	private String productname ;
	
	@NotNull(message = "상품 코드는 " + MUST_INPUT)
	private int productcode ;
	
	@Min(value = 100, message = "상품 가격은 100원 이상이어야 합니다.")
	private int price ;
	
	@Min(value=10, message="재고 수량은 최소 10개 이상이어야 합니다")
	private int pqty ;
	
	@NotEmpty(message = "카테고리는 필수 입력사항 입니다.")
	private String pcategory ;
	
	private String pcontents ;
	
	@NotEmpty(message= "이미지는 한 개 이상 등록 해 주세요.")
	private String pimg1 ;
	private String pimg2 ;
	private String pimg3 ;
	
	private MultipartFile abcd1 ;	
	
	public MultipartFile getAbcd1() {
		return abcd1;
	}
	public void setAbcd1(MultipartFile abcd1) {
		this.abcd1 = abcd1;
		
		if (this.abcd1 != null) {
			this.pimg1 = this.abcd1.getOriginalFilename();
		}
	}
	
	private MultipartFile abcd2 ;	
	
	public MultipartFile getAbcd2() {
		return abcd2;
	}
	public void setAbcd2(MultipartFile abcd2) {
		this.abcd2 = abcd2;
		
		if (this.abcd2 != null) {
			this.pimg2 = this.abcd2.getOriginalFilename();
		}
	}
	
	private MultipartFile abcd3 ;	
	
	public MultipartFile getAbcd3() {
		return abcd3;
	}
	public void setAbcd3(MultipartFile abcd3) {
		this.abcd3 = abcd3;
		
		if (this.abcd3 != null) {
			this.pimg3 = this.abcd3.getOriginalFilename();
		}
	}

	public Product() {	}
	@Override
	public String toString() {
		return "Product [MUST_INPUT=" + MUST_INPUT + ", pno=" + pno + ", productname=" + productname + ", productcode="
				+ productcode + ", price=" + price + ", pqty=" + pqty + ", pcategory=" + pcategory + ", pcontents="
				+ pcontents + ", pimg1=" + pimg1 + ", pimg2=" + pimg2 + ", pimg3=" + pimg3 + ", abcd1=" + abcd1
				+ ", abcd2=" + abcd2 + ", abcd3=" + abcd3 + "]";
	}
	public Product(int pno, String productname, int productcode, int price, int pqty, String pcategory,
			String pcontents, String pimg1, String pimg2, String pimg3, MultipartFile abcd1, MultipartFile abcd2,
			MultipartFile abcd3) {
		super();
		this.pno = pno;
		this.productname = productname;
		this.productcode = productcode;
		this.price = price;
		this.pqty = pqty;
		this.pcategory = pcategory;
		this.pcontents = pcontents;
		this.pimg1 = pimg1;
		this.pimg2 = pimg2;
		this.pimg3 = pimg3;
		this.abcd1 = abcd1;
		this.abcd2 = abcd2;
		this.abcd3 = abcd3;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductcode() {
		return productcode;
	}
	public void setProductcode(int productcode) {
		this.productcode = productcode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getPimg1() {
		return pimg1;
	}
	public void setPimg1(String pimg1) {
		this.pimg1 = pimg1;
	}
	public String getPimg2() {
		return pimg2;
	}
	public void setPimg2(String pimg2) {
		this.pimg2 = pimg2;
	}
	public String getPimg3() {
		return pimg3;
	}
	public void setPimg3(String pimg3) {
		this.pimg3 = pimg3;
	}

	
	
	
}