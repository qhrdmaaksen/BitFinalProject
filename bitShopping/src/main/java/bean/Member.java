package bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	
	private final String MUST_INPUT = "필수 입력 사항입니다." ;	
	
	@Length(min=3, max=10, message="아이디는 최소 4자리 최대 15자리 입니다.")
	private static String mid ;
	
	@Length(min=4, max=10, message="비밀번호는 최소 4자리 최대 10자리 입니다.")
	private String password ;
	
	@Length(min=2, max=10, message="이름은 최소 2자리 최대 10자리 입니다.")
	private String name ;
	
	@Email(message="이메일 주소는 " + MUST_INPUT)
	private String email ;
	
	@Length(min = 10, max = 11, message = "전화번호는 특수기호 없이 숫자만 입력해 주세요.")
	private String phone ;
	
	@NotEmpty(message= "우편 번호는(은) " + MUST_INPUT)
	private String zipcode ;
	
	@NotEmpty(message= "주소는(은) " + MUST_INPUT)
	private String address1 ;
	private String address2 ;
	
	@NotNull(message="성별은 반드시 체크가 되어야 합니다.")
	private String gender ;
	
	@Pattern(regexp = "\\d{4}[-/]\\d{2}[-/]\\d{2}", message = "생일은 yyyy/MM/dd 또는 yyyy-MM-dd 형식으로 입력해 주세요.")
	private String birth ;
	
	private int mpoint ;
	private String createdate ; // 가입 일자
	
	
	
	public Member() {	}



	@Override
	public String toString() {
		return "Member [MUST_INPUT=" + MUST_INPUT + ", mid=" + mid + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", phone=" + phone + ", zipcode=" + zipcode + ", address1=" + address1
				+ ", address2=" + address2 + ", gender=" + gender + ", birth=" + birth + ", mpoint=" + mpoint
				+ ", createdate=" + createdate + "]";
	}



	public Member(String mid, String password, String name, String email, String phone, String zipcode, String address1,
			String address2, String gender, String birth, int mpoint, String createdate) {
		super();
		this.mid = mid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.gender = gender;
		this.birth = birth;
		this.mpoint = mpoint;
		this.createdate = createdate;
	}



	public static String getMid() {
		return mid;
	}



	public void setMid(String mid) {
		this.mid = mid;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getZipcode() {
		return zipcode;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	public String getAddress1() {
		return address1;
	}



	public void setAddress1(String address1) {
		this.address1 = address1;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getBirth() {
		return birth;
	}



	public void setBirth(String birth) {
		this.birth = birth;
	}



	public int getMpoint() {
		return mpoint;
	}



	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}



	public String getCreatedate() {
		return createdate;
	}



	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}



	

	
	
	
	
	

}
