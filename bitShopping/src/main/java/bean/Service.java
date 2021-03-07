package bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Service {
	private int sno ; // 글번호
	private String swriter;
	private String stitle;
	private String scontent;
	private Date swritedate;
	private String simg;
	private MultipartFile abcd ;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSwriter() {
		return swriter;
	}
	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public Date getSwritedate() {
		return swritedate;
	}
	public void setSwritedate(Date swritedate) {
		this.swritedate = swritedate;
	}
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	public Service() {
		super();
	}
	public MultipartFile getAbcd() {
		return abcd;
	}
	public void setAbcd(MultipartFile abcd) {
		this.abcd = abcd;
		
		if (this.abcd != null) {
			this.simg = this.abcd.getOriginalFilename();
		}
	}
	@Override
	public String toString() {
		return "Serivce [sno=" + sno + ", swriter=" + swriter + ", stitle=" + stitle + ", scontent=" + scontent
				+ ", swritedate=" + swritedate + ", simg=" + simg + "]";
	}
	
	
	
}
